<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/spareParts">
 <html>
 <body>
  <h2> An example how to use function sum() in XSLT</h2>
    <p>
      <xsl:text>There are  </xsl:text>
      <xsl:value-of select="sum(//item/quantity)"/>
      <xsl:text> parts in stock.</xsl:text>
    </p>
  </body>
 </html>
</xsl:template>
</xsl:stylesheet>