<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" />

<!-- Plantilla principal: intercalamos código HTML con datos XML -->
<xsl:template match="//libro" >
	<html>
	<body>
		<h1>Libros</h1>
		<p>Título: <xsl:value-of select="titulo" /></p>
		<p>Publicacion: <xsl:value-of select="fechaPublicacion/@anio" /></p>
		<p>Nombre: <xsl:value-of select="autor" /></p>
	</body>
	</html>
</xsl:template>

</xsl:stylesheet>
