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
		<xsl:for-each select="Alumnos/alumno">
		<xsl:sort order="descending" select="nombre"/>
			<tr><td><xsl:value-of select="position()" /></td><td><xsl:value-of select="nombre" /></td></tr>	
		</xsl:for-each>
		</table>
		
		<h3>Módulos</h3>
		<ul>
			<xsl:for-each select="Asignaturas/Asignatura">
			<xsl:sort select="siglas"/>
				<li><xsl:value-of select="siglas" /></li>	
			</xsl:for-each>
		</ul>
		
		<h3>Calificaciones</h3>
		<table>
			<tr><th>Alumno/a</th><th>Módulo</th><th>Nota</th></tr>
			<xsl:for-each select="Notas/Nota">
			<xsl:sort data-type="number" order="descending" select="calificacion"/>
				<xsl:variable name="estudiante" select="alum" />
				<xsl:variable name="modulo" select="asig" />
				<tr>
					<td><xsl:value-of select="//alumno[cod=$estudiante]/nombre" /></td>
					<td><xsl:value-of select="//Asignatura[cod=$modulo]/siglas" /></td>
					<td><xsl:value-of select="calificacion" /></td>
				</tr>
			</xsl:for-each>

		</table>
		
	</body>
	</html>
	</xsl:template>

	
</xsl:stylesheet>
