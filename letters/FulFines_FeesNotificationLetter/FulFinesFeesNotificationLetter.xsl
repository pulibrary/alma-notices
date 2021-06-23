<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>
			<head>
				<title>
					<!--<xsl:value-of select="notification_data/general_data/subject"/>-->
					<xsl:text>Fines and fees notice</xsl:text>
				</title>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<xsl:call-template name="senderReceiver"/>
				<!-- SenderReceiver.xsl -->
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
				<!--<br />-->
				<table role="presentation" cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>
							<!--@@dear@@ &#160;
							<xsl:value-of select="receivers/receiver/user/last_name"/>-->
							<h>
								<!--@@we_would_like@@ -->
								<!--<xsl:value-of select="notification_data/organization_unit/name"/>-->
								<!-- @@debt_of@@ -->
								<!--<strong><xsl:value-of select="notification_data/total_fines_amount"
									/> &#160;<xsl:value-of
										select="notification_data/total_fines_currency"/></strong>-->
								<xsl:text>The following is a list of current fine(s) or fee(s).  Payment can be made at Firestone Library Circulation Desk. If a book is long overdue, you have been billed the minimum replacement fee and a standard processing fee. The Library reserves the right to adjust this replacement fee upward if it does not cover the cost of the replacement. Please discuss lost items with staff of the owning library.</xsl:text>
								<br/>
								<br/>
							</h>
						</td>
					</tr>
				</table>
				<table role="presentation" cellpadding="5" class="listing">
					<xsl:attribute name="style">
						<xsl:call-template name="mainTableStyleCss"/>
						<!-- style.xsl -->
					</xsl:attribute>
					<table cellpadding="5" class="listing">
						<xsl:attribute name="style">
							<xsl:call-template name="mainTableStyleCss"/>
							<!-- style.xsl -->
						</xsl:attribute>
						<tr>
							<th>@@fee_type@@</th>
							<th>@@fee_amount@@</th>
							<th>@@note@@</th>
						</tr>
						<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
							<tr>
								<td>
									<xsl:value-of select="fine_fee_type_display"/>
								</td>
								<td><xsl:value-of select="fine_fee_ammount/normalized_sum"
										/>&#160;<xsl:value-of select="fine_fee_ammount/currency"
									/></td>
								<td>
									<xsl:value-of select="fine_comment"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<br/>
					<xsl:if test="notification_data/fine_fee_notification_fee_amount/sum != ''">
						<tr>
							<td>
								<strong>@@fine_fee_notification_fee@@ </strong>
								<xsl:value-of
									select="notification_data/fine_fee_notification_fee_amount/normalized_sum"
									/>&#160;<xsl:value-of
									select="notification_data/fine_fee_notification_fee_amount/currency"
									/>&#160;<xsl:value-of select="ff"/>
							</td>
						</tr>
					</xsl:if>
					<!--<h>
						<strong>@@please_settle@@</strong>
					</h>-->
					<br/>
					<br/>
					<!--<table role='presentation' >
						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>
					</table>-->
				</table>
				<br/>
				<xsl:call-template name="signed"/>
				<!-- footer.xsl -->
				<xsl:call-template name="protocols"/>
				<!-- footer.xsl -->
				<xsl:call-template name="contactUs"/>
				<!-- footer.xsl -->
				<!--<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
