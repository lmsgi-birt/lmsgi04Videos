<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" />

<!-- Plantilla principal: intercalamos código HTML con datos XML -->
<xsl:template match="/" >
	<html>
	<body>
		<p>Primer autor: <xsl:value-of select="/biblioteca/libro/autor" /></p>
	</body>
	</html>
</xsl:template>

</xsl:stylesheet>
