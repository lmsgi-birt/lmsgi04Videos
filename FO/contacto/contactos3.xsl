<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"  > <!--añadir espacio de nombres para fo-->
<xsl:output encoding="utf-8" method="xml" indent="yes" />

<xsl:template match="/agenda">
	<fo:root>

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
				<!-- Contenido del informe con plantillas-->
			
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates/>
				</fo:flow>
				
		</fo:page-sequence>
	
		
	</fo:root>
	
</xsl:template>

<xsl:template match="propietario">

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
				Nombre:<xsl:value-of select="nombre"/>
		</fo:block>
		<fo:block font-size="12pt" 
			font-family="sans" 
			line-height="13pt"
			space-after.optimum="2pt"
			text-align="justify">
				Apellido: <xsl:value-of select="apellidos"/>
		</fo:block>
		<fo:block font-size="24pt" 
			font-weight="bold"
			font-family="sans-serif" 
			line-height="25pt"
			space-after.optimum="2pt"
			text-align="justify">
			Agenda: 
		</fo:block>
	</xsl:template>
	<xsl:template match="contactos">
		<xsl:for-each  select="persona">
		<xsl:sort  select="identificadores/apellidos" /> <!-- Ordena los contactos por apellido-->
			<fo:block font-size="12pt" 
				font-family="sans" 
				line-height="13pt"
				space-after.optimum="2pt"
				text-align="justify"
				font-weight="bold"
				
				color="black">
					Nombre:<xsl:value-of select="identificadores/nombre"/>
			</fo:block>
			<fo:block font-size="12pt" 
				font-family="sans" 
				line-height="13pt"
				space-after.optimum="2pt"
				text-align="justify"
				font-weight="bold"
				
				color="black">
					Apellido: <xsl:value-of select="identificadores/apellidos"/>
			</fo:block>
			<fo:table border="2" border-style="solid" >
				<fo:table-column column-width="50mm" />
				<fo:table-column column-width="25mm" />
				<fo:table-column column-width="25mm" />
				<fo:table-column column-width="50mm"/>
		

				<fo:table-header background-color="lightblue">
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
							
							<fo:block font-weight="bold">Telefono</fo:block>
						</fo:table-cell>
						
					</fo:table-row>
				</fo:table-header>
				<fo:table-body background-color="lightblue">
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
							<fo:block  space-before="5mm" space-after="5mm">
							
							<fo:list-block>

								<fo:list-item>
								<fo:list-item-label>
								<fo:block>*</fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
								<fo:block>   Movil:<xsl:value-of select="telefonos/movil" /></fo:block>
								</fo:list-item-body>
								</fo:list-item>
								<fo:list-item>
								<fo:list-item-label>
								<fo:block>*</fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
								<fo:block>   Casa:<xsl:value-of select="telefonos/casa" /></fo:block>
								</fo:list-item-body>
								</fo:list-item>
								<fo:list-item>
								<fo:list-item-label>
								<fo:block>*</fo:block>
								</fo:list-item-label>
								<fo:list-item-body>
								<fo:block>   Trabajo:<xsl:value-of select="telefonos/trabajo" /></fo:block>
								</fo:list-item-body>
								</fo:list-item>

							</fo:list-block>
					
							</fo:block>
						
						</fo:table-cell>
					</fo:table-row>
					
				</fo:table-body>

			</fo:table>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
