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
			<head>
				<title>
					<!--<xsl:value-of select="notification_data/general_data/subject"/>-->
					<xsl:text>Cancellation notice</xsl:text>
				</title>
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
							<tr>
								<!--<td> @@on@@ <xsl:value-of
										select="notification_data/general_data/current_date"/>
									@@we_cancel_y_req_of@@ <xsl:value-of
										select="notification_data/request/create_date"/>
									@@detailed_below@@ : </td>-->
								<td>
									<xsl:text>We regret that your request has been cancelled for the item(s) listed below. Cancellations can occur for several reasons. The item available for you was not picked up, or the item you requested was needed for course reserve. If you still need this item, please check the Library’s catalog for the latest status of the item.</xsl:text>
<br/><br/>								
</td>
							</tr>
							<tr>
								<td>
									<table cellpadding="5" class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss"/>
											<!-- style.xsl -->
										</xsl:attribute>
										<tr>
											<th>@@title@@</th>
											<th>@@author@@</th>
											<th>Call Number</th>
											<th>Barcode</th>
										</tr>
										<xsl:for-each select="notification_data/phys_item_display">
											<tr>
												<td>
												<xsl:value-of select="title"/>
												</td>
												<td>
												<xsl:value-of select="author"/>
												</td>
												<td>
												<xsl:value-of select="call_number"/>
												</td>
												<td>
												<xsl:value-of select="barcode"/>
												</td>
											</tr>
										</xsl:for-each>
									</table>
								</td>
							</tr>
							<!-- <xsl:if test="notification_data/metadata/title != ''">
								<tr>
									<td>
										<strong>@@title@@: </strong>
										<xsl:value-of select="notification_data/metadata/title" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/journal_title != ''">
								<tr>
									<td>
										<strong> @@journal_title@@: </strong>
										<xsl:value-of select="notification_data/metadata/journal_title" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/author != ''">
								<tr>
									<td>
										<strong> @@author@@: </strong>
										<xsl:value-of select="notification_data/metadata/author" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/author_initials != ''">
								<tr>
									<td>
										<strong>@@author_initials@@: </strong>
										<xsl:value-of select="notification_data/metadata/author_initials" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/edition != ''">
								<tr>
									<td>
										<strong> @@edition@@: </strong>
										<xsl:value-of select="notification_data/metadata/edition" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/identifier != ''">
								<tr>
									<td>
										<strong>@@identifier@@: </strong>
										<xsl:value-of select="notification_data/metadata/identifier" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/lccn != ''">
								<tr>
									<td>
										<strong> @@lccn@@: </strong>
										<xsl:value-of select="notification_data/metadata/lccn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/issn != ''">
								<tr>
									<td>
										<strong>@@issn@@: </strong>
										<xsl:value-of select="notification_data/metadata/issn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/isbn != ''">
								<tr>
									<td>
										<strong> @@isbn@@: </strong>
										<xsl:value-of select="notification_data/metadata/isbn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/oclc_nr != ''">
								<tr>
									<td>
										<strong> @@oclc_nr@@: </strong>
										<xsl:value-of select="notification_data/metadata/oclc_nr" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/doi != ''">
								<tr>
									<td>
										<strong>@@doi@@: </strong>
										<xsl:value-of select="notification_data/metadata/doi" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/pmid != ''">
								<tr>
									<td>
										<strong> @@pmid@@: </strong>
										<xsl:value-of select="notification_data/metadata/pmid" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/publisher != ''">
								<tr>
									<td>
										<strong> @@publisher@@: </strong>
										<xsl:value-of select="notification_data/metadata/publisher" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/publication_date != ''">
								<tr>
									<td>
										<strong>@@publication_date@@: </strong>
										<xsl:value-of select="notification_data/metadata/publication_date" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/place_of_publication != ''">
								<tr>
									<td>
										<strong> @@place_of_publication@@: </strong>
										<xsl:value-of select="notification_data/metadata/place_of_publication" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/additional_person_name != ''">
								<tr>
									<td>
										<strong> @@additional_person_name@@: </strong>
										<xsl:value-of select="notification_data/metadata/additional_person_name" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/source != ''">
								<tr>
									<td>
										<strong>@@source@@: </strong>
										<xsl:value-of select="notification_data/metadata/source" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/series_title_number != ''">
								<tr>
									<td>
										<strong> @@series_title_number@@: </strong>
										<xsl:value-of select="notification_data/metadata/series_title_number" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/call_number != ''">
								<tr>
									<td>
										<strong> @@call_number@@: </strong>
										<xsl:value-of select="notification_data/metadata/call_number" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/volume != ''">
								<tr>
									<td>
										<strong>@@volume@@: </strong>
										<xsl:value-of select="notification_data/metadata/volume" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/part != ''">
								<tr>
									<td>
										<strong> @@part@@: </strong>
										<xsl:value-of select="notification_data/metadata/part" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/chapter != ''">
								<tr>
									<td>
										<strong> @@chapter@@: </strong>
										<xsl:value-of select="notification_data/metadata/chapter" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/pages != ''">
								<tr>
									<td>
										<strong>@@pages@@: </strong>
										<xsl:value-of select="notification_data/metadata/pages" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/start_page != ''">
								<tr>
									<td>
										<strong> @@start_page@@: </strong>
										<xsl:value-of select="notification_data/metadata/start_page" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/end_pagee != ''">
								<tr>
									<td>
										<strong> @@end_page@@: </strong>
										<xsl:value-of select="notification_data/metadata/end_page" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/issue != ''">
								<tr>
									<td>
										<strong>@@issue@@: </strong>
										<xsl:value-of select="notification_data/metadata/issue" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/metadata/note != ''">
								<tr>
									<td>
										<strong> @@note@@: </strong>
										<xsl:value-of select="notification_data/metadata/note" />
									</td>
								</tr>
							</xsl:if> -->
							<!--<xsl:if test="notification_data/request/start_time != ''">
								<tr>
									<td style="width:20%;">
										<strong> @@start_time@@: </strong></td><td>
										<xsl:value-of
											select="notification_data/booking_start_time_str"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/end_time != ''">
								<tr>
									<td style="width:20%;">
										<strong> @@end_time@@: </strong></td><td>
										<xsl:value-of
											select="notification_data/booking_end_time_str"/>
									</td>
								</tr>
							</xsl:if>-->
							<!--<xsl:if test="notification_data/request/note != ''">
								<tr>
									<td style="width:20%;">
										<strong> @@request_note@@: </strong></td><td>
										<xsl:value-of select="notification_data/request/note"/>
									</td>
								</tr>
							</xsl:if>-->
							<!--<tr>
								<td style="width:20%;">
									<strong> @@reason_deleting_request@@: </strong></td><td>
									<xsl:value-of
										select="notification_data/request/status_note_display"/>
								</td>
							</tr>-->
							<!--<xsl:if test="notification_data/request/cancel_reason != ''">
								<tr>
									<td style="width:20%;">
										<strong> @@request_cancellation_note@@: </strong></td><td>
										<xsl:value-of
											select="notification_data/request/cancel_reason"/>
									</td>
								</tr>
							</xsl:if>-->
							<tr>
								<td>
									<xsl:call-template name="contactUs_brief"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="signed"/>
								</td>
							</tr>
							<!--<table role="presentation">
							<tr>
								<td>@@sincerely@@</td>
							</tr>
							<tr>
								<td>@@department@@</td>
							</tr>
						</table>-->
						</table>
					</div>
				</div>
				<!--<xsl:call-template name="protocols"/>-->
				<!-- footer.xsl -->
				<!-- footer.xsl -->
				<!--<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
