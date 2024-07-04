<?php
require_once('../connect.php');

session_start();
if(isset($_SESSION['email'])) {
try {
	$mysqli = connect();
	$consulta = $mysqli->prepare("SELECT id, titulo, recado, data, validade, sepae_email from recado 
    where (CURDATE() < validade) or (validade is null) ORDER BY id DESC;");
	$consulta->execute();

	$resultado = $consulta->get_result();
	$resultadoFormatado = $resultado->fetch_all(MYSQLI_ASSOC);
} catch (Exception $e) {
	error_log($e->getMessage());
	print_r($mysqli->error);
	exit('Alguma coisa estranha aconteceu...');
}

echo json_encode($resultadoFormatado,  JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

$consulta->close();
$mysqli->close();
} else{
	echo json_encode(0);
}
?>
