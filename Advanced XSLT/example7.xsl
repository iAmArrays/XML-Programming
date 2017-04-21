<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<xsl:template match="/spareParts">
 <html>
  <body>
   <h2>
    <xsl:text>Spare parts with more than 210 pieces in stock</xsl:text> 
    </h2>
    <table>
     <tr>
      <th>Part name</th> 
      <th>Part number</th> 
      <th>Part image</th> 
      <th>quantity</th> 
     </tr>
     <xsl:for-each select="//item">

       <tr>
        <td><xsl:value-of select="partName" /></td>
        <td><xsl:value-of select="partNumber" /></td>
        <td><xsl:value-of select="partImage" /></td>
        <td><xsl:value-of select="quantity" /></td>
       </tr>

     </xsl:for-each>
    </table>
   </body>
  </html>
 </xsl:template>
</xsl:stylesheet>