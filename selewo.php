<?php
/*
Codigo php administrador de bases de datos para el videojuego
Selewo, por Omwekiatl 2021, este archivo debe llamarse
"selewo.php" y la informacion se pasa con "?msj=" en la url
*/

// datos de conexion y servidor
$server = 'localhost';
$username = 'u630689278_omi';
$password = '10382393744IngElectronica';
$database = 'u630689278_games';

function servicio()
{
	global $server, $username, $password, $database;
	// hacer la conexion con el servidor
	$conexion = mysqli_connect($server, $username, $password);
	if (!$conexion)
	{
		echo "error";
		exit;
	}
	if (!mysqli_select_db($conexion, $database))
	{
		mysqli_close($conexion);
		echo "error";
		exit;
	}
	// obtener informacion entrante
	$respuesta = "";
	$msj = explode('|', $_GET['msj']);
	$lengt = count($msj);
	if ($lengt == 3)
	{
		// depurar segun tipo de mensaje
		if ($msj[0] == '')
		{
			$respuesta = obtener($conexion);
		}
		else
		{
			$respuesta = subir($conexion, $msj[0], $msj[1], $msj[2]);
		}
	}
	else
	{
		mysqli_close($conexion);
		echo "error";
		exit;
	}
	// verificar que de alguna respuesta
	if ($respuesta == "")
	{
		$respuesta = "error";
	}
	mysqli_close($conexion);
	echo $respuesta;
}

function obtener($conexion)
{
	$query = mysqli_query($conexion, "SELECT jugadores, puntajes FROM informacion WHERE game='selewo'");
	if ($query)
	{
		$data = mysqli_fetch_row($query);
		$res = $data[0] . '|' . $data[1];
	}
	else
	{
		$res = "error";
	}
	return $res;
}

function subir($conexion, $nombre, $puntos, $total)
{
	$query1 = mysqli_query($conexion, "SELECT puntajes FROM informacion WHERE game='selewo'");
	if ($query1)
	{
		$data = explode('|', mysqli_fetch_row($query1)[0])[0];
		if ($puntos > $data)
		{
			$pts = $puntos . '|' . $total;
			$query2 = mysqli_query($conexion, "UPDATE informacion SET jugadores='$nombre', puntajes='$pts' WHERE game='selewo'");
			if ($query2)
			{
				$res = $nombre . '|' . $pts;
			}
			else
			{
				$res = "error";
			}
		}
		else
		{
			$res = "||";
		}
	}
	else
	{
		$res = "error";
	}
	return $res;
}

servicio();
?>
