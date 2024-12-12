<?php
$conn = new mysqli("localhost", "root", "", "morpion-foot");

// Pour Tester la connexion
if ($conn->connect_error) {
    die("Connexion echouée : " . $conn->connect_error);
}

$rowCriteriaQuery = "SELECT valeur FROM criteres WHERE type='row' ORDER BY RAND() LIMIT 3";
$columnCriteriaQuery = "SELECT valeur FROM criteres WHERE type='column' ORDER BY RAND() LIMIT 3";

$rowCriteriaResult = $conn->query($rowCriteriaQuery);
$columnCriteriaResult = $conn->query($columnCriteriaQuery);

$rowCriteria = [];
$columnCriteria = [];

while ($row = $rowCriteriaResult->fetch_assoc()) {
    $rowCriteria[] = $row['valeur'];
}

while ($col = $columnCriteriaResult->fetch_assoc()) {
    $columnCriteria[] = $col['valeur'];
}

echo json_encode([
    "rowCriteria" => $rowCriteria,
    "columnCriteria" => $columnCriteria
]);

$conn->close();
?>
