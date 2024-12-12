<?php
// Connexion à la base de données
$conn = new mysqli("localhost", "root", "", "morpion-foot");

$playerName = $_POST['playerName'];
$rowCriteria = $_POST['rowCriteria'];
$columnCriteria = $_POST['columnCriteria'];

// Vérifier si le joueur correspond aux critères
$validationQuery = "
    SELECT 1 
    FROM joueurs 
    WHERE nom = ? 
      AND FIND_IN_SET(?, titres_ligue) 
      AND FIND_IN_SET(?, titres_internationaux)";
$stmt = $conn->prepare($validationQuery);
$stmt->bind_param("sss", $playerName, $rowCriteria, $columnCriteria);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo json_encode(["valid" => true]);
} else {
    echo json_encode(["valid" => false]);
}

$stmt->close();
$conn->close();
?>
