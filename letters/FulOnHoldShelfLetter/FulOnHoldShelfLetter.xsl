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
					<xsl:text>Item available notice</xsl:text>
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
				<!--<!--<xsl:call-template name="senderReceiver"/>-->-->
				<!-- SenderReceiver.xsl -->
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td><!--@@following_item_requested_on@@ <xsl:value-of
									select="notification_data/request/create_date"/>-->
									The following item(s) @@can_picked_at@@ <xsl:value-of
										select="notification_data/request/assigned_unit_name"/>
									<xsl:text>.</xsl:text>
									<!--@@circulation_desk@@--></td>
							</tr>
							<xsl:if
								test="notification_data/request/work_flow_entity/expiration_date">
								<tr>
									<td> @@note_item_held_until@@ <xsl:value-of
											select="notification_data/request/work_flow_entity/expiration_date"
										/>. </td>
								</tr>
							</xsl:if>
						</table>
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<xsl:call-template name="recordTitle_table"/>
								<!-- recordTitle.xsl -->
							</tr>
							<tr>
								<td style="width:15%;"><b>Barcode: </b></td>
								<td align="left" style="text-align:left;">
									<xsl:value-of
										select="//notification_data/phys_item_display/available_items/available_item/barcode"
									/>
								</td>
							</tr>
							<!--<xsl:if test="notification_data/request/system_notes[. != '']">
								<tr>
									<td>
										<strong>@@notes_affect_loan@@:</strong>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of
											select="notification_data/request/system_notes"/>
									</td>
								</tr>
							</xsl:if>-->
						</table>
					</div>
				</div>
				<br/>
				<!--<table role="presentation">
					<tr>
						<td>@@sincerely@@</td>
					</tr>
					<tr>
						<td>@@department@@</td>
					</tr>
				</table>-->
				<xsl:call-template name="contactUs"/>
				<xsl:call-template name="signed"/>
				<!-- footer.xsl -->
				<xsl:call-template name="protocols"/>
				<!-- footer.xsl -->
				<!--<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
