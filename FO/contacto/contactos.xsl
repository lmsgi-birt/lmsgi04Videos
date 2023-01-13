<?xml version="1.0" encoding="utf-8"?>
<!--Tutorial: https://www.w3big.com/es/xslfo/xslfo-documents.html#gsc.tab=0-->
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"  > <!--añadir espacio de nombres para fo-->
<xsl:output encoding="utf-8" method="xml" indent="yes" />

	<xsl:template match="/agenda">
		<fo:root>
			<!-- Características del documento-->
			<fo:layout-master-set>
					<!-- Propiedades de la página-->
				 	<fo:simple-page-master master-name="A4"
                          page-height="29.7cm"
                          page-width="21cm"
                          margin-top="10mm"
                          margin-bottom="10mm"
                          margin-left="20mm"
                          margin-right="20mm">
					<!-- Cuerpo -->
           			<fo:region-body margin-top="20mm" margin-bottom="10mm" />
					<!-- Cabecera -->
					<fo:region-before extent="5mm"/>
					<!-- Pie de página -->
					<fo:region-after extent="5mm"/>
       				</fo:simple-page-master>
			</fo:layout-master-set>

			<!-- Formato del contenido-->
			<fo:page-sequence master-reference="A4">
				<!-- Contenido de la cabecera-->
				<fo:static-content flow-name="xsl-region-before">
			  		<fo:block>
							<fo:external-graphic src="birtlh_logo.jpg"></fo:external-graphic>
						</fo:block>
		  		</fo:static-content>
				<!-- Contenido del pie de página-->
				<fo:static-content flow-name="xsl-region-after">
			  			<fo:block font-size="10pt" 
								font-family="sans" 
								line-height="18pt"
								space-after.optimum="2pt"
								text-align="justify"
								font-weight="bold">
									Número páginas del informe:<fo:page-number />
						</fo:block>
		  		</fo:static-content>
				<!-- Contenido del informe-->
				<fo:flow flow-name="xsl-region-body"> 
						
						<fo:block font-size="24pt" 
							font-weight="bold"
							font-family="sans-serif" 
							line-height="25pt"
							space-after.optimum="2pt"
							text-align="justify">
							Propietario: 
						</fo:block>
						<fo:block font-size="12pt" 
							font-family="sans" 
							line-height="13pt"
							space-after.optimum="2pt"
							text-align="justify">
								Nombre:<xsl:value-of select="propietario/nombre"/>
						</fo:block>
						<fo:block font-size="12pt" 
							font-family="sans" 
							line-height="13pt"
							space-after.optimum="2pt"
							text-align="justify">
								Apellido: <xsl:value-of select="propietario/apellidos"/>
						</fo:block>
						<fo:block font-size="24pt" 
							font-weight="bold"
							font-family="sans-serif" 
							line-height="25pt"
							space-after.optimum="2pt"
							text-align="justify">
							Agenda: 
						</fo:block>
					<xsl:for-each  select="contactos/persona">
						<fo:block font-size="12pt" 
							font-family="sans" 
							line-height="13pt"
							space-after.optimum="2pt"
							text-align="justify"
							font-weight="bold"
							background-color="lightblue"
							color="white">
								Nombre:<xsl:value-of select="identificadores/nombre"/>
						</fo:block>
						<fo:block font-size="12pt" 
							font-family="sans" 
							line-height="13pt"
							space-after.optimum="2pt"
							text-align="justify"
							font-weight="bold"
							background-color="lightblue"
							color="white">
								Apellido: <xsl:value-of select="identificadores/apellidos"/>
						</fo:block>
						<!--Tabla-->
						<fo:table border="2" >
							<fo:table-column column-width="25mm" />
							<fo:table-column column-width="25mm" />
							<fo:table-column column-width="25mm" />
							<fo:table-column column-width="25mm"/>
							<fo:table-column column-width="25mm" />
							<fo:table-column column-width="25mm" />

							<fo:table-header>
								<fo:table-row>
									<fo:table-cell>
										<fo:block font-weight="bold">Calle</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-weight="bold">Localidad</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-weight="bold">CP</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-weight="bold">Tlf Movil</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-weight="bold">Tlf Casa</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-weight="bold">Tlf Trabajo</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-header>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
									<fo:block><xsl:value-of select="direccion/calle" /></fo:block>
									</fo:table-cell>
									<fo:table-cell>
									<fo:block><xsl:value-of select="direccion/localidad" /></fo:block>
									</fo:table-cell>
									<fo:table-cell>
									<fo:block><xsl:value-of select="direccion/cp" /></fo:block>
									</fo:table-cell>
									<fo:table-cell>
									<fo:block><xsl:value-of select="telefonos/movil" /></fo:block>
									</fo:table-cell>
									<fo:table-cell>
									<fo:block><xsl:value-of select="telefonos/casa" /></fo:block>
									</fo:table-cell>
									<fo:table-cell>
									<fo:block><xsl:value-of select="telefonos/trabajo" /></fo:block>
									</fo:table-cell>
								</fo:table-row>
								
							</fo:table-body>

						</fo:table>
					</xsl:for-each>
				</fo:flow>
					
					
  			</fo:page-sequence>
			
		</fo:root>
		
		</xsl:template>
</xsl:stylesheet>
