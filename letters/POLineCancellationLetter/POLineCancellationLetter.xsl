<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<!--<xsl:variable name="conta1">0</xsl:variable>
	<xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type"/>
	<xsl:variable name="externalRequestId" select="/notification_data/external_request_id"/>
	<xsl:variable name="externalSystem" select="/notification_data/external_system"/>-->
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
				<!--<h4>@@vendor_name@@: <xsl:value-of select="/notification_data/vendor/name"/></h4>-->
				<div class="messageArea">
					<div class="messageBody">
						<table cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td style="width: 100%"><b><br/><xsl:value-of
											select="notification_data/receivers/receiver/vendor/name"
										/>:</b><br/><br/>The following item(s) are no longer needed.
									Please cancel the order(s) listed. Direct questions to the
									location shown below. <br/><br/>
									<br/></td>
							</tr>
						</table>
						<table cellspacing="0" cellpadding="5" style="text-size:120%;">
							<tr>
								<td style="width: 65%">
									<!-- this element, while available in the default XML that we tested on, is not available in the actual data file. Salesforce ticket submitted, disabling this for now and moving date to the left. -->
									<!--<b>Purchase Order: <xsl:value-of
											select="notification_data/po/number"/></b>-->
									<b>Purchase Order Date: <xsl:value-of
										select="notification_data/line/send_date"/></b>
								</td>
								<td style="text-align:right;">
									<!--<b>Purchase Order Date: <xsl:value-of
											select="notification_data/line/send_date"/></b>-->
								</td>
							</tr>
							<tr>
								<table cellspacing="0" cellpadding="5" border="0">
									<hr/>
									<xsl:for-each select="notification_data/line">
										<tr>
											<td style="padding-left:20px;">
												<br/>
												<b>PO Line Reference Number: </b>
												<xsl:value-of select="line_reference"/>
												<br/>
												<br/>
												<b><xsl:value-of select="identifier_type"/>: </b>
												<xsl:value-of select="identifier"/>
												<br/>
												<br/>
												<b>Title: </b>
												<xsl:value-of select="item_description"/>
												<br/>
												<br/>
												<b>Number of Items Ordered: </b>
												<xsl:value-of select="quantity"/>
												<br/>
												<br/>
												<b>Invoice Number: </b>
												<xsl:value-of select="vendor_invoice_number"/>
												<br/>
												<br/>
												<b>Vendor Reference Number: </b>
												<xsl:value-of select="vendor_reference_number"/>
												<br/>
												<br/>
												<b>Invoice Status: </b>
												<xsl:value-of select="invoice_status"/>
												<br/>
											</td>
										</tr>
									</xsl:for-each>
								</table>
							</tr>
						</table>
						<!--
									<b>@@title@@: </b>
									<xsl:value-of select="notification_data/line/title"/>
									<br/>
									<b>@@order_number@@: </b>
									<xsl:value-of select="notification_data/line/reference_number"/>
									<br/>-->
						<!--<b>Line Item Number: </b>
									<xsl:value-of select="notification_data/line/number"/>
									<br/>
									<b>@@order_date@@: </b>
									<xsl:value-of select="notification_data/line/send_date"/>
									<br/>-->
						<!--<b>Standard Number: </b>
									<xsl:value-of select="notification_data/line/issn_isbn"/>
									<br/>
									<b>Number of Items Ordered: </b>
									<xsl:value-of
										select="notification_data/line/number_of_items_ordered"/>
									<br/>-->
						<!--<b>@@cancellation_reason@@: </b>
									<xsl:value-of
										select="notification_data/line/cancellation_reason"/>
									<br/>-->
						<!--<b>@@cancellation_note@@: </b>
									<xsl:value-of select="notification_data/line/cancellation_note"/>
									<br/>
									<br/>-->
					</div>
				</div>
				<br/>
				<table>
					<tr>
						<td><br/><br/> Sincerely,<br/><br/>
						</td>
					</tr>
					<tr>
						<td>Princeton University Library <br/> Acquisitions Services-Monographs
							<br/> Princeton University Library <br/> 693 Alexander Road <br/>
							Princeton, NJ 08540-6317 USA <br/><br/>Phone: 609-258-3219 <br/>FAX:
							609-258-0441 <br/> E-Mail: orderdiv@princeton.edu</td>
					</tr>
				</table>
				<!--<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
