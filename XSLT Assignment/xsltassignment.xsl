<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<body>
	
	<table summary="Table of Spare Parts">
		<caption>What's On: Movies sorted by price, highest to lowest</caption>
		<thead>
			<tr>
				<th>Film Title</th>
				<th>Director</th>
				<th>Category</th>
				<th>Theatre</th>
				<th>Ticket Price</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>Film Title</th>
				<th>Director</th>
				<th>Category</th>
				<th>Theatre</th>
				<th>Ticket Price</th>
			</tr>
		</tfoot>
		<xsl:for-each select="filmProject/todaysFilms">
			<xsl:sort select="schedule/ticketPrice" data-type="number" order="descending" />
			<tr>
				<td><xsl:value-of select="film/filmTitle" /></td>
				<td><xsl:value-of select="film/director" /></td>
				<td><xsl:value-of select="info/category"/></td>
				<td><xsl:value-of select="schedule/theater" /></td>
				<td><xsl:value-of select="schedule/ticketPrice" /></td>
			</tr>
		</xsl:for-each>		
	</table>
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>