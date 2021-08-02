<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="html_head">
		<head>
			<title>
				<xsl:value-of select="notification_data/general_data/subject"/>
			</title>
			<xsl:call-template name="generalStyle"/>
		</head>
	</xsl:template>
	<xsl:template name="head">
		<table cellspacing="0" cellpadding="5" border="0">
			<xsl:attribute name="style">
				<xsl:call-template name="headerTableStyleCss"/>
				<!-- style.xsl -->
			</xsl:attribute>
			<!-- LOGO INSERT -->
			<tr>
				<xsl:attribute name="style">
					<xsl:call-template name="headerLogoStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<td colspan="2">
					<div id="mailHeader">
						<div id="logoContainer" class="alignLeft">
							<img src="cid:logo.jpg" alt="logo"
								style="float:left; padding:1em 1em 1em 0em;"/>
						</div>
					</div>
				</td>
			</tr>
			<!-- END OF LOGO INSERT -->
			<tr>
				<xsl:for-each select="notification_data/general_data">
					<td valign="middle">
						<h1>
							<xsl:choose>
								<xsl:when
									test="//notification_data/notification_type = 'OverdueNotificationType1'"
									>Overdue Library Books</xsl:when>
								<xsl:when
									test="//notification_data/notification_type = 'OverdueNotificationType2'"
									>Long Overdue Library Books</xsl:when>
								<xsl:when
									test="//notification_data/notification_type = 'OverdueNotificationType3'"
									>Lost Library Books</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="letter_name"/>
								</xsl:otherwise>
							</xsl:choose>
						</h1>
					</td>
					<td valign="middle" align="right">
						<h1>
							<xsl:value-of select="current_date"/>
							<!--<xsl:value-of select="concat(
								substring(current_date, 4, 3),
								substring(current_date, 1, 3),
								substring(current_date, 7, 4)
								)"/>-->
						</h1>
					</td>
				</xsl:for-each>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
