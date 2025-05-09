<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn = new mysqli("localhost", "root", "", "onlinestore");
    $store_id = (int)$_POST['store_id'];
    $template_id = (int)$_POST['template_id'];


    $result = $conn->query("SELECT id, field_type FROM store_template_fields WHERE template_id = $template_id");
    $fields = [];
    while ($row = $result->fetch_assoc()) {
        $fields[] = $row;
    }
    $upload_dir = "uploads/template_$template_id";

    // Check if the directory exists, if not, create it
    if (!file_exists($upload_dir)) {
        mkdir($upload_dir, 0777, true);
    }

    // // Step 2: Remove all existing files in the template folder
    // if (file_exists($upload_dir)) {
    //     $files = glob("$upload_dir/*");
    //     foreach ($files as $file) {
    //         if (is_file($file)) {
    //             unlink($file); // Delete the file
    //         }
    //     }
    // }

    foreach ($fields as $field) {
        $field_id = $field['id'];
        $field_type = $field['field_type'];
        $value = null;

        if ($field_type === 'file') {
            $existing_value2 = $conn->query("SELECT value FROM store_template_field_values WHERE store_id = $store_id AND field_id = $field_id AND template_id = $template_id");
            if ($existing_value2 && $prevpath = $existing_value2->fetch_assoc()) {
                $value = $prevpath['value'];
            }
            if (isset($_FILES['field_' . $field_id]) && $_FILES['field_' . $field_id]['error'] === UPLOAD_ERR_OK) {
                $file = $_FILES['field_' . $field_id];
                $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
                $filename = uniqid() . '.' . $ext;
                $target_path = "$upload_dir/$filename";

                if (move_uploaded_file($file['tmp_name'], $target_path)) {
                    $value = $target_path;
                }
            }
        } else {
            //echo $field_type;
            $value = isset($_POST['values'][$field_id]) ? $_POST['values'][$field_id] : null;
        }

        if ($value !== null) {
            $existing_value = $conn->query("SELECT value FROM store_template_field_values WHERE store_id = $store_id AND field_id = $field_id AND template_id = $template_id");
            if ($existing_value && $old = $existing_value->fetch_assoc()) {
                $old_path = $old['value'];
                if (isset($_FILES['field_' . $field_id]) && $_FILES['field_' . $field_id]['error'] === UPLOAD_ERR_OK) {
                    if (file_exists($old_path)) {
                        unlink($old_path);
                    }
                }
            }



            if ($existing_value->num_rows > 0) {
                $stmt = $conn->prepare("UPDATE store_template_field_values SET value = ? WHERE store_id = ? AND template_id = ? AND field_id = ?");
                $stmt->bind_param("siis", $value, $store_id, $template_id, $field_id);
            } else {
                $stmt = $conn->prepare("INSERT INTO store_template_field_values (store_id, template_id, field_id, value) VALUES (?, ?, ?, ?)");
                $stmt->bind_param("iiis", $store_id, $template_id, $field_id, $value);
            }

            $stmt->execute();
        }
    }
    echo "<script>alert('Customization saved!'); window.location='index.php';</script>";
}
