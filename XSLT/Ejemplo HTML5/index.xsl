<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />

<!-- Plantilla principal: intercalamos código HTML con datos XML -->
<xsl:template match="/curriculum" >

<html lang="es">
<head>
	
    <meta name="description" content="Ejemplo de HTML5" />
    <meta name="keywords" content="HTML5, CSS3, JavaScript" />
	<title>Tarea de evaluación 1</title>
	
	<!-- Hoja de estilo enlazada -->
	<link rel="stylesheet" href="style.css"/>
	
	<!-- Estilos en documento -->
	<style type="text/css">
	    h3{color: #5F9EA0; font-size:27px;}
		body{font-family:lucida console;}
		
	</style>
	
</head>
<body>

	<!-- Título de la pagina principal -->
	
    <h1 style="text-align:center;font-size:62px; letter-spacing:10px; margin-bottom:70px;">CURRICULUM VITAE</h1>
	
	<!-- Imagen del curriculum (bloque izquierda) -->
	
	<div class="caja_imagen">
		<a href="http://{datos-personales/@web}" target="_blank"><img src="{datos-personales/foto}" alt="foto_perfil" /></a>
	</div>
	
	<!-- Apartado de datos personales (bloque derecha) -->
	
	<div class="caja_datos">
		<h3><u>DATOS PERSONALES</u></h3>
		<ul>
			<li><b>Nombre: </b><xsl:value-of select="datos-personales/nombre" /></li>
			<li><b>Apellidos: </b><xsl:value-of select="datos-personales/apellido" /></li>
			<li><b>Dirección: </b><xsl:value-of select="datos-personales/direccion" /></li>
			<li><b>Email: </b><xsl:value-of select="datos-personales/@email" /></li>
		</ul>
		
	<!-- Apartado de enlaces con lista ordenada -->
		<h3><u>CONOCE MÁS SOBRE MÍ</u></h3>
		<ol>
			<li><a class="enlaces" href="laboral.xml" style="text-decoration:none">Experiencia laboral</a></li>
			<li><a class="enlaces" href="#" style="text-decoration:none">Experiencia académica</a></li>
			<li><a class="enlaces" href="#" style="text-decoration:none">Aficiones</a></li>
		</ol>
	</div>
	
</body>
</html>

</xsl:template>

</xsl:stylesheet>
