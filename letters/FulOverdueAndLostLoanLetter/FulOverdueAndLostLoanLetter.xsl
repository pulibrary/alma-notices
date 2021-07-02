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
				<!--<xsl:call-template name="senderReceiver"/>-->
				<!-- SenderReceiver.xsl -->
				<br/>
				<br/>
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
				<!--<br />-->
				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>This is to inform you that item(s) listed below are long overdue
									and replacement fees have been applied. The Library reserves the right
									to adjust the fee upward if it does not cover the cost of
									replacement. Please return these items as soon as possible or contact us at fstcirc@princeton.edu.
									<!--<h>@@inform_you_item_below@@ </h>
									<h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>-->
								</td>
							</tr>
						</table>
						<table role="presentation" cellpadding="5" class="listing">
							<xsl:attribute name="style">
								<xsl:call-template name="mainTableStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<xsl:for-each
								select="notification_data/loans_by_library/library_loans_for_display">
								<tr>
									<td>
										<table role="presentation" cellpadding="5" class="listing">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss"/>
											</xsl:attribute>
											<!--<tr align="center" bgcolor="#f5f5f5">
												<td colspan="8">
												<h3><xsl:value-of select="organization_unit/name"
												/></h3>
												</td>
											</tr>-->
											<tr>
												<th>@@lost_item@@</th>
												<!--<th>@@description@@</th>-->
												<!--<th>@@library@@</th>-->
												<!--<th>@@loan_date@@</th>-->
												<th>@@due_date@@</th>
												<th>@@barcode@@</th>
												<th>@@call_number@@</th>
												<th>@@charged_with_fines_fees@@</th>
											</tr>
											<xsl:for-each
												select="item_loans/overdue_and_lost_loan_notification_display">
												<tr>
												<td>
												<xsl:value-of select="item_loan/title"/>
												</td>
												<!--<td><xsl:value-of select="item_loan/description"/></td>-->
												<!--<td><xsl:value-of
												select="physical_item_display_for_printing/library_name"
												/></td>-->
												<!--<td>
												<xsl:value-of select="item_loan/loan_date"/>
												</td>-->
												<td>
												<xsl:value-of select="item_loan/due_date"/>
												</td>
												<td>
												<!--<span>
												<xsl:attribute name="style"><xsl:call-template
												name="barcodeCss"/></xsl:attribute>
												<xsl:text>*</xsl:text>
												<xsl:value-of select="item_loan/barcode"/>
												<xsl:text>*</xsl:text>
												</span>
												<br/>-->
												<xsl:value-of select="item_loan/barcode"/>
												<br/>
												</td>
												<td>
												<xsl:value-of
												select="physical_item_display_for_printing/call_number"
												/>
												</td>
												<td>
												<xsl:for-each
												select="fines_fees_list/user_fines_fees">
												<xsl:value-of select="fine_fee_type_display"/>:
												<xsl:value-of select="fine_fee_ammount/sum"
												/>&#160;<xsl:value-of
												select="fine_fee_ammount/currency"
												/>&#160;<xsl:value-of select="ff"/>
												<br/>
												</xsl:for-each>
												</td>
												</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
								<br/>
								<br/>
							</xsl:for-each>
							<xsl:if
								test="notification_data/overdue_notification_fee_amount/sum != ''">
								<tr>
									<td>
										<strong>@@overdue_notification_fee@@</strong>
										<xsl:value-of
											select="notification_data/overdue_notification_fee_amount/normalized_sum"
											/>&#160;<xsl:value-of
											select="notification_data/overdue_notification_fee_amount/currency"
											/>&#160;<xsl:value-of select="ff"/>
									</td>
								</tr>
							</xsl:if>
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
							<!--<table role="presentation">
						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>
					</table>-->
						</table>
					</div>
				</div>
				<!--<xsl:call-template name="protocols"/>-->
				<!-- footer.xsl -->
				<!--<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
