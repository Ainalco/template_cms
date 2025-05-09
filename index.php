<!DOCTYPE html>
<html>

<head>
    <title>Store Template Customizer</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
        .template-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
        }

        .template-card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .template-card.selected {
            border: 3px solid #0d6efd;
        }
    </style>
</head>

<body class="p-4">
    <div class="container">
        <h2 class="mb-4">Customize Your Store</h2>

        <div class="row" id="template-options">
            <?php
            $conn = new mysqli("localhost", "root", "", "onlinestore");
            $active_template_res = $conn->query("SELECT template_id FROM active_template LIMIT 1");
            $active_template_row = $active_template_res->fetch_assoc();
            $active_template_id = $active_template_row['template_id'] ?? 0;
            $templates = $conn->query("SELECT * FROM templates");
            while ($t = $templates->fetch_assoc()): 
             $isActive = ($t['id'] == $active_template_id) ? 'selected' : '';
            ?>
                <div class="col-md-3">
                    <div class="card mb-3 template-card <?php echo $isActive ?>" data-id="<?= $t['id'] ?>">
                        <img src="<?= $t['thumbnail'] ?>" class="card-img-top" height="200" style="object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title text-center"><?= $t['name'] ?></h5>
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        </div>

        <!-- Preview Button -->
        <div class="text-center">
            <a href="#" id="previewBtn" target="_blank" class="btn btn-sm btn-secondary mt-3 disabled">Preview</a>
            <a href="javascript:void(0);" id="activetheme" data-id='' class="btn btn-sm btn-secondary mt-3 disabled">Active</a>
        </div>

        <form id="customization-form" method="POST" action="save.php" enctype="multipart/form-data" class="mt-4" style="display:none">
            <input type="hidden" name="store_id" value="1">
            <input type="hidden" id="selected_template_id" name="template_id">
            <div id="fields-container"></div>
            <button type="submit" class="btn btn-primary mt-3">Save Customizations</button>
        </form>
    </div>

    <script>
        $(function() {
            $('.template-card').click(function() {
                var template_id = $(this).data('id');
                $('#selected_template_id').val(template_id);
                $('#previewBtn').attr('href', 'preview.php?template_id=' + template_id).removeClass('disabled');
                $('#activetheme').attr('data-id', template_id).removeClass('disabled');
                $('.template-card').removeClass('selected');
                $(this).addClass('selected');
                $.get('get_fields.php', {
                    template_id: template_id
                }, function(data) {
                    $('#fields-container').html(data);
                    $('#customization-form').show();
                });
            });
        });
        $(document).ready(function() {
            $('#activetheme').on('click', function() {
                const templateId = $(this).data('id');
                // Send AJAX request to set active template
                $.post('set_active_template.php', {
                    template_id: templateId
                }, function(response) {
                    console.log('Server response:', response);
                    // Optionally show a success message or toast here
                });
            });
        });
    </script>
</body>

</html>