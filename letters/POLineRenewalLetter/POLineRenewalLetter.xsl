<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/>
				<div class="messageArea">
					<div class="messageBody">
						<table cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>@@renew_our_subscription@@:
									<br /><br/><b>@@title@@: </b><xsl:value-of select="notification_data/line/title" />
									<br /><b>@@order_number@@:</b><xsl:value-of select="notification_data/line/reference_number" />
									<br /><b>@@order_date@@: </b><xsl:value-of select="notification_data/line/send_date" />
									<br /><b>@@from_date@@:</b><xsl:value-of select="notification_data/line/renewal_date" />
								</td>
							</tr>
							
						</table>
					</div>
				</div>
				<br/>
				<table>
					<tr>
						<td><br/><br/>
							Sincerely,<br/><br/>
						</td>
					</tr>
					<tr>
						<td>Princeton University Library <br/> Acquisitions Services-Monographs
							<br/> Princeton University Library <br/> 693 Alexander Road <br/>
							Princeton, NJ 08540-6317 USA <br/><br/>Phone: 609-258-3219 <br/>FAX:
							609-258-0441 <br/> E-Mail: orderdiv@princeton.edu</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
