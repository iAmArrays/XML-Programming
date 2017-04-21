<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
 <xsl:template match="/spareParts">
 <html>
 <body>
  <h2>
   <xsl:text>xsl:choose for selecting spare parts</xsl:text> 
  </h2>
  <p><xsl:text>The following elements meet your request:</xsl:text></p>
  <table>
    <tr>
     <th>Part name</th> 
     <th>Part number</th> 
     <th>Part image</th> 
     <th>Quantity</th> 
    </tr>
    <xsl:for-each select="//item">
     <xsl:choose>
      <xsl:when test="(partNumber='HV-152')">
        <tr>
          <td> <xsl:value-of select="partName" /></td>
          <td> <xsl:value-of select="partNumber" /></td>
          <td><xsl:value-of select="partImage" /></td>
          <td><xsl:value-of select="quantity" /></td>
        </tr>
      </xsl:when>
      <xsl:when test="(partNumber='HG-431')">
        <tr>
          <td><xsl:value-of select="partName" /></td>
          <td><xsl:value-of select="partNumber" /></td>
          <td><xsl:value-of select="partImage" /></td>
          <td><xsl:value-of select="quantity" /></td>
        </tr>
      </xsl:when>
      <xsl:otherwise></xsl:otherwise>
     </xsl:choose>
    </xsl:for-each>
  </table>
 </body>
 </html>
 </xsl:template>
</xsl:stylesheet>