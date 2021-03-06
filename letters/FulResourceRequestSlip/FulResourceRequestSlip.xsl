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
			<!--<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>
				<xsl:call-template name="generalStyle"/>
			</head>-->
			<body>
				<h1 style="font-size: 300%;">
					<b>
						<xsl:choose>
							<xsl:when
								test="notification_data/phys_item_display/call_number[. != '']">
								<xsl:value-of
									select="notification_data/phys_item_display/call_number"/>
							</xsl:when>
							<xsl:otherwise>
								<br/>
							</xsl:otherwise>
						</xsl:choose>
						<!-- adding an ugly hack to keep the line even when no value is present -->
					</b>
					<!--<strong>@@requested_for@@ : <xsl:value-of
							select="notification_data/user_for_printing/name"/>
					</strong>-->
				</h1>
				<!--<xsl:call-template name="head"/>-->
				<!-- header.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<!--<xsl:if
								test="notification_data/request/selected_inventory_type = 'ITEM'">
								<tr>
									<td>
										<strong>@@note_item_specified_request@@.</strong>
									</td>
								</tr>
							</xsl:if>-->
							<tr>
								<td>
									<h2>
										<strong>@@location@@: </strong>
										<xsl:value-of
											select="notification_data/phys_item_display/location_name"
										/>
									</h2>
								</td>
							</tr>
							<tr>
								<td>
									<h2>
										<strong>@@move_to_library@@: </strong>
										<xsl:value-of select="notification_data/destination"/>
									</h2>
								</td>
							</tr>
						</table>
						<table cellspacing="0" cellpadding="5" border="0">
							<xsl:if
								test="notification_data/request/selected_inventory_type = 'ITEM'">
								<tr>
									<td valign="top" style="width:15%;">
										<strong>@@item_barcode@@: </strong>
									</td>
									<td align="left" style="text-align:left; width:50%;">
										<img src="cid:item_id_barcode.png" alt="Item Barcode"/>
										<!--<span>
											<xsl:attribute name="style">
												<xsl:call-template name="barcodeCss"/>
											</xsl:attribute>
											<xsl:text>*</xsl:text>
											<xsl:value-of
												select="//notification_data/phys_item_display/available_items/available_item/barcode"/>
											<xsl:text>*</xsl:text>
										</span>-->
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="width:15%;">
										<b>@@item_barcode@@ (numeric): </b>
									</td>
									<td align="left" style="text-align:left; width:50%;">
										<xsl:value-of
											select="//notification_data/phys_item_display/available_items/available_item/barcode"
										/>
									</td>
								</tr>
							</xsl:if>
							<!--<xsl:if test="notification_data/external_id != ''">
								<tr>
									<td style="width:15%;">
										<strong>@@external_id@@: </strong>
									</td>
									<td>
										<xsl:value-of select="notification_data/external_id"/>
									</td>
								</tr>
							</xsl:if>-->
							<xsl:if test="notification_data/user_for_printing/name">
								<tr>
									<td style="width:15%;">
										<strong>@@requested_for@@: </strong>
									</td>
									<td>
										<xsl:value-of
											select="notification_data/user_for_printing/name"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if
								test="notification_data/user_for_printing/identifiers/code_value[code = 'BARCODE']">
								<tr>
									<td style="width:15%;">
										<b>Requested for patron barcode: </b>
									</td>
									<td align="left" style="text-align:left; width:50%;">
										<xsl:value-of
											select="//notification_data/user_for_printing/identifiers/code_value[code = 'BARCODE']/value"
										/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<div style="position:relative;">
									<td width="15%" valign="top">
										<b>Title: </b>
									</td>
									<td>
										<div>
											<xsl:attribute name="style">
												<xsl:call-template name="text-wrap"/>
											</xsl:attribute>
											<xsl:value-of
												select="notification_data/phys_item_display/title"/>
											<xsl:if
												test="notification_data/phys_item_display/author != ''">
												<xsl:text> By: </xsl:text>
												<xsl:value-of
												select="notification_data/phys_item_display/author"
												/>
											</xsl:if>
										</div>
										<xsl:choose>
											<xsl:when
												test="string-length(concat(notification_data/phys_item_display/title, ' by: ', notification_data/phys_item_display/author)) > 165"/>
											<xsl:otherwise>
												<div
												style="height: 0;
												overflow: hidden;"/>
												<span>&#160;</span>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</div>
							</tr>
							<tr>
								<td style="width:15%;">
									<strong>@@request_id@@: </strong>
								</td>
								<td>
									<!--<img src="cid:request_id_barcode.png" alt="Request Barcode"/>-->
									<!--<span>
										<xsl:attribute name="style"><xsl:call-template
											name="barcodeCss"/></xsl:attribute>
										<xsl:text>*</xsl:text>
										<xsl:value-of select="notification_data/request_id"/>
										<xsl:text>*</xsl:text>
									</span>-->
									<xsl:value-of select="notification_data/request_id"/>
								</td>
							</tr>
							<!--<xsl:if test="notification_data/request/manual_description != ''">
								<tr>
									<td style="width:15%;"><strong>@@please_note@@:
										</strong>@@manual_description_note@@ - </td>
									<td>
										<xsl:value-of
											select="notification_data/request/manual_description"/>
									</td>
								</tr>-->
							<!--</xsl:if>-->
							<!--<xsl:if test="notification_data/phys_item_display/isbn != ''">
								<tr>
									<td>@@isbn@@: <xsl:value-of
											select="notification_data/phys_item_display/isbn"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/issn != ''">
								<tr>
									<td>@@issn@@: <xsl:value-of
											select="notification_data/phys_item_display/issn"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/edition != ''">
								<tr>
									<td>@@edition@@: <xsl:value-of
											select="notification_data/phys_item_display/edition"
										/></td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/imprint != ''">
								<tr>
									<td>@@imprint@@: <xsl:value-of
											select="notification_data/phys_item_display/imprint"
										/></td>
								</tr>
							</xsl:if>
							<strong/>-->
							<!--<xsl:if test="notification_data/phys_item_display/call_number != ''">
								<tr>
									<td>
										<h2>
											<strong>@@call_number@@: </strong>
											<xsl:value-of
												select="notification_data/phys_item_display/call_number"
											/>
										</h2>
									</td>
								</tr>
							</xsl:if>-->
							<!--<xsl:if
								test="notification_data/phys_item_display/accession_number != ''">
								<tr>
									<td>
										<h2>
											<strong>@@accession_number@@: </strong>
											<xsl:value-of
												select="notification_data/phys_item_display/accession_number"
											/>
										</h2>
									</td>
								</tr>
							</xsl:if>
<xsl:if
								test="notification_data/phys_item_display/shelving_location/string">
								<xsl:if
									test="notification_data/request/selected_inventory_type = 'ITEM'">
									<tr>
										<td>
											<strong>@@shelving_location_for_item@@: </strong>
											<xsl:for-each
												select="notification_data/phys_item_display/shelving_location/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
										</td>
									</tr>
								</xsl:if>-->
							<!--	<xsl:if
								test="notification_data/request/selected_inventory_type = 'HOLDING'">
								<tr>
									<td style="width:15%;">
										<strong>@@shelving_locations_for_holding@@: </strong>
									</td>
									<td>
										<xsl:for-each
											select="notification_data/phys_item_display/shelving_location/string">
											<xsl:value-of select="."/> &#160; </xsl:for-each>
									</td>
								</tr>
							</xsl:if>-->
							<!--<xsl:if
									test="notification_data/request/selected_inventory_type = 'VIRTUAL_HOLDING'">
									<tr>
										<td>
											<strong>@@shelving_locations_for_holding@@: </strong>
											<xsl:for-each
												select="notification_data/phys_item_display/shelving_location/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
										</td>
									</tr>
								</xsl:if>-->
							<!--</xsl:if>-->
							<!--<xsl:if
								test="notification_data/phys_item_display/display_alt_call_numbers/string">
								<xsl:if
									test="notification_data/request/selected_inventory_type = 'ITEM'">
									<tr>
										<td style="width:15%;">
											<strong>@@alt_call_number@@: </strong>
										</td>
										<td>
											<xsl:for-each
												select="notification_data/phys_item_display/display_alt_call_numbers/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
										</td>
									</tr>
								</xsl:if>-->
							<!--<xsl:if
									test="notification_data/request/selected_inventory_type = 'HOLDING'">
									<tr>
										<td>
											<strong>@@alt_call_number@@: </strong>
											<xsl:for-each
												select="notification_data/phys_item_display/display_alt_call_numbers/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
										</td>
									</tr>
								</xsl:if>-->
							<!--<xsl:if
									test="notification_data/request/selected_inventory_type = 'VIRTUAL_HOLDING'">
									<tr>
										<td>
											<strong>@@alt_call_number@@: </strong>
											<xsl:for-each
												select="notification_data/phys_item_display/display_alt_call_numbers/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
										</td>
									</tr>
								</xsl:if>-->
							<!--</xsl:if>-->
							<!--<tr>
								<td>
									<strong>@@request_type@@: </strong>
									<xsl:value-of select="notification_data/request_type"/>
								</td>
							</tr>-->
							<!--<xsl:if test="notification_data/request/system_notes != ''">
								<tr>
									<td>
										<strong>@@system_notes@@:</strong>
										<xsl:value-of
											select="notification_data/request/system_notes"/>
									</td>
								</tr>
							</xsl:if>-->
							<!--<xsl:if test="notification_data/request/note != ''">
								<tr>
									<td>
										<strong>@@request_note@@:</strong>
										<xsl:value-of select="notification_data/request/note"/>
									</td>
								</tr>
							</xsl:if>-->
						</table>
						<div style="margin-top:360px;"/>
						<div>
							<xsl:attribute name="style">
								<xsl:text>font-size:150%;</xsl:text>
								<xsl:call-template name="flip-text"/>
							</xsl:attribute>
							<xsl:choose>
								<!-- strip trailing " Library" if present-->
								<xsl:when
									test="contains(//notification_data/phys_item_display/location_name, ' Library')">
									<!-- in addition, swap code and long form -->
									<xsl:value-of
										select="substring-after(substring-before(//notification_data/phys_item_display/location_name, ' Library'), ': ')"/>
									<xsl:text>: </xsl:text>
									<xsl:value-of select="substring-before(//notification_data/phys_item_display/location_name, ': ')
										"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of
										select="substring-after(//notification_data/phys_item_display/location_name, ': ')"/>
									<xsl:text>: </xsl:text>
									<xsl:value-of select="substring-before(//notification_data/phys_item_display/location_name, ': ')
										"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<xsl:if
							test="//notification_data/phys_item_display/available_items/available_item/inventory_number[. != '']">
							<!--<div style="margin-top:380px; text-align:left;">
								<b>Inventory Number: </b>
								<br/>
								<br/>
							</div>-->
							<div>
								<xsl:attribute name="style">
									<xsl:text>font-size:300%;</xsl:text>
									<xsl:call-template name="flip-text"/>
								</xsl:attribute>
								<xsl:value-of
									select="//notification_data/phys_item_display/available_items/available_item/inventory_number"
								/>
							</div>
						</xsl:if>
					</div>
				</div>
				<!--	<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
