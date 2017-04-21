<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:template match="/">
  <html>
		<head>
			<title>Example 7-4b: HTML Output with CSS</title>
		   <xsl:element name="link">
		     <xsl:attribute name="rel">stylesheet</xsl:attribute>
		     <xsl:attribute name="type">text/css</xsl:attribute>
		     <xsl:attribute name="href">example3.css</xsl:attribute>
		   </xsl:element>
		</head>
	   <body>
   	  <p><xsl:text>This is a test example</xsl:text></p>
	   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>