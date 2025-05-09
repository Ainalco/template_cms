<?php 
if (isset($_GET['template_id'])) {
    $template_id = (int)$_GET['template_id'];
    //$store_id = (int)$_GET['store_id'];
    $conn = new mysqli("localhost", "root", "", "onlinestore");

    // Step 1: Get saved values for this store/template
    $saved = [];
    $saved_q = $conn->query("SELECT field_id, value FROM store_template_field_values WHERE template_id = $template_id");
    while ($row = $saved_q->fetch_assoc()) {
        $saved[(int)$row['field_id']] = $row['value'];
    }

    // Step 2: Get all fields for the template
    $fields = $conn->query("SELECT * FROM store_template_fields WHERE template_id = $template_id");
    while ($f = $fields->fetch_assoc()) {
        $field_id = (int)$f['id'];
        $value = isset($saved[$field_id]) ? htmlspecialchars($saved[$field_id]) : '';

        echo "<div class='form-group'>";
        echo "<label>{$f['label']}</label>";

        if ($f['field_type'] === 'color' || $f['field_type'] === 'text') {
            echo "<input type='{$f['field_type']}' name='values[{$field_id}]' class='form-control' value='{$value}'>";
        }
        elseif ($f['field_type'] === 'textarea') {
            echo "<textarea name='values[{$field_id}]' rows='4' class='form-control'>{$value}</textarea>";
        }
        elseif ($f['field_type'] === 'file') {
            echo "<input type='file' name='field_{$field_id}' class='form-control-file'>";
            // Optionally show the current image preview
            if (!empty($value) && file_exists($value)) {
                echo "<br><img src='{$value}' alt='Current Image' style='max-width: 200px; margin-top: 10px;'>";
            }
        }

        echo "</div>";
    }

    exit;
}
