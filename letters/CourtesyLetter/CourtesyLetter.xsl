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
					<!--<xsl:value-of select="notification_data/general_data/subject"/>-->
					<xsl:text>Courtesy notice</xsl:text>
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
								<td>
									<!--<xsl:if test="notification_data/short_loans='true'">
										<strong>@@short_loans_message@@</strong>
									</xsl:if>
									<xsl:if test="notification_data/short_loans='false'">
										<strong>@@message@@</strong>
									</xsl:if>-->
									<xsl:text>This notice is to remind you that the following item(s) will be due soon. Please return or renew the item(s) by the due date indicated below. Online renewal is available for most items. To renew, log in to Your Account </xsl:text>
									<xsl:call-template name="myAccount"/>. <br/><br/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@loans@@</strong>
								</td>
							</tr>
							<tr>
								<td>
									<table cellpadding="5" class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss"/>
											<!-- style.xsl -->
										</xsl:attribute>
										<tr>
											<th>@@title@@</th>
											<th>@@description@@</th>
											<th>@@author@@</th>
											<th>@@due_date@@</th>
											<th>@@library@@</th>
										</tr>
										<xsl:for-each
											select="notification_data/item_loans/item_loan">
											<tr>
												<td><xsl:value-of select="title"/></td>
												<td><xsl:value-of select="description"/></td>
												<td><xsl:value-of select="author"/></td>
												<td><xsl:value-of select="due_date"/></td>
												<td><xsl:value-of select="library_name"/></td>
											</tr>
										</xsl:for-each>
									</table>
								</td>
							</tr>
						</table>
						<br/>
						<br/> @@additional_info_1@@ <br/> @@additional_info_2@@ <br/>
						<!--<table role='presentation' >
							<tr><td>@@sincerely@@</td></tr>
							<tr><td>@@department@@</td></tr>
						</table>-->
						<xsl:call-template name="signed"/>
						<!-- footer.xsl -->
					</div>
				</div>
				<xsl:call-template name="protocols"/>
				<!-- footer.xsl -->
				<xsl:call-template name="contactUs"/>
				<!-- footer.xsl --><!--
				<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
