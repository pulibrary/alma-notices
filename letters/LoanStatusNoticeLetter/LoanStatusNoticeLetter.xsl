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
					<xsl:text>Recall Notice</xsl:text>
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
				<br/>
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>
									<!-- 
1.message (the message for when the due date is changed without a recall):
The library has changed the due date of your borrowed item. See details below for the new due date.
2.cancel_recall_date_change (for when a due date is reverted due to a recall being cancelled):
The recall that was placed on your borrowed item has been cancelled, and the original due date has been restored. See details below for the due date.
3.NA: cancel_recall_renew (for when a recall is cancelled and the loan to the original patron is renewed):
The recall that was placed on your borrowed item has been cancelled. The loan has been renewed. See details below for the due date.
4.NA: cancel_recall_no_date_change (for when a recall is cancelled but you don't change the shortened due date):
The recall that was placed on your borrowed item has been cancelled. There is no change in its due date
5.recall_and_date_change (for when a recall shortens a due date):
The following item, currently loaned to you, has been recalled for course reserve or another borrower. Please return it by the new due date to avoid recall fines.
6.NA: recall_and_no_date_change (for when a recall does not modify the due date, likely not used):
Your borrowed item has been recalled. There is no change in its due date.
 -->
									<!-- corresponds to #5 above -->									
									<xsl:if test="notification_data/message='RECALL_DUEDATE_CHANGE'">
										<!--<strong>@@recall_and_date_change@@</strong>-->
										<strong>The following item, currently loaned to you, has been recalled for course reserve or another borrower. Please return it by the new due date to avoid recall fines.
										</strong>
									</xsl:if>
									<!-- corresponds to #6 above -->
									<xsl:if test="notification_data/message='RECALL_ONLY'">
										<!--<strong>@@recall_and_no_date_change@@</strong>-->
										<strong>Your borrowed item has been recalled. There is no change in its due date.
										</strong>
									</xsl:if>
									<!-- corresponds to #1 above -->
									<xsl:if test="notification_data/message='DUE_DATE_CHANGE_ONLY'">
										<!--<strong>@@message@@</strong>-->
										<strong>The library has changed the due date of your borrowed item. See details below for the new due date.</strong>
									</xsl:if>
									<!-- corresponds to #2 above -->
									<xsl:if test="notification_data/message='RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE'">
										<!--<strong>@@cancel_recall_date_change@@</strong>-->
										<strong>The recall that was placed on your borrowed item has been cancelled, and the original due date has been restored. See details below for the due date.
										</strong>
									</xsl:if>
									<!-- corresponds to #3 above -->
									<xsl:if test="notification_data/message='RECALL_CANCEL_ITEM_RENEWED'">
										<!--<strong>@@cancel_recall_renew@@</strong>-->
										<strong>The recall that was placed on your borrowed item has been cancelled. The loan has been renewed. See details below for the due date.
										</strong>
									</xsl:if>
									<!-- corresponds to #4 above -->
									<xsl:if test="notification_data/message='RECALL_CANCEL_NO_CHANGE'">
										<!--<strong>@@cancel_recall_no_date_change@@</strong>-->
										<strong>The recall that was placed on your borrowed item has been cancelled. There is no change in its due date
										</strong>
									</xsl:if>
									
									<br/><br/>
								</td>
							</tr>
							
							<tr>
								<td>
									<b>Please return the item(s) by <xsl:value-of
											select="/notification_data/item_loans/item_loan/due_date"
										/>.</b>
									<br/>
									<br/>
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
											<th>Title</th>
											<th>Author</th>
											<th>Call Number</th>
											<th>Barcode</th>
											<th>Due date</th>
										</tr>
										<xsl:for-each
											select="notification_data/item_loans/item_loan">
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
												<td>
												<xsl:value-of select="due_date"/>
												</td>
											</tr>
										</xsl:for-each>
									</table>
								</td>
							</tr>
							<!--<xsl:if test="notification_data/item_loan/shortened_due_date_reason">
								<tr>
									<td>
										<strong>
											<xsl:text>Reason for recall: </xsl:text>
										</strong>
										<xsl:value-of
											select="notification_data/item_loan/shortened_due_date_reason"/>
										<br/>
										<br/>
									</td>
								</tr>
							</xsl:if>-->
							<!--<table role="presentation">
							<tr>
								<td>@@sincerely@@</td>
							</tr>
							<tr>
								<td>@@department@@</td>
							</tr>
						</table>-->
							<tr>
								<td>
									<xsl:call-template name="contactUs"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="signed"/>
								</td>
							</tr>
						</table>
						<!-- footer.xsl -->
					</div>
				</div>
				<!--<xsl:call-template name="protocols"/>-->
				<!-- footer.xsl -->
				<!--<xsl:call-template name="lastFooter"/>-->
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
