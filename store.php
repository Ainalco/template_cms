<?php
if (isset($_GET['store_id'])) {
    $store_id = (int)$_GET['store_id'];
    $conn = new mysqli("localhost", "root", "", "onlinestore");

    $result = $conn->query("SELECT template_id FROM store_template_field_values WHERE store_id = $store_id LIMIT 1");
    $template_id = $result->fetch_assoc()['template_id'];

    $template = $conn->query("SELECT html_file FROM templates WHERE id = $template_id")->fetch_assoc();
    $html = file_get_contents($template['html_file']);

    $values = $conn->query("SELECT f.field_name, v.value FROM store_template_field_values v JOIN store_template_fields f ON v.field_id = f.id WHERE v.store_id = $store_id");
    while ($row = $values->fetch_assoc()) {
        $html = str_replace("{{{$row['field_name']}}}", $row['value'], $html);
    }
    echo $html;
}
?>