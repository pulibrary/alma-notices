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
					@@letterName@@<!-- <xsl:value-of select="notification_data/general_data/subject"/> -->
				</title>

				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<!-- <xsl:call-template name="senderReceiver" /> SenderReceiver.xsl -->
				<br/>
				<xsl:call-template name="toWhomIsConcerned"/>
				<br/>
				<!-- mailReason.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>This email provides instructions to login to your Princeton
									University Library account and set your password.<br/><br/> If
									you <b>have a University TigerCard as a family member, retiree,
										or affiliate</b>, your <b>USER ID</b> is the nine digit
									number on the front of your card, under your name.<br/><br/> If
									you’re a <b>Guest Borrower or PTS patron</b>, your <b>USER
										ID</b> begins with the letters “<b>BC</b>” plus the unique
									last nine digits of your barcode (after 22101). Your barcode is
									located on the back of your ID card. Example:
									BC123456789.<br/><br/>To activate your Princeton University
									Library account with your <b>USER ID</b> (or to reset your
									password), @@bodyTextBeforeLink@@ <a>
										<xsl:attribute name="href">
											<xsl:value-of select="notification_data/reset_pw_url"/>
										</xsl:attribute> @@linkLabel@@</a>
									@@bodyTextAfterLink@@<br/><br/> Once your account is activated,
									the next time you login to Your Library Account at
									https://library.princeton.edu/accounts select “Other users:
									affiliates, retirees, family members, guest borrowers”. <br/><br/>
									<b>Questions:</b><br/> If you’re a Guest Borrower or PTS patron,
									please contact <a href="mailto:aprilm@princeton.edu"
										>aprilm@princeton.edu</a>. <br/><br/> If you’re a family
									member, retiree, or affiliate, please contact <a
										href="mailto:fstcirc@princeton.edu"
										>fstcirc@princeton.edu</a>. </td>
							</tr>
							<tr>
								<td><br/>@@signature@@</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="notification_data/organization_unit/name"
									/>
								</td>
							</tr>
							<xsl:if test="notification_data/organization_unit/address/city != ''">
								<tr>
									<td>
										<xsl:value-of
											select="notification_data/organization_unit/address/city"
										/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/organization_unit/address/country != ''">
								<tr>
									<td>
										<xsl:value-of
											select="notification_data/organization_unit/address/country"
										/>
									</td>
								</tr>
							</xsl:if>
						</table>
					</div>
				</div>
				<!--<xsl:call-template name="lastFooter" />-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
