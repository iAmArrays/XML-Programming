<?xml version="1.0" ?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="a">32</xsl:variable>
	<xsl:variable name="b">1.8</xsl:variable>
	
	<xsl:template match="/">
		<html>
			<body>
				<table>
				   <tr>
				     <th>Name</th>
				     <th>Conditions</th>
				     <th>Temperature</th>
				     <th>Winds</th>
				     <th>Relative Humidity</th>
				    </tr>
					<xsl:for-each select="//location">
				      <xsl:variable name="temp">
				         <xsl:value-of select="temperature" />
				      </xsl:variable>
						<tr>
						   <td><xsl:value-of select="name"/></td>
						   <td><xsl:value-of select="conditions"/></td>
						  <td><xsl:value-of select="($temp div$b)- ($a div$b)"/></td>
						   <td><xsl:value-of select="winds"/></td>
						   <td><xsl:value-of select="relativeHumidity"/></td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>