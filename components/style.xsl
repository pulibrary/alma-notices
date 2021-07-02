<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="generalStyle">
		<style>
			body {@@language_related_body_css@@ background-color:#fff}
			.listing td {border-bottom: 1px solid #eee}
			.listing tr:hover td {background-color:#eee}
			.listing th {background-color:#f5f5f5 }
			h4{line-height: 0.2em}
			
		</style>
	</xsl:template>
	<xsl:template name="bodyStyleCss"> font-family: arial; color:#333; margin:0; padding:0em;
		font-size:80% </xsl:template>
	<xsl:template name="listStyleCss"> list-style: none; margin:0 0 0 1em; padding:0 </xsl:template>
	<xsl:template name="mainTableStyleCss"> width:100%; text-align:left </xsl:template>
	<xsl:template name="headerLogoStyleCss"> background-color:#ffffff; width:100%; </xsl:template>
	<xsl:template name="headerTableStyleCss"> background-color:#e9e9e9; width:100%; height:30px;
		text-shadow:1px 1px 1px #fff; </xsl:template>
	<xsl:template name="footerTableStyleCss"> background-color:#444; width:100%; text-shadow:1px 1px
		1px #333; color:#fff; margin-top:1em; font-weight:700; line-height:2em;
		font-size:150%;</xsl:template>
	<!--<xsl:template name="barcodeCss"> font-family:'Barcode39'; </xsl:template>-->
	<xsl:template name="barcodeCss"> font-family:'Barcode 3 of 9', '3OF9_NEW', 'BarCode Normal', '3
		of 9 Barcode Regular', 'Barcode39', 'Bcc3of9'; </xsl:template>
	<xsl:template name="flip-text"> font-size:300%; -moz-transform: rotate(-180deg);
		-webkit-transform: rotate(-180deg); -ms-transform: rotate(-180deg); -o-transform:
		rotate(-180deg); transform: rotate(-180deg); position: relative; text-align: left; min-height: 60px;</xsl:template>
	<xsl:template name="text-wrap"> 
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-box-orient: vertical;
		-webkit-line-clamp: 2;
		line-height: 1.5 em;											
		max-height: 3em; </xsl:template>
</xsl:stylesheet>
