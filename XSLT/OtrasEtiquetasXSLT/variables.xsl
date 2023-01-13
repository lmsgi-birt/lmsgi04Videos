<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" />
	<xsl:template match="/Resultados" >
	<html>
	<body>
		<p>Curso: <xsl:value-of select="curso" /></p>
		<p>Centro: <xsl:value-of select="centro" /></p>
		
		<h3>Alumnado</h3>
		<table>
		<tr><th>Nombre</th><th>Código</th></tr>
			<xsl:apply-templates select="Alumnos/alumno"/>
		</table>
		
		<h3>Módulos</h3>
		<ul>
			<xsl:apply-templates select="Asignaturas/Asignatura"/>
		</ul>
		
		<h3>Calificaciones</h3>
		<table>
			<tr><th>Alumno/a</th><th>Módulo</th><th>Nota</th></tr>
			<xsl:apply-templates select="Notas/Nota"/>
		</table>
		
	</body>
	</html>
	</xsl:template>
	
	<!-- Plantilla para el alumnado -->
	<xsl:template match="alumno">			
			<tr><td><xsl:value-of select="nombre" /></td><td><xsl:value-of select="cod" /></td></tr>		
	</xsl:template>
	
	<!-- Plantilla para los módulos -->
	<xsl:template match="Asignatura">			
			<li><xsl:value-of select="siglas" /></li>	
	</xsl:template>
	
	<!-- Plantilla para las notas -->
	<xsl:template match="Nota">
		<xsl:variable name="estudiante" select="alum" />
		<xsl:variable name="modulo" select="asig" />
		<tr>
			<td><xsl:value-of select="//alumno[cod=$estudiante]/nombre" /></td>
			<td><xsl:value-of select="//Asignatura[cod=$modulo]/siglas" /></td>
			<td><xsl:value-of select="calificacion" /></td>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>
