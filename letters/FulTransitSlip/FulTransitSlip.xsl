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
						<xsl:value-of select="notification_data/request/calculated_destination_name"
						/>
					</b>
					<!--<strong>@@requested_for@@ : <xsl:value-of
							select="notification_data/user_for_printing/name"/>
					</strong>-->
				</h1>
				<!--<xsl:call-template name="head"/>-->
				<!-- header.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table cellspacing="0" cellpadding="5" border="0">
							<xsl:if
								test="notification_data/request/selected_inventory_type = 'ITEM'">
								<tr>
									<td valign="top" style="width:20%;">
										<strong>@@item_barcode@@: </strong>
									</td>
									<td align="left" style="text-align:left;">
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
									<td style="width:20%;">
										<b>@@item_barcode@@ (numeric): </b>
									</td>
									<td align="left" style="text-align:left;">
										<xsl:value-of
											select="//notification_data/phys_item_display/available_items/available_item/barcode"
										/>
									</td>
								</tr>
							</xsl:if>
						</table>
						<table cellspacing="0" cellpadding="5" border="0">
							<!--							<tr>
								<td>@@we_are_transferring_item_below@@</td>
							</tr>-->
							<tr>
								<td style="width:20%;">
									<b>@@from@@: </b>
								</td>
								<td>
									<xsl:value-of
										select="notification_data/request/assigned_unit_name"/>
								</td>
							</tr>
							<tr>
								<td style="width:20%;">
									<b>@@to@@: </b>
								</td>
								<td>
									<xsl:value-of
										select="notification_data/request/calculated_destination_name"
									/>
								</td>
							</tr>
							<tr>
								<td style="width:20%;">
									<b>@@transfer_date@@: </b>
								</td>
								<td>
									<xsl:value-of select="notification_data/request/create_date"/>
								</td>
							</tr>
							<tr>
								<td style="width:20%;">
									<b>@@transfer_time@@: </b>
								</td>
								<td>
									<xsl:value-of select="notification_data/request/create_time"/>
								</td>
							</tr>
							<!--<xsl:if test="notification_data/request/material_type_display">
								<tr>
									<td><b>@@material_type@@: </b>
										<xsl:value-of select="notification_data/request/material_type_display" /></td>
								</tr>
							</xsl:if>-->
							<!--<xsl:if test="notification_data/user_for_printing/note">
								<tr>
									<td>
										<b>@@user_note@@:</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/note" />
									</td>
								</tr>
							</xsl:if>-->
							<!--<xsl:if test="notification_data/request/system_notes">
								<tr>
									<td>
										<b>@@system_notes@@:</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/request/system_notes" />
									</td>
								</tr>
							</xsl:if>-->
							<!--<xsl:if test="notification_data/request/note">
								<tr>
									<td>
										<b>@@request_note@@:</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/request/note" />
									</td>
								</tr>
							</xsl:if>-->
							<xsl:if test="notification_data/user_for_printing/name">
								<tr>
									<td style="width:20%;"/>
									<td>
										<b>@@requested_for@@:</b>
									</td>
								</tr>
								<tr>
									<td style="width:20%;"/>
									<td>
										<xsl:value-of
											select="notification_data/user_for_printing/name"/>
									</td>
								</tr>
								<xsl:if test="notification_data/user_for_printing/email">
									<tr>
										<td style="width:20%;">
											<b>@@email@@: </b>
										</td>
										<td>
											<xsl:value-of
												select="notification_data/user_for_printing/email"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="notification_data/user_for_printing/phone">
									<tr>
										<td style="width:20%;">
											<b>@@tel@@: </b>
										</td>
										<td>
											<xsl:value-of
												select="notification_data/user_for_printing/phone"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td style="width:20%;">
										<b>@@request_date@@: </b>
									</td>
									<td>
										<xsl:value-of select="notification_data/request/create_date"
										/>
									</td>
								</tr>
								<xsl:if test="notification_data/request/lastInterestDate">
									<tr>
										<td style="width:20%;">
											<b>@@expiration_date@@: </b>
										</td>
										<td>
											<xsl:value-of
												select="notification_data/request/lastInterestDate"
											/>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
							<tr>
								<xsl:call-template name="recordTitle_table"/>
							</tr>
							<xsl:if test="notification_data/phys_item_display/owning_library_name">
								<tr>
									<td style="width:20%;">
										<b>@@owning_library@@: </b>
									</td>
									<td>
										<xsl:value-of
											select="notification_data/phys_item_display/owning_library_name"
										/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request_id[not(. = '')]">
								<tr>
									<td style="width:20%;">
										<b>@@request_id@@: </b>
									</td>
									<td>
										<!--<img src="cid:request_id_barcode.png"
										alt="Request Barcode" />-->
										<!--<span>
										<xsl:attribute name="style"><xsl:call-template
											name="barcodeCss"/></xsl:attribute>
										<xsl:text>*</xsl:text>
										<xsl:value-of select="notification_data/request_id"/>
										<xsl:text>*</xsl:text>
									</span>-->
										<xsl:value-of select="notification_data/request_id"/>
										<br/>
									</td>
								</tr>
							</xsl:if>
							
						</table>
						
					</div>
				</div>
				<div><br/><br/>@@print_date@@: <xsl:value-of select="notification_data/request/create_date"/>-
					<xsl:value-of select="notification_data/request/create_time"/></div>
				<!-- recordTitle.xsl -->
				<!--<xsl:call-template name="lastFooter" />-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
