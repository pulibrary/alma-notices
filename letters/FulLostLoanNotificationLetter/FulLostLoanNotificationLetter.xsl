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
				<!-- SenderReceiver.xsl --><br/><br/>
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
				<!--<br />-->
				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td> 
									<h>@@inform_you_item_below@@ </h>
									<h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>
<br/><br/>
								</td>
							</tr>
							<tr>
								<td>
									<table role="presentation" cellpadding="5" class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss"/>
										</xsl:attribute>
										<!--<tr align="center" bgcolor="#f5f5f5">
												<td colspan="8">
												<h3>
												<xsl:value-of select="organization_unit/name"/>
												</h3>
												</td>
											</tr>-->
										<tr>
											<!--<th>Author</th>-->
											<th>Title</th>
											<!--
										<th>@@description@@</th>-->
											<!--<th>@@library@@</th>-->
											<!--<th>@@loan_date@@</th>-->
											<th>@@due_date@@</th>
											<th>@@barcode@@</th>
											<th>@@call_number@@</th>
											<!--<th>@@charged_with_fines_fees@@</th>-->
											<th>Fee Type</th>
											<th>Fee Amount</th>
										</tr>
										<xsl:for-each select="notification_data/item_loans/item_loan">
											<tr>
												<!--<td>
												<xsl:value-of select="author"/>
												</td>-->
												<td>
												<xsl:value-of select="title"/>
												</td>
												<!--<td><xsl:value-of select="item_loan/description"/></td>-->
												<!--<td>
												<xsl:value-of
												select="physical_item_display_for_printing/library_name"
												/>
												</td>-->
												<!--<td>
												<xsl:value-of select="loan_date"/>
												</td>-->
												<td>
												<xsl:value-of select="due_date"/>
												</td>
												<td>
												<!--<span>
												<xsl:attribute name="style">
												<xsl:call-template name="barcodeCss"/>
												</xsl:attribute>
												<xsl:text>*</xsl:text>
												<xsl:value-of select="item_loan/barcode"/>
												<xsl:text>*</xsl:text>
												</span>
												<br/>-->
												<xsl:value-of select="barcode"/>
												</td>
												<td>
												<xsl:value-of select="call_number"/>
												</td>
												<xsl:for-each
												select="../fines_fees_list/user_fines_fees">
												<td>
												<xsl:value-of select="fine_fee_type_display"/>
												</td>
												<td>
												<xsl:choose>
												<xsl:when test="fine_fee_ammount/normalized_sum"
												><xsl:value-of
												select="fine_fee_ammount/normalized_sum"/>
												</xsl:when>
												<xsl:otherwise><xsl:value-of
												select="fine_fee_ammount/sum"/></xsl:otherwise>
												</xsl:choose>&#160;<xsl:value-of
												select="fine_fee_ammount/currency"
												/>&#160;<xsl:value-of select="ff"/>
												</td>
												</xsl:for-each>
											</tr>
										</xsl:for-each>
									</table>
								</td>
							</tr>
							<xsl:if
								test="notification_data/overdue_notification_fee_amount/sum != ''">
								<tr>
									<td>
										<strong>@@fee_amount@@</strong>
										<xsl:value-of
											select="notification_data/overdue_notification_fee_amount/normalized_sum"
											/>&#160;<xsl:value-of
											select="notification_data/overdue_notification_fee_amount/currency"
											/>&#160;<xsl:value-of select="ff"/>
									</td>
								</tr>
							</xsl:if>
							<!--<br/>
					<br/> @@additional_info_1@@ <br/> @@additional_info_2@@ <br/>-->
							<!--<table role="presentation">
						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>
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
					</div>
				</div>
				<!-- footer.xsl -->
				<!--<xsl:call-template name="protocols"/>-->
				<!-- footer.xsl -->
				<!--<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
