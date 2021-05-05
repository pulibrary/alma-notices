<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
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
				<br/>
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td> @@title@@&#160;<xsl:value-of
										select="notification_data/item_loan/title"/>
									<xsl:text>, previously due on </xsl:text>
									<xsl:value-of select="notification_data/item_loan/old_due_date"/>
									<xsl:text>, </xsl:text> @@due_back@@ <xsl:value-of
										select="notification_data/item_loan/due_date"/>
									<xsl:text> owing to: </xsl:text>
									<xsl:value-of
										select="notification_data/item_loan/shortened_due_date_reason"/>
									<br/><br/>
									<xsl:text>Please return by </xsl:text>
									<xsl:value-of select="notification_data/item_loan/due_date"/>
									<xsl:text>.</xsl:text>
									<br/><br/>
								</td>
							</tr>
						</table>
						<br/>
						<table role="presentation">
							<tr>
								<td>@@sincerely@@</td>
							</tr>
							<tr>
								<td>@@department@@</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- footer.xsl -->
				<xsl:call-template name="contactUs"/><!-- footer.xsl -->
				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
