<html>

<head>
	<title>Sistema Experto</title>
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
</head>

<body>
<header>
	
	<h1>Sistema para detección de enfermedades digestivas</h1>


</header>


<main>
<?php

//CONECTAMOS CON LA BD
require "conexion.php";

//OBTENEMOS EL NÚMERO DEL NODO DENTRO DEL ÁRBOL (PARA SABER QUÉ CAMINO HEMOS TOMADO)

$nodo = 1;
$nodoRepuesto = 0;
$numPregunta = 1;
$proxPregunta = 2;

if(isset($_GET['n'])) {
	$nodo = $_GET["n"];
}

if(isset($_GET['r'])) {
	$nodoRepuesto = $_GET["r"];
}

if(isset($_GET['np'])) {
	$numPregunta = $_GET["np"];
	$proxPregunta = $numPregunta+1;
}



//------------------------------------------------------
//SI HAY UN NODO DE REPUESTO SE AÑADE A LA LISTA (ARRAY)
if($nodoRepuesto!=0){

	session_start();	//iniciamos la sesión
	$nodosRepuesto =array();	//creamos el array
 

	//COMPROBAMOS SI EXISTE LA VARIABLE DE SESIÓN (ES DECIR, SI HEMOS GUARDADO ALGÚN NODO EN EL QUE DUDÁSEMOS)
	if(isset($_SESSION['nodosRepuesto'])){
		
		$nodosRepuesto = $_SESSION['nodosRepuesto'];	//Guardamos el array de la sesión en el array vacío
		array_push($nodosRepuesto,$nodoRepuesto);		//añadimos el nodo a la lista
		$_SESSION['nodosRepuesto']=$nodosRepuesto;		//Volvemos a guardar el array de la sesión, actualizado
		
	}
	
	
	else{
		array_push($nodosRepuesto,$nodoRepuesto);		//añadimos el nodo a la lista
		$_SESSION['nodosRepuesto']=$nodosRepuesto;
	}
	
	
}


//------------------------------------------------------
//CALCULAMOS LO SIGUIENTES PASOS A SEGUIR

$nodoSi = $nodo * 2;
$nodoNo = $nodo * 2 + 1;

$nodoProbablementeSi = $nodoSi;
$nodoProbablementeNo = $nodoNo;

//-----------------------------------------------------
//OBTENEMOS UN NÚMERO AL AZAR ENTRE CERO Y UNO
//lo hacemos para evitar que tenga una tendencia a recorrer siempre el mismo camino

$aleatrio = rand(0,1);

$nodoAleatorio 	  = 0;	//EL QUE ELEGIMOS
$nodoAleatorioAlt = 0;	//EL CONTRARIO

if($aleatrio==0){
	$nodoAleatorio = $nodoNo;
	$nodoAleatorioAlt = $nodoSi;
}

else{
	$nodoAleatorio = $nodoSi;
	$nodoAleatorioAlt = $nodoNo;
}
//-----------------------------------------------------
//HACEMOS LA CONSULTA A LA BD
//$consulta = "SELECT texto,pregunta FROM arbol WHERE nodo = ".$nodo.";";
$consulta = "SELECT texto,pregunta FROM enfermedades WHERE nodo = ".$nodo.";";
$texto = '';
$pregunta = true;
if ($resultado = mysqli_query($enlace, $consulta)) {
	if($resultado->num_rows === 0)
    {
        echo "<div class='noresultado'>";
		echo 'Lo sentimos.Por el momento no contamos con información disponible para brindar un diagnóstico, acuda con 
		su médico de confianza a la brevedad posible.';
		echo "</div>";
		echo "<a class= 'boton' href=principal.php>Volver a la pagina principal</a>";
    }

	else{
		while ($fila = mysqli_fetch_row($resultado)) {
			$texto 	  = $fila[0];
			$pregunta = $fila[1];
		}
		
		
		//SI NO ES UNA PREGUNTA ES UN RESULTADO FINAL (JAVINATOR DA UNA RESPUESTA)
		echo "<div class='pregunta'>";
		echo "<h2>#".$numPregunta."</h2>";
		echo"</div>";
		if($pregunta == 0){
			
			echo "<div class='contenedorPregunta'>";
			echo "<h2>Tus síntomas apuntan a que padeces de ". $texto . " .Acude con tu médico de confianza
			a la brevedad posible </h2>";
			echo "</div>";
			
			
			echo "<div class='contenedorRespuestas'>";
			echo "<a class= 'boton' href=principal.php>Volver a la pagina principal</a>";
			echo "</div>";
		
		}
		
		//SI ES UNA PREGUNTA, PREGUNTAMOS (SI DUDAMOS, EN EL PARÁMETRO "R" GUARDAMOS LA RAMA ALTERNATIVA, SINO VALE CERO)
		else{
			echo "<div class='contenedorPregunta'>";
			echo "<h2>¿Presentas ". $texto . "?</h2>";
			echo "</div>";
			
			echo "<div class='contenedorRespuestas'>";
			
			echo "<a class='boton' href='index.php?n=".$nodoSi."&r=0&np=".$proxPregunta."'>SÍ</a>";
			echo "<a class='boton' href='index.php?n=".$nodoNo."&r=0&np=".$proxPregunta."'>NO</a>";
			echo "<div class='limpiar'></div>";
		
			echo "</div>";
		}
		
	}

    mysqli_free_result($resultado);
}

?>

</main>
</body>
</html>