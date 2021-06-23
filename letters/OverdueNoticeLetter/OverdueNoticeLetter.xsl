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
					<xsl:text>Overdue notice</xsl:text>
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
				<!--<xsl:call-template name="senderReceiver"/>-->
				<!-- SenderReceiver.xsl -->
				<br/>
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<!--<tr>
								<td>
									<strong>@@message@@</strong>
									<br/><br/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@loans@@</strong>
								</td>
							</tr>-->
							<tr><td>The following item(s), currently charged to you, are overdue.
									Please return or renew them as soon as possible. If you are
									liable for overdue fines, remember that the fine increases the
									longer you keep the item. You may also be charged replacement
									and processing fees if the item is not returned. Online renewal
									is available for most items.<br/>
									<br/>
								</td></tr>
							<tr>
								<td>
									<table role="presentation" cellpadding="5" class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss"/>
											<!-- style.xsl -->
										</xsl:attribute>
										<tr>
											<th>Title</th>
											<th>Author</th>
											<th>Call Number</th>
											<th>Barcode</th>
											<th>Due date</th>
										</tr>
										<xsl:for-each
											select="notification_data/item_loans/item_loan">
											<tr>
												<td><xsl:value-of select="title"/></td>
												<!--<td><xsl:value-of select="description"/></td>-->
												<td><xsl:value-of select="author"/></td>
												<td><xsl:value-of select="call_number"/></td>
												<td><xsl:value-of select="barcode"/></td>
												<td><xsl:value-of select="due_date"/></td>
												
											</tr>
										</xsl:for-each>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="contactUs"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="signed"/>
								</td>
							</tr>
						
						</table>
						
						<!--<table role='presentation' >
							<tr><td>@@sincerely@@</td></tr>
							<tr><td>@@department@@</td></tr>
						</table>-->
						
						<!-- footer.xsl -->
					</div>
				</div>
				<xsl:call-template name="protocols"/>
				<!-- footer.xsl -->
				<!--<xsl:call-template name="myAccount"/>-->
				
				<!--<xsl:call-template name="lastFooter"/>-->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
