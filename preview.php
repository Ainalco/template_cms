<?php
$conn = new mysqli("localhost", "root", "", "onlinestore");

// Get active template (latest row or just one row)
$active = $conn->query("SELECT * FROM active_template ORDER BY id DESC LIMIT 1")->fetch_assoc();

$store_id = (int)$active['store_id'];
$template_id = (int)$active['template_id'];

// Get template file
$template = $conn->query("SELECT html_file FROM templates WHERE id = $template_id")->fetch_assoc();
$html = file_get_contents($template['html_file']);

// Get saved values
$values = [];
$result = $conn->query("
    SELECT f.field_name, v.value 
    FROM store_template_field_values v 
    JOIN store_template_fields f ON v.field_id = f.id 
    WHERE v.store_id = $store_id AND v.template_id = $template_id
");

while ($row = $result->fetch_assoc()) {
    $values[$row['field_name']] = $row['value'];
}

// Fallback defaults for missing fields
$defaults = [
    'text_color' => '#333333',
    'text_size' => '16',
    'banner_image' => 'https://via.placeholder.com/1200x300?text=Sample+Banner',
    'contact_info' => 'email@example.com | +1234567890'
];

// Merge values (saved values override defaults)
$final = array_merge($defaults, $values);

// Replace placeholders in template
foreach ($final as $field_name => $value) {
    $html = str_replace("{{{$field_name}}}", $value, $html);
}

echo $html;
?>
