<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output  method="xml" indent="yes" omit-xml-declaration="yes"  />
<xsl:template match="/">
  <test>
     <xsl:element name="mass">
       <xsl:attribute name="unit">Mev</xsl:attribute> 
       <xsl:value-of select="13.5" />
     </xsl:element>
     <xsl:value-of select="/insert" />
  </test>
 </xsl:template>
 
</xsl:stylesheet>
