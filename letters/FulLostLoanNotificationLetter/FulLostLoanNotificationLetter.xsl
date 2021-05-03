<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="mailReason.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />
	
	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>
			
			<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>
				
				<xsl:call-template name="generalStyle" />
			</head>
			
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
				
				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
				<!--<br/>-->
				
				
				<table role='presentation'  cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>
							<h>@@inform_you_item_below@@ </h>
							<h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>
						</td>
					</tr>
				</table>
				
				<table role='presentation'  cellpadding="5" class="listing">
					<xsl:attribute name="style">
						<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
					</xsl:attribute>
					
					<xsl:for-each select="notification_data">
						<table role='presentation' >
							<tr>
								<td>
									<strong>@@lost_item@@ :</strong> <xsl:value-of select="item_loan/title"/>
									<br />
									<strong>@@description@@ :</strong><xsl:value-of select="item_loan/description"/>
									<br />
									<strong> @@by@@ :</strong><xsl:value-of select="item_loan/author"/>
									<br />
									<strong>@@library@@ :</strong><xsl:value-of select="organization_unit/name"/>
									<br />
									<strong>@@loan_date@@ :</strong><xsl:value-of select="item_loan/loan_date"/>
									<br />
									<strong>@@due_date@@ :</strong><xsl:value-of select="item_loan/due_date"/>
									<br />
									<strong>@@barcode@@ :</strong><xsl:value-of select="item_loan/barcode"/>
									<br />
									<strong>@@call_number@@ :</strong><xsl:value-of select="phys_item_display/call_number"/>
									<br />
									<strong>@@charged_with_fines_fees@@ </strong>
								</td>
							</tr>
						</table>
					</xsl:for-each>
					
					<table  cellpadding="5" class="listing">
						<xsl:attribute name="style">
							<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
						</xsl:attribute>
						<tr>
							<th>@@fee_type@@</th>
							<th>@@fee_amount@@</th>
							<th>@@note@@</th>
						</tr>
						<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
							<tr>
								<td><xsl:value-of select="fine_fee_type_display"/></td>
								<td><xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/></td>
								<td><xsl:value-of select="ff"/></td>
							</tr>
						</xsl:for-each>
						
					</table>
					<br />
					<br />
					@@additional_info_1@@
					<br />
					@@additional_info_2@@
					<br />
					<table role='presentation' >
						
						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>
						
					</table>
				</table>
				<br />
				
				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>