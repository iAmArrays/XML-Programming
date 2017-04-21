<?xml version="1.0" ?> 
<xsl:stylesheet version="1.0"
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output  method="xml" indent="yes" omit-xml-declaration="yes"  />
 <xsl:template match="student">
   <student>
     <xsl:for-each select="@*">
       <xsl:element name="{name()}">
         <xsl:value-of select="." />
       </xsl:element>
     </xsl:for-each>
   </student>
 </xsl:template>
</xsl:stylesheet>