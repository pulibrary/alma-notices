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
            <head>
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
                <xsl:call-template name="toWhomIsConcerned"/>
                <!-- mailReason.xsl -->
                <div class="messageArea">
                    <div class="messageBody">
                        <table role="presentation" cellspacing="0" cellpadding="5" border="0">
                            <!--<tr>
								<td>
									<h>@@message@@</h>
								</td>
							</tr>-->
                            <tr>
                                <td>
                                    <h>@@following_items_awaiting_pickup@@</h>
                                    <br/>
                                    <br/>
                                </td>
                            </tr>
                            <xsl:for-each
                                select="notification_data/requests_by_library/library_requests_for_display">
                                <tr>
                                    <td>
                                        <table cellpadding="5" class="listing">
                                            <xsl:attribute name="style">
                                                <xsl:call-template name="mainTableStyleCss"/>
                                            </xsl:attribute>
                                            <!--<tr align="center" bgcolor="#f5f5f5">
												<td colspan="4">
												<h3>
												<xsl:value-of select="organization_unit/name"/>
												</h3>
												</td>
											</tr>-->
                                            <tr>
                                                <th>Pick up by</th>
                                                <th>Pick up at</th>
                                                <th>Title</th>
                                                <th>Author</th>
                                                <th>Call Number</th>
                                                <th>Barcode</th>
                                            </tr>
                                            <xsl:for-each select="requests/request_for_display">
                                                <tr>
                                                  <td>
                                                  <xsl:choose>
                                                  <xsl:when
                                                  test="phys_item_display/item_policy = 'ILLiad borrowing'">
                                                  <xsl:value-of
                                                  select="request/work_flow_entity/estimated_arrival_date"
                                                  />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="request/work_flow_entity/expiration_date"
                                                  />
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </td>
                                                  <td>
                                                  <xsl:value-of select="request/assigned_unit_name"
                                                  />
                                                  </td>
                                                  <td>
                                                  <xsl:value-of select="phys_item_display/title"/>
                                                  </td>
                                                  <td>
                                                  <xsl:value-of select="phys_item_display/author"/>
                                                  </td>
                                                  <td>
                                                  <xsl:value-of
                                                  select="phys_item_display/call_number"/>
                                                  </td>
                                                  <td>
                                                  <xsl:value-of select="phys_item_display/barcode"/>
                                                  </td>
                                                </tr>
                                            </xsl:for-each>
                                        </table>
                                    </td>
                                </tr>
                                <br/>
                            </xsl:for-each>
                            <xsl:if
                                test="notification_data/out_of_institution_requests/request_for_display">
                                <tr>
                                    <td>
                                        <table cellpadding="5" class="listing">
                                            <xsl:attribute name="style">
                                                <xsl:call-template name="mainTableStyleCss"/>
                                            </xsl:attribute>
                                            <tr align="center" bgcolor="#f5f5f5">
                                                <td colspan="4">
                                                  <h3>@@other_institutions@@</h3>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>@@title@@</th>
                                                <th>@@author@@</th>
                                                <th>@@can_picked_at@@</th>
                                                <th>@@note_item_held_until@@</th>
                                            </tr>
                                            <xsl:for-each
                                                select="notification_data/out_of_institution_requests/request_for_display">
                                                <tr>
                                                  <td>
                                                  <xsl:value-of select="phys_item_display/title"/>
                                                  </td>
                                                  <td>
                                                  <xsl:value-of select="phys_item_display/author"/>
                                                  </td>
                                                  <td>
                                                  <xsl:value-of select="request/assigned_unit_name"
                                                  />
                                                  </td>
                                                  <td>
                                                  <xsl:choose>
                                                  <xsl:when
                                                  test="phys_item_display/item_policy = 'ILLiad borrowing'">
                                                  <xsl:value-of
                                                  select="request/work_flow_entity/estimated_arrival_date"
                                                  />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="request/work_flow_entity/expiration_date"
                                                  />
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </td>
                                                </tr>
                                            </xsl:for-each>
                                        </table>
                                    </td>
                                </tr>
                                <br/>
                            </xsl:if>
                            <xsl:if test="notification_data/user_for_printing/blocks != ''">
                                <tr>
                                    <td>
                                        <b>@@notes_affect_loan@@:</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <xsl:value-of
                                            select="notification_data/user_for_printing/blocks"/>
                                    </td>
                                </tr>
                            </xsl:if>
                            <tr>
                                <td>
                                    <!--<xsl:call-template name="contactUs"/>-->If you have
                                    questions, please contact us at fstcirc@princeton.edu. </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:call-template name="signed"/>
                                </td>
                            </tr>
                        </table>
                        <!--<table role='presentation' >
							<tr><td>@@sincerely@@</td></tr>
							<tr><td>@@department@@</td></tr>
						</table>-->
                        <!-- footer.xsl -->
                    </div>
                </div>
                <!--<xsl:call-template name="protocols"/>-->
                <!-- footer.xsl -->
                <!--<xsl:call-template name="lastFooter"/>-->
                <!--<xsl:call-template name="myAccount" />-->
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>