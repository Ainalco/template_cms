<?php
$conn = new mysqli("localhost", "root", "", "onlinestore");
$template_id = intval($_POST['template_id'] ?? 0);

// First, reset all to inactive
$conn->query("UPDATE active_template SET template_id = 0");

// Then, activate selected one
$conn->query("UPDATE active_template SET template_id =  $template_id WHERE id = 1");