<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:template match="/">
  <html>
		<head>
			<title>Example 7-4c: HTML Output with CSS</title>
			<link rel="stylesheet" type="text/css" href="example3.css" />
		</head>
	   <body>
   	  <p><xsl:text>This is a test example</xsl:text></p>
	   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>