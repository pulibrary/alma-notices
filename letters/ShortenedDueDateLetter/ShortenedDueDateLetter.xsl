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
					<xsl:text>Recall Notice</xsl:text>
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
							<tr>
								<td>The following item, currently charged to you, has been recalled by
									another patron or course reserve. The new due date is <xsl:value-of
										select="notification_data/item_loan/due_date"/>.<br/><br/></td>
								<!--<td><xsl:text> The following item with a previous due date of </xsl:text>
									<xsl:value-of select="notification_data/item_loan/old_due_date"
									/> @@due_back@@ <xsl:value-of
										select="notification_data/item_loan/due_date"/>
									<xsl:text> owing to: </xsl:text>
									<xsl:value-of
										select="notification_data/item_loan/shortened_due_date_reason"/>
									<br/><br/>
								</td>-->
							</tr>
							<tr>
								<td>
									<table cellpadding="5" class="listing">
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
										<tr>
											<xsl:for-each select="notification_data/item_loan">
												<td>
												<xsl:value-of select="title"/>
												</td>
												<td>
												<xsl:value-of select="author"/>
												</td>
												<td>
												<xsl:value-of select="call_number"/>
												</td>
												<td>
												<xsl:value-of select="barcode"/>
												</td>
												<td>
												<xsl:value-of select="due_date"/>
												</td>
											</xsl:for-each>
										</tr>
									</table>
								</td>
							</tr>
							<!--<xsl:if test="notification_data/item_loan/shortened_due_date_reason">
								<tr>
									<td>
										<strong>
											<xsl:text>Reason for recall: </xsl:text>
										</strong>
										<xsl:value-of
											select="notification_data/item_loan/shortened_due_date_reason"/>
										<br/>
										<br/>
									</td>
								</tr>
							</xsl:if>-->
							<tr>
								<td><br/>
									<xsl:text>Fines for overdue recalled items are $1 per day. Please return the items by </xsl:text>
									<xsl:value-of select="notification_data/item_loan/due_date"/>
									<xsl:text>.</xsl:text>
									<br/>
								</td>
							</tr>
							<!--<table role="presentation">
							<tr>
								<td>@@sincerely@@</td>
							</tr>
							<tr>
								<td>@@department@@</td>
							</tr>
						</table>-->
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
						<!-- footer.xsl -->
					</div>
				</div>
				<xsl:call-template name="protocols"/>
				<!-- footer.xsl -->
				<!--<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
