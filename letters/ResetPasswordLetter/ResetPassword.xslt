<?xml version="1.0" encoding="UTF-8"?>
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
                <!--<xsl:call-template name="toWhomIsConcerned" />-->
                <!-- mailReason.xsl -->
                <div class="messageArea">
                    <div class="messageBody">
                        <table role="presentation" cellspacing="0" cellpadding="5" border="0">
                            <tr>
                                <td>Hi,</td>
                            </tr>
                            <tr>
                                <td> @@bodyTextBeforeLink@@<!-- <xsl:text>to reset your Princeton University Library account password, please </xsl:text> -->
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="notification_data/reset_pw_url"/>
                                        </xsl:attribute> @@linkLabel@@</a>
                                    @@bodyTextAfterLink@@<br/>
                                </td>
                            </tr>

                            <tr>
                                <td>@@signature@@</td>
                            </tr>
                            <tr>
                                <td>April Miller<br/>Library Access Office<br/>
                                    <xsl:value-of select="notification_data/organization_unit/name"
                                    /></td>
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
