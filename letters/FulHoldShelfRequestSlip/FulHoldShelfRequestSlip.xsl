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
			<!--<head>
				<xsl:call-template name="generalStyle"/>
			</head>-->
			<body>
				<h2>Expires: <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/></h2>
				<h1 style="font-size: 300%;">
					<b>
						<!--@@requested_for@@ : -->
						<xsl:value-of select="notification_data/user_for_printing/name"/>
					</b>
				</h1>
				<h2>
					<xsl:value-of
						select="notification_data/user_for_printing/identifiers/code_value[code = 'BARCODE'][1]/value"
					/>
				</h2>
				<h2>
					<span>
						<xsl:attribute name="style">
							<xsl:call-template name="barcodeCss"/>
						</xsl:attribute>
						<xsl:text>*</xsl:text>
						<xsl:value-of
							select="notification_data/user_for_printing/identifiers/code_value[code = 'BARCODE'][1]/value"/>
						<xsl:text>*</xsl:text>
					</span>
				</h2>
				<!--<xsl:call-template name="head"/>-->
				<!-- header.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table cellspacing="0" cellpadding="5" border="0">
							<!--<tr>
								<td>
									<h2>
										<b>@@location@@: </b>
										<xsl:value-of
											select="notification_data/phys_item_display/location_name"
										/>
									</h2>
								</td>
							</tr>-->
							<tr>
								<td>
									<h2>
										<b>@@move_to_library@@: </b>
										<xsl:value-of select="notification_data/destination"/>
									</h2>
								</td>
							</tr>
						</table>
						<table cellspacing="0" cellpadding="5" border="0" style="font-size:120%;">
							<xsl:if
								test="notification_data/request/selected_inventory_type = 'ITEM'">
								<tr>
									<td valign="top" style="width:15%;">
										<b>@@item_barcode@@: </b>
									</td>
									<td align="left" style="text-align:left; width:50%;">
										<img src="cid:item_id_barcode.png" alt="Item Barcode"/>
										<!--<span>
											<xsl:attribute name="style"><xsl:call-template name="barcodeCss"/></xsl:attribute>
											
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
							<xsl:if test="notification_data/phys_item_display/call_number != ''">
								<tr>
									<td style="width:15%;">
										<b>@@call_number@@: </b>
									</td>
									<td>
										<xsl:value-of
											select="notification_data/phys_item_display/call_number"
										/>
									</td>
								</tr>
							</xsl:if>
							<!--<xsl:if
								test="notification_data/request/selected_inventory_type = 'ITEM'">
								<tr>
									<td>
										<b>@@note_item_specified_request@@.</b>
									</td>
								</tr>
							</xsl:if>-->
							<xsl:if test="notification_data/request/manual_description != ''">
								<tr>
									<td style="width:15%;">
										<b>@@please_note@@: </b>
									</td>
									<td>@@manual_description_note@@ - <xsl:value-of
											select="notification_data/request/manual_description"
										/></td>
								</tr>
							</xsl:if>
							<!--<xsl:if test="notification_data/external_id != ''">
								<tr>
									<td>
										<b>@@external_id@@: </b>
										<xsl:value-of select="notification_data/external_id"/>
									</td>
								</tr>
							</xsl:if>-->
							<!--<xsl:if test="notification_data/user_for_printing/name">
								<tr>
									<td style="width:15%;">
										<b>@@requested_for@@: </b>
									</td>
									<td>
										<xsl:value-of
											select="notification_data/user_for_printing/name"/>
									</td>
								</tr>
							</xsl:if>-->
							<tr>
								<xsl:call-template name="recordTitle_table"/>
							</tr>
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
							
							<xsl:if
								test="notification_data/phys_item_display/accession_number != ''">
								<tr>
									<td>
										<h2>
											<b>@@accession_number@@: </b>
											<xsl:value-of
												select="notification_data/phys_item_display/accession_number"
											/>
										</h2>
									</td>
								</tr>
							</xsl:if>-->
							<xsl:if
								test="notification_data/phys_item_display/shelving_location/string">
								<xsl:if
									test="notification_data/request/selected_inventory_type = 'ITEM'">
									<tr>
										<td style="width:15%;">
											<b>@@shelving_location_for_item@@: </b>
										</td>
										<td>
											<xsl:for-each
												select="notification_data/phys_item_display/shelving_location/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
										</td>
									</tr>
								</xsl:if>
								<xsl:if
									test="notification_data/request/selected_inventory_type = 'HOLDING'">
									<tr>
										<td style="width:15%;">
											<b>@@shelving_locations_for_holding@@: </b></td><td>
											<xsl:for-each
												select="notification_data/phys_item_display/shelving_location/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
											</td>
									</tr>
								</xsl:if>
								<!--<xsl:if
									test="notification_data/request/selected_inventory_type = 'VIRTUAL_HOLDING'">
									<tr>
										<td>
											<b>@@shelving_locations_for_holding@@: </b>
											<xsl:for-each
												select="notification_data/phys_item_display/shelving_location/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
										</td>
									</tr>
								</xsl:if>-->
							</xsl:if>
							<xsl:if
								test="notification_data/phys_item_display/display_alt_call_numbers/string">
								<xsl:if
									test="notification_data/request/selected_inventory_type = 'ITEM'">
									<tr>
										<td style="width:15%;">
											<b>@@alt_call_number@@: </b></td><td>
											<xsl:for-each
												select="notification_data/phys_item_display/display_alt_call_numbers/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
										</td>
									</tr>
								</xsl:if>
								<xsl:if
									test="notification_data/request/selected_inventory_type = 'HOLDING'">
									<tr>
										<td style="width:15%;">
											<b>@@alt_call_number@@: </b></td><td>
											<xsl:for-each
												select="notification_data/phys_item_display/display_alt_call_numbers/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
										</td>
									</tr>
								</xsl:if>
								<!--<xsl:if
									test="notification_data/request/selected_inventory_type = 'VIRTUAL_HOLDING'">
									<tr>
										<td>
											<b>@@alt_call_number@@: </b>
											<xsl:for-each
												select="notification_data/phys_item_display/display_alt_call_numbers/string">
												<xsl:value-of select="."/> &#160; </xsl:for-each>
										</td>
									</tr>
								</xsl:if>-->
							</xsl:if>
							<b/>
							<!--<tr>
								<td>
									<b>@@request_type@@: </b>
									<xsl:value-of select="notification_data/request_type"/>
								</td>
							</tr>-->
							<!--<xsl:if test="notification_data/request/system_notes != ''">
								<tr>
									<td>
										<b>@@system_notes@@:</b>
										<xsl:value-of
											select="notification_data/request/system_notes"/>
									</td>
								</tr>
							</xsl:if>-->
							<!--<xsl:if test="notification_data/request/note != ''">
								<tr>
									<td>
										<b>@@request_note@@:</b>
										<xsl:value-of select="notification_data/request/note"/>
									</td>
								</tr>
							</xsl:if>-->
							<tr>
								<td style="width:15%;">
									<strong>@@request_id@@: </strong></td><td>
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
						</table>
					</div>
				</div>
				<!--<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
