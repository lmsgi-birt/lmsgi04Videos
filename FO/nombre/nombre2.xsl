<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"  > <!--añadir espacio de nombres para fo-->
<xsl:output encoding="utf-8" method="xml" indent="yes" />
	<xsl:template match="/">
		<fo:root>
			<!--contenedor de plantillas-->
			<fo:layout-master-set>
				<!--PlantillaA4-->
				<fo:simple-page-master master-name="A4"
					page-height="29.7cm"
					page-width="21cm"
					margin-top="10mm"
					margin-bottom="10mm"
					margin-left="20mm"
					margin-right="20mm">
				
				<fo:region-body margin-top="20mm" margin-bottom="10mm" />
				<fo:region-before extent="5mm"/>
				<fo:region-after extent="5mm"/>
				</fo:simple-page-master>

				<!--PlantillaDos-->
				<fo:simple-page-master master-name="PlantillaDos"
					page-height="29.7cm"
					page-width="21cm"
					margin-top="10mm"
					margin-bottom="10mm"
					margin-left="20mm"
					margin-right="20mm">
				
				<fo:region-body margin-top="20mm" margin-bottom="10mm" />
				<fo:region-before extent="5mm"/>
				<fo:region-after extent="5mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			
			<!--contenido de plantilla A4-->
			<fo:page-sequence master-reference="A4">
				<fo:static-content flow-name="xsl-region-before" >
			  		<fo:block font-family="verdana">Esto es una cabecera</fo:block>
		  		</fo:static-content>
				<fo:static-content flow-name="xsl-region-after" >
			  		<fo:block font-family="verdana">Esto es el pie de página</fo:block>
		  		</fo:static-content>
				<fo:flow flow-name="xsl-region-body">

					<fo:block font-family="sans">
						Kaixo, <xsl:value-of select="nombre"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
			<!--contenido de plantilla PlantillaDos-->
			<fo:page-sequence master-reference="PlantillaDos">
				<fo:static-content flow-name="xsl-region-before" >
			  		<fo:block font-family="verdana">Cabecera de contenido de plantillaDos</fo:block>
		  		</fo:static-content>
				<fo:static-content flow-name="xsl-region-after" >
			  		<fo:block font-family="verdana" background-color="lightblue">Pie de Página de contenido de plantillaDos</fo:block>
		  		</fo:static-content>
				<fo:flow flow-name="xsl-region-body">

					<fo:block font-family="sans">
						Kaixo contenido plantillaDos, <xsl:value-of select="nombre"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
