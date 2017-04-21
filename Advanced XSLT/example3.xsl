<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output  method="xml" indent="yes" omit-xml-declaration="yes"  />

<xsl:template match="/">
  <xsl:processing-instruction name="xml-stylesheet">
    type="text/css" href="example3.css"
  </xsl:processing-instruction>
  <xsl:comment> This is a COMMENT</xsl:comment>
  <test>
      <xsl:element name="first">
        <xsl:value-of select="'start'" />
      </xsl:element>
      <xsl:value-of select="/insert" />
  </test>
</xsl:template>
</xsl:stylesheet>