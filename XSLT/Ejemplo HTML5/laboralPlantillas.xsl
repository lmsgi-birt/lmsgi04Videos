<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat" />

<!-- Plantilla principal: intercalamos código HTML con datos XML -->
<xsl:template match="/curriculum" >

<html lang="es">
    <head>
        <meta name="description" content="Ejemplo de HTML5" />
        <meta name="keywords" content="HTML5, CSS3, JavaScript" />
        <title>Tarea de evaluación 1 - Experiencia laboral</title>
        
        <!-- Hoja de estilo enlazada -->
        <link rel="stylesheet" href="style.css"/>
        
        <!-- Estilos en documento -->
        <style type="text/css">
        
            h3{color: #5F9EA0;font-size:27px;}
            body{font-family:lucida console;}
            
        </style>
    </head>
    <body>	
        <!-- Título de la página -->	
        <h1 style="text-align:center;font-size:62px; letter-spacing:10px; margin-bottom:70px;">EXPERIENCIA LABORAL</h1>

	    <!-- bloque tipo tabla para presentar la experiencia laboral -->	
		<table style="margin: 0 auto">
            <caption class="tabla"></caption>
            <tr>
                <th class="descripcion"><h3>EMPRESA Y LABORES DESEMPEÑADAS</h3></th>	
                <th class="cargo"><h3>CARGO</h3></th>
                <th class="año"><h3>AÑO</h3></th> 
		    </tr>

            <xsl:apply-templates select="experiencia-laboral/puesto"/>
		</table>

        <!--Enlace para volver hacía la index-->
		<a class="enlaces volver" href="index.xml">Volver a mis datos</a>
    </body>
</html>

</xsl:template>

<xsl:template match="puesto">
    <tr>
        <td><strong><xsl:value-of select="empresa/@nombre"/></strong><br />
        <p><xsl:value-of select="empresa"/></p></td>
        <td><xsl:value-of select="cargo"/></td>		
        <td><xsl:value-of select="fecha"/></td>
    </tr>
</xsl:template>

</xsl:stylesheet>
