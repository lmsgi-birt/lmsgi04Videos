<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" />

<!-- Plantilla principal. Selecciono los nodos o elementos con los que quiero trabajar -->
<xsl:template match="/Resultados" >
	<html>
	<body>
		<!-- Visualizo los valores que me interesan. Los combino con código HTML -->
		<p>Curso: <xsl:value-of select="curso" /></p>
		<p>Centro: <xsl:value-of select="centro" /></p>

		<h1>Alumado</h1>
		<table>
			<tr>
				<th>Nombre</th>
				<th>Código</th>
			</tr>

			<!-- 
				Utilizo apply-templates para seleccionar los nodos que quiero utilizar
				Con el atributo select, indico la expresion XPath. Será relativa al template match padre
				Puedo usar sort para ordenar los elementos seleccionados
			-->
			<xsl:apply-templates select="Alumnos/alumno">
				<xsl:sort select="nombre"  order="descending" />
			</xsl:apply-templates>
		</table>
		
		
		<h1>Módulos	</h1>
		<ul>
			<!-- Selecciono los módulos que quiero formatear -->
			<xsl:apply-templates select="Asignaturas/Asignatura">
			<xsl:sort select="siglas">
				
			</xsl:sort>
			</xsl:apply-templates>
		</ul>

		<h1>Alumado</h1>
		<table style="border: solid 1px">
			<tr>
				<th colspan="3">CALIFICACIONES</th>
			</tr>
			<tr>
				<th>Alumno</th>
				<th>Módulo</th>
				<th>Nota</th>
			</tr>

			<!-- Selecciono las calificaciones que quiero formatear -->
			<xsl:apply-templates select="Notas/Nota">
				<xsl:sort select="nombre"  order="descending" />
			</xsl:apply-templates>
		</table>	
	</body>
	</html>
</xsl:template>
	
<!-- 
	Plantilla para el alumnado. Se aplicará a cada uno de los elementos "alumno" que se han encontrado en el XML
	Se aplicará tantas veces como elementos tengamos.
	Es importante distinguir el código HTML que debe repetirse con cada elemento y que irá dentro de la plantilla,
	del que es común a todos los nodos y debe ir fuera, en la plantilla padre.
-->
<xsl:template match="alumno" >
		<tr>
			<td><xsl:value-of select="nombre" /></td>
			<td><xsl:value-of select="cod" /></td>
		</tr>
</xsl:template>
	
<!-- Plantilla para los módulos -->
<xsl:template match="Asignatura" >
	<li><xsl:value-of select="siglas" /> </li>
</xsl:template>
	
<!-- Plantilla para las notas -->
<xsl:template match="Nota" >
	<tr>
		<td><xsl:value-of select="alum" /></td>
		<td><xsl:value-of select="asig" /></td>
		<td><xsl:value-of select="calificacion" /></td>
	</tr>
</xsl:template>

</xsl:stylesheet>
