<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="salutation"> </xsl:template>
	<xsl:template name="lastFooter">
		<table>
			<xsl:attribute name="style">
				<xsl:call-template name="footerTableStyleCss"/>
				<!-- style.xsl -->
			</xsl:attribute>
			<tr>
				<xsl:for-each select="notification_data/organization_unit">
					<xsl:attribute name="style">
						<xsl:call-template name="listStyleCss"/>
						<!-- style.xsl -->
					</xsl:attribute>
					<td align="center">
						<xsl:value-of select="name"/>
						<!--&#160;<xsl:value-of
							select="line1"/>&#160;<xsl:value-of select="line2"/>&#160;<xsl:value-of
							select="city"/>&#160;<xsl:value-of select="postal_code"
						/>-->
						<!--&#160;<xsl:value-of select="country"/>-->
					</td>
				</xsl:for-each>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="signed">
		<br/>
		<strong>Sincerely,</strong>
		<br/>
		<br/>
		<strong>Firestone Circulation Services</strong>
		<br/>
	</xsl:template>
	<xsl:template name="contactUs">
		<br/>
		<xsl:text>If you have questions or need mailing instructions, please contact
					us at fstcirc@princeton.edu.</xsl:text>
		<!--<tr>
				<td align="left">
					<a>
						<xsl:attribute name="href"
							>https://library.princeton.edu/services/access/circulation-policies</xsl:attribute>
						About Us</a>
				</td>
			</tr>-->
		<!--<tr>
				<td align="left">
					<a>
						<xsl:attribute name="href"> @@email_contact_us@@ </xsl:attribute>
						@@contact_us@@ </a>
				</td>
			</tr>
			<tr>
				<td height="10em"/>
			</tr>-->
	</xsl:template>
	<xsl:template name="protocols">
		<xsl:attribute name="style">
			<xsl:call-template name="listStyleCss"/>
			<!-- style.xsl -->
		</xsl:attribute>
		<table align="left">
			<tr>
				<td height="20em"/>
			</tr>
			<tr>
				<td align="left">Mandatory COVID-19 training must be completed before picking up a
					book or entering any Library space. When picking up and/or dropping off your
					books, please do so promptly, remain only in the designated pick-up area, wear a
					mask or face covering, and follow social distancing guidelines. We appreciate
					your help in our efforts to slow the spread of Covid-19. Sincere thanks. </td>
			</tr>
			<tr>
				<td height="10em"/>
			</tr>
		</table>
	</xsl:template>
	<!--<xsl:template name="myAccount">
		<table align="right">
			<tr>
				<td align="right">
					<a>
						<xsl:attribute name="href"> @@email_my_account@@ </xsl:attribute>
						@@my_account@@ </a>
				</td>
			</tr>
		</table>
	</xsl:template>-->
	<xsl:template name="myAccount">
		<a>
			<xsl:attribute name="href">https://catalog.princeton.edu/account</xsl:attribute>
		</a>
	</xsl:template>
</xsl:stylesheet>
