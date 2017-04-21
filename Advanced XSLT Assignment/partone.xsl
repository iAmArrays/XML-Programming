<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" omit-xml-declaration="yes" />
	<xsl:template match = "companyA | companyB">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<xsl:element name="title"><xsl:value-of select="name(.)"/> - Orders</xsl:element>
				<xsl:comment><xsl:value-of select="name(.)" /> Sales Report</xsl:comment>
				<xsl:element name="link">
					<xsl:attribute name="rel">stylesheet</xsl:attribute>
					<xsl:attribute name="type">text/css</xsl:attribute>
					<xsl:attribute name="href">sales_report.css</xsl:attribute>
				</xsl:element>
				<meta charset="utf-8" />
			</head>
			<body>
				<table>
					<tr>
						<th>Customer Name</th>
						<th>Address</th>
						<th>Order No.</th>
						<th>Order Date</th>
						<th>Product</th>
						<th>Quantity</th>
						<th>Price Ea.</th>
						<th>Extension</th>
					</tr>
				<xsl:for-each select="itemCustomer | customer">
				<xsl:sort select="customer | customerName" data-type="text" />
					<tr>
						<xsl:element name="td">
							<xsl:attribute name="class">Company</xsl:attribute>
							<xsl:value-of select="customer | customerName"/>
						</xsl:element>
							<xsl:element name="td"><xsl:value-of select='customer/@address | customerAddress'/>
						</xsl:element>
						<xsl:element name="td">
							<xsl:value-of select='orderNumber | orderNum'/>
						</xsl:element>
						<xsl:element name="td">
							<xsl:value-of select='orderNumber/@date | orderDate'/>
						</xsl:element>
						<xsl:element name="td">
							<xsl:value-of select='productName | product'/>
						</xsl:element>
						<xsl:element name="td">
							<xsl:value-of select='format-number(productName/@quantity | quantity, "###,##0.0")'/>
						</xsl:element>
						<xsl:element name="td">
							<xsl:value-of select='format-number(amount/@pricePerUnit | pricePerUnit, "###,##0.00")'/>
						</xsl:element>
						<xsl:element name="td">
							<xsl:value-of select='format-number(amount | amountTotal, "###,##0.00")'/>
						</xsl:element>
					</tr>
				</xsl:for-each>
				</table>
				<h3>
					<xsl:value-of select='format-number(sum(//amount | //amountTotal), "$###,##0.00")'/> worth of goods currently on order
				</h3>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>