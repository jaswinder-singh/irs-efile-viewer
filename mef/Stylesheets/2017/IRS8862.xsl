<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8862Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form8862Data" select="$RtnDoc/IRS8862"/>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateBox) -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="StaticText"/>
		<xsl:param name="Number"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Width">29mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
				border-right-width:0px;float:right;text-align:right;padding-right:2px;font-size:7pt;
				<xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:2px;</xsl:when><xsl:otherwise>padding-top:4px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:3px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:choose>
				<xsl:when test="$TargetNode">
					<xsl:choose>
						<xsl:when test="$PopulateAsText">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$TargetNode"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="$TargetNode/@referenceDocumentId">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$StaticText">
					<xsl:value-of select="$StaticText"/>
				</xsl:when>
			</xsl:choose>
		</div>
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:right;
				padding:2px 0px 0px 0px;
				border-right-width:0px;font-size:8pt;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	PopulateDayForMonthDayType) -->
	<xsl:template name="PopulateDayForMonthDayType">
		<xsl:param name="TargetNode"/>
		<span>
			<xsl:attribute name="id"><xsl:call-template name="PopulateID"><xsl:with-param name="TargetNode" select="$TargetNode"/></xsl:call-template></xsl:attribute>
			<xsl:call-template name="PopulateChgHistory">
				<xsl:with-param name="targetNode" select="$TargetNode"/>
				<xsl:with-param name="subString" select="'6,2'"/>
			</xsl:call-template>
		</span>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateLine8ChildItem) -->
	<xsl:template name="CreateLine8ChildItem">
		<xsl:param name="Number"/>
		<xsl:param name="TargetNode"/>
		<!-- (8#LETTER#) ////////////////////////////////////////////////////-->
			<div class="styIRS8862CleanDiv" style="width:181mm;height:auto;padding-left:8mm;">
				<div class="styIRS8862LNDesc" style="width:auto;height:auto;">
					<b>Child <xsl:value-of select="$Number"/>
					</b>
					<span style="width:4px;"/>
					date of birth (MM/DD)
					<span style="width:4px;"/>
					<xsl:choose>
						<xsl:when test="$TargetNode">
					<tr>
						<td style="height:2mm; width:141mm;">
						  <div style="border-right:1px solid black;">
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/BirthMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="3"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/BirthMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="4"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						</div>
						</td>
					</tr>
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td style="height:2mm; width:141mm;">
						  <div style="border-right:1px solid black;">
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/BirthMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="3"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/BirthMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="4"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						</div>
						</td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
					<b>/</b>
					<xsl:choose>
						<xsl:when test="$TargetNode">
					<tr>
						<td style="height:2mm; width:141mm;">
						  <div style="border-right:1px solid black;">
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/BirthMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="6"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/BirthMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="7"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						</div>
						</td>
					</tr>
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td style="height:2mm; width:141mm;">
						  <div style="border-right:1px solid black;">
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/BirthMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="6"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/BirthMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="7"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						</div>
						</td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
					<span style="width:25mm;"/>
				</div>
				<div class="styIRS8862LNDesc" style="width:auto;height:auto;">
					<b>Child <xsl:value-of select="$Number"/>
					</b>
					</div>
				<div class="styIRS8862LNDesc" style="width:auto;height:auto;">
					date of death (MM/DD)
					<span style="width:4px;"/>
					<span style="width:4px;"/>
					<xsl:choose>
						<xsl:when test="$TargetNode">
					<tr>
						<td style="height:2mm; width:141mm;">
						  <div style="border-right:1px solid black;">
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/DeathMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="3"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/DeathMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="4"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						</div>
						</td>
					</tr>
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td style="height:2mm; width:141mm;">
						  <div style="border-right:1px solid black;">
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/DeathMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="3"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/DeathMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="4"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						</div>
						</td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
					<b>/</b>
					<xsl:choose>
						<xsl:when test="$TargetNode">
					<tr>
						<td style="height:2mm; width:141mm;">
						  <div style="border-right:1px solid black;">
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/DeathMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="6"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/DeathMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="7"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						</div>
						</td>
					</tr>
						</xsl:when>
						<xsl:otherwise>
					<tr>
						<td style="height:2mm; width:141mm;">
						  <div style="border-right:1px solid black;">
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/DeathMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="6"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$TargetNode/DeathMonthDayDt"/>
								<xsl:with-param name="BoxNum" select="7"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						</div>
						</td>
					</tr>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateLine22ChildItem) -->
	<xsl:template name="CreateLine22ChildItem">
		<xsl:param name="Position"/>
		<xsl:param name="Number"/>
		<xsl:param name="TargetNode"/>
		<!-- (22#LETTER#) ////////////////////////////////////////////////////-->
		<div class="styIRS8862LineItem" style="padding-right:0px;height:auto;">
			<div class="styIRS8862LNDesc" style="width:23mm;height:2mm;padding-left:9mm;">
				<b>Child <xsl:value-of select="$Number"/>
				</b>
				<span style="width:4px;"/>
				<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
				<span style="width:4px;"/>
			</div>
			<div class="styIRS8862CleanDiv" style="width:162mm;height:auto;">
				<xsl:if test="$Position and ($Position = 2)">
					<div class="styIRS8862LNDesc" style="width:100%;height:auto;padding-left:0px;float:none;">
						If same as shown for Child 1, check this box.
						<span style="width:3mm;"/>
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<span style="width:3mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[2]/SameInformationChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataQlfyChildMoreThan1PersonGrp[2]SameInformationChild1Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[2]/SameInformationChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataQlfyChildMoreThan1PersonGrp[2]SameInformationChild1Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<span style="width:3mm;"/>
						Otherwise, enter below:
					</div>
				</xsl:if>
				<xsl:if test="$Position and ($Position = 3)">
					<div class="styIRS8862LNDesc" style="width:100%;height:auto;padding-left:0px;">
						If same as shown for Child 1, check this box.
						<span style="width:3mm;"/>
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<span style="width:3mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[3]/SameInformationChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataQlfyChildMoreThan1PersonGrp[3]SameInformationChild1Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[3]/SameInformationChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataQlfyChildMoreThan1PersonGrp[3]SameInformationChild1Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<span style="width:3mm;"/>
						Or if same as shown for Child 2 (and<br/>
						this is different from address shown for Child 1), check this box.
						<span style="width:3mm;"/>
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<span style="width:3mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[3]/SameInformationChild2Ind"/>
								<xsl:with-param name="BackupName">Form8862DataQlfyChildMoreThan1PersonGrp[3]SameInformationChild2Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[3]/SameInformationChild2Ind"/>
								<xsl:with-param name="BackupName">Form8862DataQlfyChildMoreThan1PersonGrp[3]SameInformationChild2Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<span style="width:3mm;"/>
						Otherwise, enter below:
					</div>
				</xsl:if>
				<div class="styIRS8862CleanDiv" style="width:100%;height:4mm;">
					<div class="styIRS8862LNDesc" style="width:28mm;height:4mm;padding-left:0px;">
						Number and street
					</div>
					<div class="styIRS8862LNDesc" style="width:134mm;height:4mm;font-size:7.25pt;padding-left:0mm;border-bottom-width:1px;border-color:black;border-style:dashed;">
						<xsl:if test="$TargetNode">
							<xsl:if test="count($TargetNode/following-sibling::*) = 0">
								<xsl:choose>
									<xsl:when test="$TargetNode/USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$TargetNode/USAddress/AddressLine1Txt"/>
										</xsl:call-template>
						                <span style="width:2mm;"/>
										<xsl:if test="$TargetNode/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$TargetNode/USAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$TargetNode/ForeignAddress/AddressLine1Txt"/>
										</xsl:call-template>
						                <span style="width:2mm;"/>
										<xsl:if test="$TargetNode/ForeignAddress/AddressLine2Txt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$TargetNode/ForeignAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
							<xsl:if test="($Position = 1) and (count($Form8862Data/QlfyChildMoreThan1PersonGrp/LiveWithChildAddrGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp/LiveWithChildAddrGrp"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Position = 2) and (count($Form8862Data/QlfyChildMoreThan1PersonGrp/LiveWithChildAddrGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp/LiveWithChildAddrGrp"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Position = 3) and (count($Form8862Data/QlfyChildMoreThan1PersonGrp/LiveWithChildAddrGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp/LiveWithChildAddrGrp"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
				<div class="styIRS8862CleanDiv" style="width:100%;height:4mm;">
					<div class="styIRS8862LNDesc" style="width:45mm;height:4mm;padding-left:0px;padding-right:3px;">
						City or town, state, and ZIP code						
					</div>
					<div class="styIRS8862LNDesc" style="width:117mm;height:4mm;font-size:7.25pt;padding-left:0mm;border-bottom-width:1px;border-color:black;border-style:dashed;word-wrap:break-word;">
						<xsl:if test="$TargetNode">
							<xsl:if test="count($TargetNode/following-sibling::*) = 0">
								<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$TargetNode/USAddress"/>
									<xsl:with-param name="ForeignAddressTargetNode" select="$TargetNode/ForeignAddress"/>
								</xsl:call-template>
								<span style="width:7px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/ForeignAddress/CountryCd"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	CreateLine23ChildItem) -->
	<xsl:template name="CreateLine23ChildItem">
		<xsl:param name="Position"/>
		<xsl:param name="Number"/>
		<xsl:param name="TargetNode"/>
		<!-- (23#LETTER#) ////////////////////////////////////////////////////-->
		<div class="styIRS8862LineItem" style="padding-right:0px;height:auto;">
			<div class="styIRS8862LNDesc" style="width:51mm;height:auto;">
				<b>Other person living with Child <xsl:value-of select="$Number"/>:</b>
				<span style="width:4px;"/>
			</div>
			<div class="styIRS8862CleanDiv" style="width:129mm;height:auto;">
				<xsl:if test="$Position and ($Position = 2)">
					<div class="styIRS8862LNDesc" style="width:100%;height:auto;padding-left:0px;">
						If same as shown for Child 1, check this box.
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/SameInformationChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataOtherPersonLiveWithChildGrp2SameInformationChild1Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/SameInformationChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataOtherPersonLiveWithChildGrp2SameInformationChild1Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<span style="width:3mm;"/>
						Otherwise, enter below:
					</div>
				</xsl:if>
				<xsl:if test="$Position and ($Position = 3)">
					<div class="styIRS8862LNDesc" style="width:100%;height:auto;padding-left:0px;">
						If same as shown for Child 1, check this box
						<!--span style="width:3mm;"/-->
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<!--span style="width:3mm;"/-->
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/SameInformationChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataOtherPersonLiveWithChildGrp3SameInformationChild1Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/SameInformationChild1Ind"/>
								<xsl:with-param name="BackupName">Form8862DataOtherPersonLiveWithChildGrp3SameInformationChild1Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<span style="width:3mm;"/>
						Or if same as shown<br/>
						for Child 2 (and this is different from the person living with Child 1), check this box.
						<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/SameInformationChild2Ind"/>
								<xsl:with-param name="BackupName">Form8862DataOtherPersonLiveWithChildGrpSameInformationChild2Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/SameInformationChild2Ind"/>
								<xsl:with-param name="BackupName">Form8862DataOtherPersonLiveWithChildGrpSameInformationChild2Ind</xsl:with-param>
							</xsl:call-template>
						</label>
						<br/>
						Otherwise, enter below:
					</div>
				</xsl:if>
				<div class="styIRS8862CleanDiv" style="width:100%;height:4mm;">
					<div class="styIRS8862LNDesc" style="width:9mm;height:4mm;padding-left:0px;padding-right:3px;">
						Name						
					</div>
					<div class="styIRS8862LNDesc" style="width:118mm;height:4mm;border-bottom-width:1px;border-color:black;border-style:dashed;float:right;">
						<xsl:if test="$TargetNode">
							<xsl:if test="count($TargetNode/following-sibling::*) = 0">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/PersonNm"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Position = 1) and (count($Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Position = 2) and (count($Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="($Position = 3) and (count($Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp) &gt; 1)">
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
				<div class="styIRS8862CleanDiv" style="width:100%;height:4mm;">
					<div class="styIRS8862LNDesc" style="width:auto;height:4mm;padding-left:0px;">
						Relationship to Child <xsl:value-of select="$Number"/>
						<span style="width:4px;"/>
					</div>
					<div class="styIRS8862LNDesc" style="width:95mm;height:4mm;border-bottom-width:1px;border-color:black;border-style:dashed;word-wrap:break-word;float:right;">
						<xsl:if test="$TargetNode">
							<xsl:if test="count($TargetNode/following-sibling::*) = 0">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$TargetNode/RelationshipDescriptionTxt"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	<!-- ////////////////////////////////////////////////////////////// (Template:	PopulateBulletSpan) -->
	<xsl:template name="PopulateBulletSpan">
		<xsl:attribute name="style">width:100%;height:auto;padding-top:0.8mm;</xsl:attribute>
		<img src="{$ImagePath}/8885_Round_Bullet.gif" alt="Round Bullet"/>
		<span style="width:4px;"/>
	</xsl:template>
	<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8862Data)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 8862"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8862Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="IRS8862" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;height:18.5mm;">
						<div class="styFNBox" style="width:29mm;height:18mm;border-right-width:2px;padding-top:0mm;">
							<div style="padding-top:0mm;">
								Form<span class="styFormNumber">  8862</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8862Data"/>
							</xsl:call-template>
							<span class="styAgency">(Rev. January 2018)</span>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:130mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:5.5mm;font-size: 11pt;">
								Information To Claim Certain Refundable Credits After Disallowance<br/>
							</div>
							<div class="styFST" style="height:6mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;font-weight:bold;">
									<div style="width:100%;height:6mm;padding-left:5px;padding-top:1mm;">
									Earned Income Credit, Child Tax Credit/Additional Child Tax Credit, and 
									American Opportunity Tax Credit
										<div style="width:100%;height:6mm;">
											<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to your tax return.<br/>
											<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/> 
											Go to <i>www.irs.gov/Form8862</i> for instructions and the latest information.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:28mm;border-left-width:2px;height:18mm;">
							<div class="styOMB" style="height:50%;font-size:7pt;padding-top:3mm;">OMB No. 1545-0074</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;height:50%;padding-top:2mm;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">43A</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;height:6mm;">
						<div class="styNameBox" style="width:137mm;height:6mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
							</xsl:call-template>
						</div>
						<div style="height:6mm;width:50mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<div class="styBB" style="width:187mm;height:20.5mm;">
						<!-- Instructions to File 8862 Start-->
						<div class="styIRS8862LineItem">
							<div class="styIRS8862CleanDiv" style="width:158mm;">
								<div class="styIRS8862CleanDiv" style="width:187;height:auto;">
									<div class="styIRS8862LNDesc" style="height:100%;width:auto;padding-left:0mm;">
										You must complete Form 8862 and attach it to your tax return if both of the following
										apply.
									</div>
								</div>
								<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
									<div class="styIRS8862LNLeftNumBox" style="width:0mm;padding-right:0px;">
										<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
									</div>
									<div class="styIRS8862LNDesc" style="height:100%;width:187mm;padding-left:5mm;">
										Your earned income credit (EIC), child tax credit (CTC/additional child tax credit (ACTC), or
										American opportunity tax credit (AOTC) was previously reduced or disallowed and you
										received a letter saying you had to complete and attach Form 8862 the next time you claim
										the credit(s).
									</div>
								</div>
								<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
									<div class="styIRS8862LNLeftNumBox" style="width:0mm;">
										<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
									</div>
									<div class="styIRS8862LNDesc" style="height:100%;width:auto;">
										You now want to claim the EIC, CTC/ACTC, or AOTC and you meet all the requirements
										for the credit.
									</div>
								</div>
							</div>
						</div>
						<!-- Instructions to File 8862 (end) -->
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;height:4.5mm;padding-top:.5mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							All Filers
						</div>
					</div>
					<!-- Body -->
					<div class="styBB" style="width:187mm;height:32mm;">
						<!-- (1) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;height:3mm;padding-top:1mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:3mm">1</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:4mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8862LNDesc" style="width:auto;height:4mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:4mm;">
										Enter the tax year for which you are filing this form (for example, 2016)
									</div>
									<div class="styIRS8862LNDesc" style="width:auto;height:4mm;text-align:right;float:right;padding:0px 10px 0px 0px;">
										<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>   
										<span> <img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
									</div>
								</div>
							</div>
							<span style="width:17mm;float:right;"/>	
					<tr>
						<td style="height:2mm; width:141mm;">
						  <div style="border-right:1px solid black;">
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/TaxYr"/>
								<xsl:with-param name="BoxNum" select="1"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/TaxYr"/>
								<xsl:with-param name="BoxNum" select="2"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						    <xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/TaxYr"/>
								<xsl:with-param name="BoxNum" select="3"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						    <xsl:call-template name="PopulateIndividualSizableLetterBox">
								<xsl:with-param name="TargetNode" select="$Form8862Data/TaxYr"/>
								<xsl:with-param name="BoxNum" select="4"/>
						    	<xsl:with-param name="BoxWidth" select="'4mm'"/>
								<xsl:with-param name="BoxHeight" select="'3.5mm'"/>
							    <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
						    </xsl:call-template>
						 </div>
						</td>
					</tr>
						</div>
						<!-- (2) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;height:8mm;padding-top:3mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:3mm">2</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:8mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8862LNDesc" style="width:auto;height:8mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:187mm;height:8mm;">
										Check the box(es) that applies to the credit(s) you are claiming and complete the part(s)
										that matches the box(es) you marked.
									</div>
								</div>
							</div>
							<div class="styIRS8862LineItem" style="width:187mm;height:8mm;">
							<div class="styIRS8862LineItem" style="width:35mm;height:5mm;font-weight:bold;padding-left:9mm;border-bottom-width: 0px;"> <label><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/EICClaimedInd"/>
								<xsl:with-param name="BackupName">IRS8862EICClaimedInd</xsl:with-param></xsl:call-template>Earned Income Credit</label>
							<div class="styIRS8862LineItem" style="width:35mm;font-weight:lighter;padding-left:2mm;border-bottom-width: 0px;"> <font color="gray">(Complete Part II)</font>
					<span style="width:35mm;"/>
					<span style="padding-left:7mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICClaimedInd"/>
											<xsl:with-param name="BackupName">IRS8862EICClaimedInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</span>
							</div>
							</div>
							<span style="width:12mm;"/>
							<div class="styIRS8862LineItem" style="width:50mm;height:5mm;font-weight:bold;font-align:center;padding-left:25mm;padding-bottom:7mm;border-bottom-width: 0px;"> <label><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCClaimedInd"/>
								<xsl:with-param name="BackupName">IRS8862CTCACTCClaimedInd</xsl:with-param></xsl:call-template>Child Tax Credit and
							<span style="width:40mm;">Additional Child Tax Credit</span></label>
							<div class="styIRS8862LineItem" style="width:35mm;font-weight:lighter;padding-left:2mm;border-bottom-width: 0px;"> <font color="gray">(Complete Part III)</font>
					<span style="width:35mm;"/>
					<span style="padding-left:7mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCClaimedInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCClaimedInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</span>
							</div>
							</div>
							<span style="width:40mm;"/>
							<div class="styIRS8862LineItem" style="width:50mm;height:5mm;font-weight:bold;padding-left:9mm;border-bottom-width: 0px;"> <label><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCClaimedInd"/>
								<xsl:with-param name="BackupName">IRS8862AOTCClaimedInd</xsl:with-param></xsl:call-template>American Opportunity Tax Credit</label>
							<div class="styIRS8862LineItem" style="width:35mm;font-weight:lighter;padding-left:10mm;border-bottom-width: 0px;"> <font color="gray">(Complete Part IV)</font>
					<span style="width:35mm;"/>
					<span style="padding-left:7mm;">
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCClaimedInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCClaimedInd</xsl:with-param>
										</xsl:call-template>
									</input>
							</span>
							</div>
							</div>

							</div>
							<div class="styIRS8862LNDesc" style="width:37mm;height:8mm;padding-left:0px;padding-top:4mm;float:right;">
								<span style="float:left;width:auto;height:auto;">
								</span>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;padding-top:.5mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Earned Income Credit
						</div>
					</div>
					<!-- Body -->
					<!-- (3) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;height:8mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:3mm">3</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:8mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8862LNDesc" style="width:auto;height:8mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:8mm;">
										If the <b>only</b> reason your EIC was reduced or disallowed in the year entered on line 1 was because you incorrectly
										reported your earned income or investment income, check &#8220;Yes.&#8221; Otherwise, check &#8220;No.&#8221;
										<span style="width:4mm;"/>
										<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
								</div>
							</div>
							<div class="styIRS8862LNDesc" style="width:34mm;height:8mm;padding-left:0px;padding-top:3.5mm;float:right;background-color:;">
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
												<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
											<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:10.5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
												<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmIncmIncorrectRptInd"/>
											<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
						</div>
						<div class="styIRS8862LNDesc" style="width:181mm;height:10mm;padding-left:12mm;">
							<b>Caution:</b> If you checked &#8220;Yes,&#8221; <b> do not</b> complete the rest of Part II.  Attach this form to your tax return to claim the EIC.<br/> If you checked &#8220;No,&#8221; continue.
					</div>			
						<!-- (4) ////////////////////////////////////////////////////-->
							<div class="styIRS8862LineItem" style="width:187mm;height:8mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:3mm">4</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:8mm;padding:0px 0px 0px 0px;">
								<div class="styIRS8862LNDesc" style="width:auto;height:8mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:8mm;">
										Could you (or your spouse if filing jointly) be claimed as a qualifying child of another person for the year<br/>
										entered on line 1? 
										<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............................</span> 
										<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
								</div>
							</div>
							<div class="styIRS8862LNDesc" style="width:34mm;height:8mm;padding-left:0px;padding-top:3.5mm;float:right;">
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
												<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
											<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:10.5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
												<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/EICEligClmQlfyChldOfOtherInd"/>
											<xsl:with-param name="BackupName">IRS8862EICEligClmIncmIncorrectRptInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
						</div>
						<div class="styIRS8862LNDesc" style="width:181mm;height:10mm;padding-left:11mm;">
							<b>Caution:</b> See the instructions before answering.  If you (or your spouse if filing jointly) answer &#8220;Yes&#8221;
							to question 4 you cannot claim EIC.</div>
						<div style="width:187mm;height:4mm;font-size:8.5pt;padding-left:0mm;padding-bottom:5mm;float:none;">
								<b>If you are claiming the EIC with a qualifying child, continue to Section A.  Otherwise, go to Section B.</b></div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Section A        																							 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;border-top-width: 1px; " class="styBB">
						<!-- Content -->
						<div class="styPartDesc" style="padding-left:15mm;font-size:8.5pt;">
							Section A: Filers With a Qualifying Child or Children
						</div>
					</div>
					<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
						<div class="styIRS8862LNLeftNumBox" style="width:0mm;">
							<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
						</div>
						<div class="styIRS8862LNDesc" style="height:100%;width:auto;">
							Answer questions 5, 7, and 8 for each child for whom you are claiming the EIC.
						</div>
					</div>
					<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
						<div class="styIRS8862LNLeftNumBox" style="width:0mm;">
							<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
						</div>
						<div class="styIRS8862LNDesc" style="height:7mm;width:auto;">
							Enter the name(s) of the child(ren) you listed as Child 1, Child 2, and Child 3 on <b>Schedule EIC</b> for the year entered 
							on line 1 above.
						</div>
					</div>
						<!-- (5a) ////////////////////////////////////////////////////-->
						<xsl:variable name="FilerWithQualifyingChildGrp" select="count($Form8862Data/FilerWithQualifyingChildGrp/ChildFirstAndLastName)"/>
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:2mm;">5a</div>
							<div class="styIRS8862LNDesc" style="width:80mm;height:6mm;">
								<b>Child 1</b>								
								<span style="width:4px;"/>
								<span style="width:60mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$FilerWithQualifyingChildGrp &gt;= 1">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[1]/ChildFirstAndLastName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[1]/ChildFirstAndLastName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (b) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;padding-bottom:7mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">b</div>
							<div class="styIRS8862LNDesc" style="width:80mm;height:6mm;">
								<b>Child 2</b>
								<span style="width:4px;"/>
								<span style="width:60mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$FilerWithQualifyingChildGrp &gt;= 2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[2]/ChildFirstAndLastName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[2]/ChildFirstAndLastName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (c) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:2mm;">c</div>
							<div class="styIRS8862LNDesc" style="width:auto;height:auto;">
								<b>Child 3</b>
								<span style="width:4px;"/>
								<span style="width:60mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$FilerWithQualifyingChildGrp = 3">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[3]/ChildFirstAndLastName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[3]/ChildFirstAndLastName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (6) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:8mm;padding-top:3mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:3mm;">6</div>
								<div class="styIRS8862LNDesc" style="width:auto;height:8mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:8mm;">
										Does your completed Schedule EIC for the year entered on line 1 show you had an EIC qualifying child?
										<span style="width:1mm;"/>
										<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
								</div>
							<div class="styIRS8862LNDesc" style="width:34mm;height:8mm;padding-left:0px;float:right;">
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/QualifyingChildInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/QualifyingChildInd"/>
												<xsl:with-param name="BackupName">IRS8862QualifyingChildInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/QualifyingChildInd"/>
											<xsl:with-param name="BackupName">IRS8862QualifyingChildInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:10.5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/QualifyingChildInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/QualifyingChildInd"/>
												<xsl:with-param name="BackupName">IRS8862QualifyingChildInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/QualifyingChildInd"/>
											<xsl:with-param name="BackupName">IRS8862QualifyingChildInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
						</div>
						<div class="styIRS8862LNDesc" style="width:181mm;height:10mm;padding-left:9.5mm;">
							<b>Caution:</b> If you checked &#8220;No,&#8221; you do not need to complete Part II, Section A.  Go to Part II, Section B.
					</div>			
						<!-- (7) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:8mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:3mm">7</div>
								<div class="styIRS8862LNDesc" style="width:auto;height:8mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:8mm;">
										Enter the number of days each child lived with you in the United States during the year entered on line 1.
									</div>
								</div>
							</div>
							<!-- (Line 7 Child 1) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;padding-left:9mm;">
								<b>Child 1</b>								
								<span style="width:4px;"/>
								<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:choose>
									<xsl:when test="$FilerWithQualifyingChildGrp &gt;= 1">
								<tr>
									<td style="height:2mm; width:141mm;">
									  <div style="border-right:1px solid black;">
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[1]/LiveInUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="1"/> 
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[1]/LiveInUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="2"/>
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[1]/LiveInUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="3"/>
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
											 </div>
											 </td>
						    		</tr>
										</xsl:when>
									<xsl:otherwise>
							    	<tr>
										<td style="height:2mm; width:141mm;">
										  <div style="border-right:1px solid black;">
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[1]/LiveInUSDayCnt"/>
												<xsl:with-param name="BoxNum" select="1"/> 
												 <xsl:with-param name="BoxWidth" select="'4mm'"/>
												 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
												 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[1]/LiveInUSDayCnt"/>
												<xsl:with-param name="BoxNum" select="2"/>
												 <xsl:with-param name="BoxWidth" select="'4mm'"/>
												 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
												 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[1]/LiveInUSDayCnt"/>
												<xsl:with-param name="BoxNum" select="3"/>
												 <xsl:with-param name="BoxWidth" select="'4mm'"/>
												 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
												 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
												</xsl:call-template>	
											 </div>
										</td>
									</tr>										
										</xsl:otherwise>
							    	</xsl:choose>
								<span style="width:25mm;"/>
								<b>Child 2</b>
								<span style="width:4px;"/>
								<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:choose>
									<xsl:when test="$FilerWithQualifyingChildGrp &gt;= 2">
								<tr>
									<td style="height:2mm; width:141mm;">
									  <div style="border-right:1px solid black;">
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[2]/LiveInUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="1"/> 
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[2]/LiveInUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="2"/>
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[2]/LiveInUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="3"/>
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
											 </div>
											 </td>
						    		</tr>
										</xsl:when>
									<xsl:otherwise>
							    	<tr>
										<td style="height:2mm; width:141mm;">
										  <div style="border-right:1px solid black;">
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[2]/LiveInUSDayCnt"/>
												<xsl:with-param name="BoxNum" select="1"/> 
												 <xsl:with-param name="BoxWidth" select="'4mm'"/>
												 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
												 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[2]/LiveInUSDayCnt"/>
												<xsl:with-param name="BoxNum" select="2"/>
												 <xsl:with-param name="BoxWidth" select="'4mm'"/>
												 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
												 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[2]/LiveInUSDayCnt"/>
												<xsl:with-param name="BoxNum" select="3"/>
												 <xsl:with-param name="BoxWidth" select="'4mm'"/>
												 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
												 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
												</xsl:call-template>	
											 </div>
										</td>
									</tr>										
										</xsl:otherwise>
							    	</xsl:choose>
							<span style="width:25mm;"/>
                            <b>Child 3</b>
								<span style="width:4px;"/>
								<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
								<xsl:choose>
									<xsl:when test="$FilerWithQualifyingChildGrp &gt;= 3">
								<tr>
									<td style="height:2mm; width:141mm;">
									  <div style="border-right:1px solid black;">
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[3]/LiveInUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="1"/> 
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[3]/LiveInUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="2"/>
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[3]/LiveInUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="3"/>
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
											 </div>
											 </td>
						    		</tr>
										</xsl:when>
									<xsl:otherwise>
							    	<tr>
										<td style="height:2mm; width:141mm;">
										  <div style="border-right:1px solid black;">
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[3]/LiveInUSDayCnt"/>
												<xsl:with-param name="BoxNum" select="1"/> 
												 <xsl:with-param name="BoxWidth" select="'4mm'"/>
												 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
												 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[3]/LiveInUSDayCnt"/>
												<xsl:with-param name="BoxNum" select="2"/>
												 <xsl:with-param name="BoxWidth" select="'4mm'"/>
												 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
												 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
											<xsl:call-template name="PopulateIndividualSizableLetterBox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[3]/LiveInUSDayCnt"/>
												<xsl:with-param name="BoxNum" select="3"/>
												 <xsl:with-param name="BoxWidth" select="'4mm'"/>
												 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
												 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
												</xsl:call-template>	
											 </div>
										</td>
									</tr>										
										</xsl:otherwise>
							    	</xsl:choose>
							</div>
						<div class="styIRS8862LNDesc" style="width:181mm;height:10mm;padding-left:9.5mm;">
							<b>Caution:</b>  See the instructions for special rules before answering.  If you enter less than 183 (184 if the year on line 1
							is a leap year), you cannot claim the EIC for that child.
					</div>			
						<!-- (8) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;height:8mm;">
							<div class="styIRS8862LNLeftNumBox"  style="padding-right:3mm">8</div>
							<div class="styIRS8862LNDesc" style="width:181mm;height:8mm;">
								If the child was born or died during the year entered on line 1, enter the month and day the child was born and/or died as<br/>
								month (MM)/day (DD).  Otherwise, skip this line.
							</div>
						</div>
						<xsl:call-template name="CreateLine8ChildItem">
							<xsl:with-param name="Number">1</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[1]"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine8ChildItem">
							<xsl:with-param name="Number">2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[2]"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine8ChildItem">
							<xsl:with-param name="Number">3</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/FilerWithQualifyingChildGrp[3]"/>
						</xsl:call-template>
						<div class="styIRS8862LNDesc" style="width:187mm;height:15mm;padding-left:9.5mm;padding-top:1.5mm;">
						Only one person may claim the child as a qualifying chid for the EIC and certain other child-related benefits.  If the child meets
						the conditions to be a qualifying child of any other person (other than your spouse if filling jointly) complete Part V.  If you cannot
						treat any of the children listed above as a qualifying child and have no other qualifying children, go to Part II, Section B.
					</div>-		
						<div class="styBB" style="width:187mm;padding:0px 0px 0px 0px;" ></div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
<!--						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see back of form.
							</span>
						</div>-->
						<div style="text-align:center;font-size:7pt;padding-top:1mm;">
						<span style="width:80mm;"/>
							Cat. No. 25145E
						</div>
						<div style="float:right;padding-top:1mm;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8862</span> (Rev. 1-2018)
						</div>
					</div>
					<br/>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:2mm;">
						<div style="float:left;">
							Form 8862 (Rev. 1-2018)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Section B:																									 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartDesc" style="padding-left:15mm;font-size:8.5pt;">
							Section B: Filers Without a Qualifying Child or Children
						</div>
					</div>
					<!-- Body -->
					<!-- (9a) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;height:4mm;">
							<div class="styIRS8862LNLeftNumBox">9a</div>
									<div class="styIRS8862LNDesc" style="width:181mm;height:4mm;">
										Enter the number of days during the year entered on line 1 that your main home was in the United States
										<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....</span>   
										<span> <img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>										
									<span style="width:3mm;"/>
								<tr>
									<td style="height:2mm; width:141mm;">
									  <div style="border-right:1px solid black;">
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/PrimaryNoQualifyingChildGrp/MainHomeUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="1"/>
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/PrimaryNoQualifyingChildGrp/MainHomeUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="2"/>
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/PrimaryNoQualifyingChildGrp/MainHomeUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="3"/> 
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
										</xsl:call-template>
									 </div>
							    	</td>
								</tr>
								</div>
						</div>
					<!-- (9b) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;height:8.5mm;">
							<div class="styIRS8862LNLeftNumBox">b</div>
									<div class="styIRS8862LNDesc" style="width:181mm;height:8mm;">
										If married filing jointly, enter the number of days during the year entered on line 1 that your spouse's main home was
										in the United States
							<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:.20mm;">......................................</span>   
										<span> <img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
									<span style="width:3mm;"/>
								<tr>
									<td style="height:2mm; width:141mm;">
									  <div style="border-right:1px solid black;">
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/SpouseNoQualifyingChildGrp/MainHomeUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="1"/>
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
											</xsl:call-template>
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/SpouseNoQualifyingChildGrp/MainHomeUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="2"/>
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
										</xsl:call-template>
										<xsl:call-template name="PopulateIndividualSizableLetterBox">
											<xsl:with-param name="TargetNode" select="$Form8862Data/SpouseNoQualifyingChildGrp/MainHomeUSDayCnt"/>
											<xsl:with-param name="BoxNum" select="3"/> 
											 <xsl:with-param name="BoxWidth" select="'4mm'"/>
											 <xsl:with-param name="BoxHeight" select="'3.5mm'"/>
											 <xsl:with-param name="BoxTopPadding" select="'0mm'"/>
										</xsl:call-template>
									 </div>
							    	</td>
								</tr>
									</div>
						</div>
					<div class="styIRS8862LNDesc" style="width:181mm;height:10mm;padding-left:9.5mm;padding-top:.5mm;">
							<b>Caution:</b>  Members of the military stationed outside the United States during the year entered on line 1, see the instructions 
							before answering.  If you enter less than 183 (184 if the year on line 1 is a leap year) on either line 9a or 9b (if filing jointly), you
							cannot claim the EIC.
					</div>			
					<!-- (10a) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;height:4mm;padding-top:3mm;">
							<div class="styIRS8862LNLeftNumBox">10a</div>
									<div class="styIRS8862LNDesc" style="width:169mm;height:4mm;">
										Enter your age at the end of the year on line 1
										<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:.25mm;">.........................</span>  									
									</div>
							<div class="styIRS8862LNDesc" style="width:12mm;height:4mm;padding-left:0px;padding-top:1px;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$Form8862Data/PrimaryNoQualifyingChildGrp/AgeNum"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- (10b) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;height:6mm;padding-top:3mm;">
							<div class="styIRS8862LNLeftNumBox">b</div>
									<div class="styIRS8862LNDesc" style="width:169mm;height:4mm;">
										Enter your spouse's age at the end of the year on line 1
										<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:.25mm;">......................</span>  									
									</div>
							<div class="styIRS8862LNDesc" style="width:12mm;height:4mm;padding-left:0px;padding-top:1px;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$Form8862Data/SpouseNoQualifyingChildGrp/AgeNum"/>
								</xsl:call-template>
							</div>
						</div>
					<div class="styIRS8862LNDesc" style="width:181mm;height:10mm;padding-left:9.5mm;padding-top:2mm;">
							<b>Caution:</b>  If your spouse died during the year entered on line 1 or you are preparing a return for someone who died during
							the year entered on line 1, see the instructions before answering.  If neither you (nor your spouse if filing jointly) were at least age 25
							but under age 65 at the end of the year on line 1, you cannot claim the EIC.
					</div>	
						<!-- (11a) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:6mm;padding-top:5mm;">
							<div class="styIRS8862LNLeftNumBox">11a</div>
								<div class="styIRS8862LNDesc" style="width:auto;height:8mm;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:8mm;">
										Can you be claimed as a dependent on someone else's tax return?
										<span class="styDotLn" style="float:none;clear:none;padding-left:.25mm;">.............</span>
										<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
								</div>
							<div class="styIRS8862LNDesc" style="width:34mm;height:7mm;padding-left:0px;float:right;">
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/PrimaryNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/PrimaryNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
												<xsl:with-param name="BackupName">IRS8862PrimaryNoQualifyingChildGrp/OtherPersonClaimDependentInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/PrimaryNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
											<xsl:with-param name="BackupName">IRS8862PrimaryNoQualifyingChildGrp/OtherPersonClaimDependentInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:10.5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/PrimaryNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/PrimaryNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
												<xsl:with-param name="BackupName">IRS8862PrimaryNoQualifyingChildGrp/OtherPersonClaimDependentInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/PrimaryNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
											<xsl:with-param name="BackupName">IRS8862PrimaryNoQualifyingChildGrp/OtherPersonClaimDependentInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
						</div>
						<!-- (11b) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:8mm;padding-top:2.5mm;">
							<div class="styIRS8862LNLeftNumBox">b</div>
									<div class="styIRS8862LNDesc" style="width:auto;height:8mm;">
										Can your spouse (if filing jointly) be claimed as a dependent on someone else's tax return?
										<span class="styDotLn" style="float:none;clear:none;padding-left:.25mm;">.....</span>
										<img src="{$ImagePath}/8862_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
							<div class="styIRS8862LNDesc" style="width:34mm;height:8mm;padding-left:0px;float:right;">
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/SpouseNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/SpouseNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
												<xsl:with-param name="BackupName">IRS8862SpouseNoQualifyingChildGrp/OtherPersonClaimDependentInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/SpouseNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
											<xsl:with-param name="BackupName">IRS8862SpouseNoQualifyingChildGrp/OtherPersonClaimDependentInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:10.5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/SpouseNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/SpouseNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
												<xsl:with-param name="BackupName">IRS8862SpouseNoQualifyingChildGrp/OtherPersonClaimDependentInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/SpouseNoQualifyingChildGrp/OtherPersonClaimDependentInd"/>
											<xsl:with-param name="BackupName">IRS8862SpouseNoQualifyingChildGrp/OtherPersonClaimDependentInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
						</div>
						<div class="styIRS8862LNDesc" style="width:181mm;height:5mm;padding-left:9.5mm;">
							<b>Caution:</b> If either you (or your spouse if filing jointly) answer &#8220;Yes&#8221; to question 11, you cannot claim the EIC.
					</div>	
					<div class="styBB" style="width:187mm;height:2mm;"></div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part III																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;padding-top:.5mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Child Tax Credit and Additional Child Tax Credit
						</div>
					</div>
					<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
						<div class="styIRS8862LNLeftNumBox" style="width:0mm;">
							<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
						</div>
						<div class="styIRS8862LNDesc" style="height:100%;width:auto;">
							Answer the following questions for each child for whom you are claiming the CTC/ACTC.*
						</div>
					</div>
					<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
						<div class="styIRS8862LNLeftNumBox" style="width:0mm;">
							<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
						</div>
						<div class="styIRS8862LNDesc" style="height:7mm;width:auto;">
							Enter the name(s) of the child as listed on your tax return.
						</div>
					</div>
						<!-- (12a) ////////////////////////////////////////////////////-->
						<xsl:variable name="CTCACTCChildInformationGrp" select="count($Form8862Data/CTCACTCChildInformationGrp/ChildFirstAndLastName)"/>
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">12a</div>
							<div class="styIRS8862LNDesc" style="width:80mm;height:6mm;">
								<b>Child 1</b>								
								<span style="width:4px;"/>
								<span style="width:65mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$CTCACTCChildInformationGrp &gt;= 1">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/ChildFirstAndLastName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/ChildFirstAndLastName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (b) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;padding-bottom:7mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">b</div>
							<div class="styIRS8862LNDesc" style="width:80mm;height:6mm;">
								<b>Child 2</b>
								<span style="width:4px;"/>
								<span style="width:65mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$CTCACTCChildInformationGrp &gt;= 2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/ChildFirstAndLastName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/ChildFirstAndLastName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (c) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">c</div>
							<div class="styIRS8862LNDesc" style="width:auto;height:auto;">
								<b>Child 3</b>
								<span style="width:4px;"/>
								<span style="width:65mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$CTCACTCChildInformationGrp &gt;= 3">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/ChildFirstAndLastName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/ChildFirstAndLastName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (13) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:10mm;padding-top:3.5mm;padding-bottom:5mm;">
							<div class="styIRS8862LNLeftNumBox" style="text-align:center;padding-left:2mm;">13</div>
									<div class="styIRS8862LNDesc" style="width:175mm;height:10mm;">
										Did the child meet the requirements to be a qualifying child for the purpose of claiming the CTC/ACTC?  If you answer 
										&#8220;No&#8221; for any child, you cannot claim the credit for that child.  See Pub. 972 for more information.
									</div>
						</div>
							<!-- (Line 13 Child 1) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;padding-left:9mm;padding-top:1.5mm;font-size:8.5pt;">
								<b>Child 1</b>			
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/QualifyingChildInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/QualifyingChildInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/QualifyingChildInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/QualifyingChildInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/QualifyingChildInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/QualifyingChildInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/QualifyingChildInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/QualifyingChildInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/QualifyingChildInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/QualifyingChildInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							<!-- (Line 13 Child 2) ////////////////////////////////////////////////////-->
								<span style="width:15mm;"/>
								<b style="font-size:8pt;">Child 2</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/QualifyingChildInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/QualifyingChildInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/QualifyingChildInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/QualifyingChildInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/QualifyingChildInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/QualifyingChildInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/QualifyingChildInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/QualifyingChildInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/QualifyingChildInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/QualifyingChildInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
				<!-- (Line 13 Child 3) ////////////////////////////////////////////////////-->
							<span style="width:15mm;"/>
                            <b style="font-size:8pt;">Child 3</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/QualifyingChildInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/QualifyingChildInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/QualifyingChildInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/QualifyingChildInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/QualifyingChildInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/QualifyingChildInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/QualifyingChildInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/QualifyingChildInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/QualifyingChildInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/QualifyingChildInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
						<!-- (14) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:8mm;padding-top:5mm;padding-bottom:2.5mm;">
							<div class="styIRS8862LNLeftNumBox" style="text-align:center;padding-left:2mm;">14</div>
									<div class="styIRS8862LNDesc" style="width:175mm;height:5mm;">
										Did the child live with you for more than half of the year entered on line 1?	
									</div>
						</div>
							<!-- (Line 14 Child 1) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;padding-left:9mm;padding-top:1.5mm;font-size:8.5pt;">
								<b>Child 1</b>			
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/LiveWithChildOverHalfYearInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/LiveWithChildOverHalfYearInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/LiveWithChildOverHalfYearInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/LiveWithChildOverHalfYearInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/LiveWithChildOverHalfYearInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/LiveWithChildOverHalfYearInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/LiveWithChildOverHalfYearInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/LiveWithChildOverHalfYearInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/LiveWithChildOverHalfYearInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/LiveWithChildOverHalfYearInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
								<span style="width:15mm;"/>
								<b style="font-size:8pt;">Child 2</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/LiveWithChildOverHalfYearInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/LiveWithChildOverHalfYearInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/LiveWithChildOverHalfYearInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/LiveWithChildOverHalfYearInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/LiveWithChildOverHalfYearInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/LiveWithChildOverHalfYearInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/LiveWithChildOverHalfYearInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/LiveWithChildOverHalfYearInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/LiveWithChildOverHalfYearInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/LiveWithChildOverHalfYearInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							<span style="width:15mm;"/>
                            <b style="font-size:8pt;">Child 3</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/LiveWithChildOverHalfYearInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/LiveWithChildOverHalfYearInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/LiveWithChildOverHalfYearInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/LiveWithChildOverHalfYearInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/LiveWithChildOverHalfYearInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/LiveWithChildOverHalfYearInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/LiveWithChildOverHalfYearInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/LiveWithChildOverHalfYearInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/LiveWithChildOverHalfYearInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/LiveWithChildOverHalfYearInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
							<div class="styIRS8862LNDesc" style="width:181mm;height:7mm;padding-left:9.5mm;padding-top:3mm;">
									<b>Caution:</b> See instructions for special rules before answering.  If the answer is &#8220;No,&#8221; you cannot claim 
										the CTC/ACTC for that child.
							</div>	
							<div class="styIRS8862LNDesc" style="width:175mm;height:4mm;padding-top:5mm;padding-bottom:2mm;padding-left:0mm;">
									Complete lines <b>15-18</b> for any child for whom you were required to complete Part I of Schedule 8812 for the year listed
									in line 1.
							</div>
						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:10mm;padding-top:3.5mm;padding-bottom:5mm;">
							<div class="styIRS8862LNLeftNumBox" style="text-align:center;padding-left:2mm;">15</div>
									<div class="styIRS8862LNDesc" style="width:175mm;height:10mm;">
										Is the child a resident of the United States because the child meets the substantial presence test and is not otherwise
										treated as nonresident ailen?
									</div>
						</div>
							<!-- (Line 15 Child 1) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;padding-left:9mm;padding-top:1.5mm;font-size:8.5pt;">
								<b>Child 1</b>			
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/SubstantialPresenceTestInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/SubstantialPresenceTestInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/SubstantialPresenceTestInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/SubstantialPresenceTestInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/SubstantialPresenceTestInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/SubstantialPresenceTestInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/SubstantialPresenceTestInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/SubstantialPresenceTestInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/SubstantialPresenceTestInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[1]/SubstantialPresenceTestInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
								<span style="width:15mm;"/>
								<b style="font-size:8pt;">Child 2</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGr[2]/SubstantialPresenceTestInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/SubstantialPresenceTestInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/SubstantialPresenceTestInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/SubstantialPresenceTestInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/SubstantialPresenceTestInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/SubstantialPresenceTestInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/SubstantialPresenceTestInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/SubstantialPresenceTestInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/SubstantialPresenceTestInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[2]/SubstantialPresenceTestInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							<span style="width:15mm;"/>
                            <b style="font-size:8pt;">Child 3</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/SubstantialPresenceTestInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/SubstantialPresenceTestInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/SubstantialPresenceTestInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/SubstantialPresenceTestInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/SubstantialPresenceTestInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/SubstantialPresenceTestInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/SubstantialPresenceTestInd"/>
												<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/SubstantialPresenceTestInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/SubstantialPresenceTestInd"/>
											<xsl:with-param name="BackupName">IRS8862CTCACTCChildInformationGrp[3]/SubstantialPresenceTestInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
							<div class="styIRS8862LNDesc" style="width:181mm;height:12mm;padding-left:9.5mm;padding-top:3mm;">
									<b>Caution:</b> You cannot claim the CTC/ACTC for a child who is not a citizen, national, or resident of the United States.  
									Even if your child does not meet the substantial presence test, your child may meet an exception or be treated as a resident
									of the United States in certain circumstances.  See the Instructions for Schedule 8812 for more information.
							</div>	
							<span style="width:16mm;height:5mm;float:right;"/>
						<table class="styTable" style="width:187mm;height:auto;" cellspacing="0">
							<thead class="styTableThead" style="height:0px;">
								<tr style="">
									<td style="width:7.4mm;"/>
									<td style="width:63.6mm;"/>
									<td style="width:8mm;"/>
									<td style="width:36mm;"/>
									<td style="width:39.5mm;"/>
									<td style="width:39.5mm;"/>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
											<tr>
												<td class="styTableCell"  colspan="2" style="text-align:left;width:71mm;padding-top:0mm;padding-right:2mm;border-bottom-width:0px;border-right-width:0px;">
                                                   <span class="styTableCellPad"/>												
												</td>
												<td class="styTableCell" style="width:8mm;border-left-width:0px;border-right:0px;border-bottom-width:0px;">
													<span class="styTableCellPad"/>
												</td>
													<td class="styTableCell" rowspan="1" style="width:32mm;text-align:center;border-right:0px;">
														<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
                                                        </span>
													</td>
													<td class="styTableCell" rowspan="1" style="width:37mm;text-align:center;border-left:0px;border-right:0px;">
														<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
                                                        </span>
													</td>
													<td class="styTableCell"  rowspan="1" style="width:38mm;text-align:center;border-right:0px;border-left:0px;">
														<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
                                                        </span>
													</td>
											</tr>
											<tr>
											   	<td class="styTableCell"  colspan="2" style="text-align:left;width:71mm;padding-top:0mm;padding-right:2mm;border-right-width:0px;">										
												</td>
												<td class="styTableCell" style="width:8mm;border-left-width:0px;">
													<span class="styTableCellPad"/>
												</td>
													<td class="styTableCell" style="width:32.5mm;text-align:center;font-size:8pt;border-left-width:0px;">
														<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
														<b>Child 1</b>
                                                        </span>
													</td>
													<td class="styTableCell" style="width:38mm;text-align:center;font-size:8pt;border-left-width:0px;">
													<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
														<b>Child 2</b>
                                                        </span>
													</td>
													<td class="styTableCell" style="width:38mm;text-align:center;font-size:8pt;border-left-width:0px;">
														<span class="styBoldText" style="font-size:8pt;text-align:center;">                                           
														<b>Child 3</b>
                                                        </span>
													</td>
											</tr>
											<!-- Line 16 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;border-top-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;font-size:7pt;">
                                                     16
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:100mm;text-align:left;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Enter the number of days the child lived in the
													United States during the year entered on line 1
													<span class="styDotLn" style="padding-right:1mm;float:right;">............</span>
													</span>
												</td>
												<!-- Column 3-->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">16</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;text-align:right;">
														<xsl:if test="$CTCACTCChildInformationGrp &gt;= 1">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/LiveInUSDayCnt"/>
															</xsl:call-template>
														</xsl:if>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;text-align:right;">
														<xsl:if test="$CTCACTCChildInformationGrp &gt;= 2">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/LiveInUSDayCnt"/>
															</xsl:call-template>
														</xsl:if>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;text-align:right;">
														<xsl:if test="$CTCACTCChildInformationGrp &gt;= 3">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/LiveInUSDayCnt"/>
															</xsl:call-template>
														</xsl:if>
												</td>
											</tr>
										<!-- Line 17 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;vertical-align:top;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;font-size:7pt;padding-top:1mm;">
                                                         17
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;">
													<span style="font-size:7pt;float:left;padding-left:1.5mm;">Enter the number of days the child lived in the United
													States during the calendar year before the year entered on line 1
													<span class="styDotLn" style="padding-right:1mm;float:right;">....</span>
													</span>
												</td>
												<!-- Column 3-->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">17</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;text-align:right;">
														<xsl:if test="$CTCACTCChildInformationGrp &gt;= 1">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/LiveInUSCalendarYearDayCnt"/>
															</xsl:call-template>
														</xsl:if>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;text-align:right;">
														<xsl:if test="$CTCACTCChildInformationGrp &gt;= 2">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/LiveInUSCalendarYearDayCnt"/>
															</xsl:call-template>
														</xsl:if>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;text-align:right;">
														<xsl:if test="$CTCACTCChildInformationGrp &gt;= 3">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/LiveInUSCalendarYearDayCnt"/>
															</xsl:call-template>
														</xsl:if>
												</td>
											</tr>
											<!-- Line 18 -->
											<tr>
												<!-- Column 1 -->
												<td class="styTableCell" style="width:7.4mm;border-right-width:0px;">
													<span class="styBoldText" style="float:left;text-align:left;padding-left:2mm;padding-right:2mm;font-size:7pt;">
                                                      18
                                                    </span>
												</td>
												<!-- Column 2 -->
												<td class="styTableCell" style="width:63.6mm;text-align:left;">
												<span style="font-size:7pt;float:left;padding-left:1.5mm;">Enter the number of days the child lived in the United
												States in the year which is two years before the year entered on line 1
													<span class="styDotLn" style="padding-right:1mm;float:right;">...</span>
													</span>
												</td>
												<!-- Column 3 -->
												<td class="styTableCell" style="text-align:center;width:8mm;">
													<span class="styBoldText" style="font-size:7pt;">18</span>
												</td>
												<!-- Column 4 -->
												<td class="styTableCell" style="width:33mm;text-align:right;">
														<xsl:if test="$CTCACTCChildInformationGrp &gt;= 1">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[1]/LiveInUS2YrPriorTaxYearDayCnt"/>
															</xsl:call-template>
														</xsl:if>
												</td>
												<!-- Column 5 -->
												<td class="styTableCell" style="width:37mm;text-align:right;">
														<xsl:if test="$CTCACTCChildInformationGrp &gt;= 2">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[2]/LiveInUS2YrPriorTaxYearDayCnt"/>
															</xsl:call-template>
														</xsl:if>
												</td>
												<!-- Column 6 -->
												<td class="styTableCell" style="width:38mm;text-align:right;">
														<xsl:if test="$CTCACTCChildInformationGrp &gt;= 3">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$Form8862Data/CTCACTCChildInformationGrp[3]/LiveInUS2YrPriorTaxYearDayCnt"/>
															</xsl:call-template>
														</xsl:if>
												</td>
											</tr>
											<!-- End of Line 18 -->
                            </tbody>
						</table>
					<br/>
						<div class="styIRS8862LNDesc" style="width:175mm;height:4mm;padding-top:2mm;padding-bottom:2mm;padding-left:0mm;">
									<i>*If you have more than three qualifying children, attach a statement also answering questions 12-18 for those children.</i>
							</div>
							<div class="styBB" style="width:187mm;padding:10px 0px 0px 0px;" ></div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;padding-top:1mm;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8862</span> (Rev. 1-2018)
						</div>
					</div>
					<br/>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;">
						<div style="float:left;">
							Form 8862 (Rev. 1-2018)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
					<!-- (Part III continued) ////////////////////////////////////////////////////-->
						<!-- Content -->
						<div class="styPartName" style="width:15mm;padding-top:.5mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Child Tax Credit and Additional Child Tax Credit <span style="font-weight:normal"> <i>(continued)</i></span>
						</div>
					</div>
					<div class="styIRS8862LNDesc" style="padding-left:18mm;font-size:8.5pt;font-weight:bold">
							Substantial Presence Test
					</div>
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB"></div>
					<div class="styIRS8862LNDesc" style="width:175mm;height:4mm;padding-top:1mm;padding-bottom:2mm;padding-left:0mm;">
							To meet the substantial presence test a child with an ITIN must be physcially present in the United States on at least:
					</div>
					<!-- (Lines a & b Sustantial Presence Test) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;height:4mm;padding-top:2mm;padding-left:3mm;">
							<div class="styIRS8862LNLeftNumBox">a</div>
									<div class="styIRS8862LNDesc" style="width:169mm;height:4mm;padding-left:1mm;">
										31 days during the year for which you are filing this form, and									
									</div>
						</div>
						<div class="styIRS8862LineItem" style="width:187mm;height:4mm;padding-top:2mm;padding-left:3mm;">
							<div class="styIRS8862LNLeftNumBox">b</div>
									<div class="styIRS8862LNDesc" style="width:175mm;height:4mm;padding-left:1mm;">
										183 days during the 3-year period that includes the year for which you are filing this form and the two
										prior years, counting:								
									</div>
						</div>
						<div class="styIRS8862LNDesc" style="width:175mm;height:14mm;padding-left:10mm;padding-top:1.5mm;">
						<span>
							<xsl:call-template name="PopulateBulletSpan"/>
									All the days the child was present in the year for which you are filing this form, and
						</span>
						<span>
							<xsl:call-template name="PopulateBulletSpan"/>
									1/3 of the days the child was present in the first year prior to the year for which you are filing this form, and
						</span>
						<span>
							<xsl:call-template name="PopulateBulletSpan"/>
									1/6 of the days the child was present in the second year prior to the year for which you are filing this form.
						</span>
						</div>
					<div class="styIRS8862LNDesc" style="width:175mm;height:4mm;padding-top:1mm;padding-bottom:1mm;padding-left:0mm;">
							For special rules and execeptions, see Pub. 519.
					</div>
					<div class="styIRS8862LNDesc" style="width:187mm;height:12mm;padding-left:9.5mm;padding-top:1.5mm;">
						Only one person can claim the child as a qualifying chid for the CTC/ACTC.  If the child meets the conditions to be a qualifying 
						child of any other person (other than your spouse if filling jointly) complete Part V.  If you cannot treat any of the children listed 
						above as a qualifying child and have no other qualifying children, you cannot claim the CTC/ACTC.
					</div>
					<div class="styBB" style="width:187mm;height:2mm;"></div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part IV																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;padding-top:.5mm;">Part IV</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							American Opportunity Tax Credit
						</div>
					</div>
					<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
						<div class="styIRS8862LNLeftNumBox" style="width:0mm;">
							<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
						</div>
						<div class="styIRS8862LNDesc" style="height:100%;width:auto;">
							Answer the following questions for each student for whom you are claming the AOTC.*
						</div>
					</div>
					<div class="styIRS8862CleanDiv" style="width:100%;height:auto;">
						<div class="styIRS8862LNLeftNumBox" style="width:0mm;">
							<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
						</div>
						<div class="styIRS8862LNDesc" style="height:7mm;width:auto;">
							Enter the name(s) of the student(s) as listed on Form 8863.
						</div>
					</div>
						<!-- (19a) ////////////////////////////////////////////////////-->
						<xsl:variable name="AOTCStudentInformationGrp" select="count($Form8862Data/AOTCStudentInformationGrp/StudentName)"/>
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;height:6mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">19a</div>
							<div class="styIRS8862LNDesc" style="width:85mm;height:6mm;">
								<b>Student 1</b>								
								<span style="width:4px;"/>
								<span style="width:65mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$AOTCStudentInformationGrp &gt;= 1">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/StudentName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/StudentName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (b) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;padding-bottom:7mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">b</div>
							<div class="styIRS8862LNDesc" style="width:85mm;height:6mm;">
								<b>Student 2</b>
								<span style="width:4px;"/>
								<span style="width:65mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$AOTCStudentInformationGrp &gt;= 2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/StudentName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/StudentName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (c) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">c</div>
							<div class="styIRS8862LNDesc" style="width:85mm;height:6mm;">
								<b>Student 3</b>
								<span style="width:4px;"/>
								<span style="width:65mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$AOTCStudentInformationGrp &gt;= 3">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/StudentName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/StudentName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (20a) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:10mm;padding-top:3.5mm;padding-bottom:5mm;">
							<div class="styIRS8862LNLeftNumBox" style="text-align:center;padding-left:2mm;">20a</div>
									<div class="styIRS8862LNDesc" style="width:175mm;height:10mm;">
										Did the student meet the requirements to be an eligible student for the purposes of the AOTC for the year entered on line
										 1?  See Pub. 970 for more information.
									</div>
						</div>
							<!-- (Child 1) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;padding-left:9mm;padding-top:1.5mm;font-size:8.5pt;">
								<b>Student 1</b>			
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/EligibleStudentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/EligibleStudentInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/EligibleStudentInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/EligibleStudentInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/EligibleStudentInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/EligibleStudentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/EligibleStudentInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/EligibleStudentInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/EligibleStudentInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/EligibleStudentInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
								<span style="width:15mm;"/>
								<b style="font-size:8pt;">Student 2</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/EligibleStudentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/EligibleStudentInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/EligibleStudentInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/EligibleStudentInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/EligibleStudentInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/EligibleStudentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/EligibleStudentInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/EligibleStudentInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/EligibleStudentInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/EligibleStudentInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							<span style="width:15mm;"/>
                            <b style="font-size:8pt;">Student 3</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/EligibleStudentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/EligibleStudentInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/EligibleStudentInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/EligibleStudentInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/EligibleStudentInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/EligibleStudentInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/EligibleStudentInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/EligibleStudentInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/EligibleStudentInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/EligibleStudentInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
						<!-- (20b) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:12mm;padding-top:5mm;padding-bottom:2.5mm;">
							<div class="styIRS8862LNLeftNumBox" style="text-align:center;padding-left:5mm;">b</div>
									<div class="styIRS8862LNDesc" style="width:175mm;height:5mm;padding-bottom:4mm;">
										Did the student receive a Form 1098-T from the institution for the year entered on line 1 of the year immediately preceding
										 that year?	
									</div>
						</div>
							<!-- (Child 1) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;padding-left:9mm;padding-top:1.5mm;font-size:8.5pt;">
								<b>Student 1</b>			
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/ReceiveForm1098TInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/ReceiveForm1098TInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/LiveWithChildOverHalfYearInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/ReceiveForm1098TInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/LiveWithChildOverHalfYearInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/ReceiveForm1098TInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/ReceiveForm1098TInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/ReceiveForm1098TInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/ReceiveForm1098TInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/ReceiveForm1098TInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
					<!-- (Child 2) ////////////////////////////////////////////////////-->
								<span style="width:15mm;"/>
								<b style="font-size:8pt;">Student 2</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/ReceiveForm1098TInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/ReceiveForm1098TInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/ReceiveForm1098TInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/ReceiveForm1098TInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/ReceiveForm1098TInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/ReceiveForm1098TInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/ReceiveForm1098TInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/ReceiveForm1098TInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/ReceiveForm1098TInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/ReceiveForm1098TInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							<!-- (Child 3) ////////////////////////////////////////////////////-->
							<span style="width:15mm;"/>
                            <b style="font-size:8pt;">Student 3</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/ReceiveForm1098TInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/ReceiveForm1098TInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/ReceiveForm1098TInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/ReceiveForm1098TInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/ReceiveForm1098TInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/ReceiveForm1098TInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/ReceiveForm1098TInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/ReceiveForm1098TInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/ReceiveForm1098TInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/ReceiveForm1098TInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
						<!-- (20c) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:10mm;padding-top:3.5mm;padding-bottom:5mm;">
							<div class="styIRS8862LNLeftNumBox" style="text-align:center;padding-left:5mm;">c</div>
									<div class="styIRS8862LNDesc" style="width:175mm;height:10mm;">
										Has the Hope Scholarship Credit or American opportunity credit been claimed for the student for any 4 tax years before the
										year entered on line1?
									</div>
						</div>
							<!-- (Child 1) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;padding-left:9mm;padding-top:1.5mm;font-size:8.5pt;">
								<b>Student 1</b>			
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/PriorYearCreditClaimedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/PriorYearCreditClaimedInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/PriorYearCreditClaimedInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/PriorYearCreditClaimedInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/PriorYearCreditClaimedInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/PriorYearCreditClaimedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/PriorYearCreditClaimedInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/PriorYearCreditClaimedInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[1]/PriorYearCreditClaimedInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[1]/PriorYearCreditClaimedInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
								<span style="width:15mm;"/>
								<b style="font-size:8pt;">Student 2</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/PriorYearCreditClaimedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/PriorYearCreditClaimedInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/PriorYearCreditClaimedInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/PriorYearCreditClaimedInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/PriorYearCreditClaimedInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/PriorYearCreditClaimedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/PriorYearCreditClaimedInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/PriorYearCreditClaimedInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[2]/PriorYearCreditClaimedInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[2]/PriorYearCreditClaimedInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							<span style="width:15mm;"/>
                            <b style="font-size:8pt;">Student 3</b>
								<span style="width:2mm;"/>					
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/PriorYearCreditClaimedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/PriorYearCreditClaimedInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/PriorYearCreditClaimedInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/PriorYearCreditClaimedInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/PriorYearCreditClaimedInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								<span style="width:5mm;"/>
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/PriorYearCreditClaimedInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/PriorYearCreditClaimedInd"/>
												<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/PriorYearCreditClaimedInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/AOTCStudentInformationGrp[3]/PriorYearCreditClaimedInd"/>
											<xsl:with-param name="BackupName">IRS8862AOTCStudentInformationGrp[3]/PriorYearCreditClaimedInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
							</div>
							<div class="styIRS8862LNDesc" style="width:181mm;height:24mm;padding-left:9.5mm;padding-top:2mm;">
									<b>Caution:</b> See the instructions for special rules regarding Form 1098-T before answering.  If you answered  &#8220;No&#8221;
									to questions 20a and 20b, or &#8220;Yes&#8221;  to questions 20c, you cannot claim the credit for that student. <br/>  <br/>  
									You cannot claim the AOTC based on qualified education expenses paid for a student by someone other than yourself or your 
									spouse, unless you are claiming the student as a dependent.  If the student meets the conditions to be a qualifying child of any other
									person (other than your spouse if filing jointly) complete Part V.
							</div>	
							<div style="width:187mm;height:4mm;font-size:8.5pt;padding-left:0mm;padding-bottom:3mm;padding-top:3mm;float:none;">
								<i>*If you have more than three students, attach a statement also answering questions 19 and 20 for those students.</i></div>
					<div class="styBB" style="width:187mm;height:2mm;"></div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part V																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;padding-top:.5mm;">Part V</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Qualifying Child of More Than One Person
						</div>
					</div>
					<div class="styIRS8862CleanDiv" style="width:187mm;height:12mm;">
						<div class="styIRS8862LNLeftNumBox" style="width:2mm;">
							<img src="{$ImagePath}/8862_Check.gif" alt="Check"/>
						</div>
						<div class="styIRS8862LNDesc" style="height:7mm;width:185mm;">
							Answer the following questions for each child who meets the conditions to be a qualifying child of any other person (other than your spouse
							if filing jointly).*
						</div>
					</div>
						<!-- (21a) ////////////////////////////////////////////////////-->
						<xsl:variable name="QlfyChildMoreThan1PersonGrp" select="count($Form8862Data/QlfyChildMoreThan1PersonGrp/ChildFirstAndLastName)"/>
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;height:6mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">21a</div>
							<div class="styIRS8862LNDesc" style="width:80mm;height:6mm;">
								<b>Child 1</b>								
								<span style="width:4px;"/>
								<span style="width:60mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$QlfyChildMoreThan1PersonGrp &gt;= 1">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[1]/ChildFirstAndLastName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[1]/ChildFirstAndLastName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (b) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;padding-bottom:7mm;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">b</div>
							<div class="styIRS8862LNDesc" style="width:80mm;height:6mm;">
								<b>Child 2</b>
								<span style="width:4px;"/>
								<span style="width:60mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$QlfyChildMoreThan1PersonGrp &gt;= 2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[2]/ChildFirstAndLastName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[2]/ChildFirstAndLastName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (c) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:93.5mm;float:left;">
							<div class="styIRS8862LNLeftNumBox" style="padding-right:0px;">c</div>
							<div class="styIRS8862LNDesc" style="width:80mm;height:6mm;">
								<b>Child 3</b>
								<span style="width:4px;"/>
								<span style="width:60mm;height:3.5mm;border-bottom:1px solid black;">
									<xsl:if test="$QlfyChildMoreThan1PersonGrp &gt;= 3">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[3]/ChildFirstAndLastName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[3]/ChildFirstAndLastName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- (22) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187;height:10mm;padding-top:3.5mm;padding-bottom:5mm;">
							<div class="styIRS8862LNLeftNumBox" style="text-align:center;padding-left:2mm;">22</div>
									<div class="styIRS8862LNDesc" style="width:175mm;height:10mm;">
										Enter the address where you and the child lived together during the year entered on line 1.  If you lived with the child at more than
										one address during the year, attach a list of the addresses where you lived.
									</div>
						</div>
						<span style="width:16mm;height:3mm;float:right;"/>
						<xsl:call-template name="CreateLine22ChildItem">
							<xsl:with-param name="Number">1</xsl:with-param>
							<xsl:with-param name="Position">1</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[1]/LiveWithChildAddrGrp[1]"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine22ChildItem">
							<!--<xsl:with-param name="Letter">b</xsl:with-param>-->
							<xsl:with-param name="Number">2</xsl:with-param>
							<xsl:with-param name="Position">2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[2]/LiveWithChildAddrGrp[2]"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine22ChildItem">
							<!--<xsl:with-param name="Letter">c</xsl:with-param>-->
							<xsl:with-param name="Number">3</xsl:with-param>
							<xsl:with-param name="Position">3</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/QlfyChildMoreThan1PersonGrp[3]/LiveWithChildAddrGrp[3]"/>
						</xsl:call-template>
						<div style="width:187mm;height:2mm;font-size:8.5pt;padding-left:0mm;padding-bottom:3mm;float:none;padding-top:5mm;">
								<i>*If you have more than three qualifying children, attach a statement also answering questions 21-23 for those children.</i></div>
					<div class="styBB" style="width:187mm;padding:10px 0px 0px 0px;" ></div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;padding-top:1mm;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">8862</span> (Rev. 1-2018)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<br/>
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:2mm;">
						<div style="float:left;">
							Form 8862 (Rev. 1-2018)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- (Page 4) ////////////////////////////////////////////////////-->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div class="styPartName" style="width:15mm;padding-top:.5mm;">Part V</div>
						<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
							Qualifying Child of More Than One Person (continued)
						</div>
					</div>
								<span style="width:16mm;height:3mm;float:right;"/>
						<!-- (23) ////////////////////////////////////////////////////-->
						<div class="styIRS8862LineItem" style="width:187mm;height:8mm;">
							<div class="styIRS8862LNLeftNumBox">23</div>
							<div class="styIRS8862CleanDiv" style="width:144mm;height:auto;padding:0px 0px 0px 0px;">
									<div class="styIRS8862LNDesc" style="width:auto;height:100%;">
										Did any other person (except your spouse, if filing jointly, and your dependents claimed on your return) live with Child 1, Child 2, or
										Child 3 for more than half the year?
										<!--Dotted Line-->
										<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>  
									</div>
								</div>
							<div class="styIRS8862LNDesc" style="width:37mm;height:100%;padding-left:0px;padding-top:4mm;float:right;">
								<span style="float:left;width:auto;height:auto;">
									<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/LiveWithOtherPersonInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/LiveWithOtherPersonInd"/>
												<xsl:with-param name="BackupName">IRS8862LiveWithOtherPersonInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form8862Data/LiveWithOtherPersonInd"/>
											<xsl:with-param name="BackupName">IRS8862LiveWithOtherPersonInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">Yes</span>
									</label>
								</span>
								<span style="float:right;width:auto;height:auto;">
									<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$Form8862Data/LiveWithOtherPersonInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$Form8862Data/LiveWithOtherPersonInd"/>
												<xsl:with-param name="BackupName">IRS8862LiveWithOtherPersonInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form8862Data/LiveWithOtherPersonInd"/>
											<xsl:with-param name="BackupName">IRS8862LiveWithOtherPersonInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText">No</span>
									</label>
								</span>
							</div>
						</div>
						<div class="styIRS8862LineItem"  style="width:187mm;height:auto;">
							<div class="styIRS8862LNLeftNumBox"/>
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;padding-bottom:4mm;">
								If &#8220;Yes,&#8221; enter the relationship of each person to the child on the appropiate line below. 
							</div>
						</div>
						<xsl:call-template name="CreateLine23ChildItem">
							<xsl:with-param name="Number">1</xsl:with-param>
							<xsl:with-param name="Position">1</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine23ChildItem">
							<xsl:with-param name="Number">2</xsl:with-param>
							<xsl:with-param name="Position">2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp"/>
						</xsl:call-template>
						<xsl:call-template name="CreateLine23ChildItem">
							<xsl:with-param name="Number">3</xsl:with-param>
							<xsl:with-param name="Position">3</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp"/>
						</xsl:call-template>
						<!-- ////////////////////////////////////////////////////-->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS8862LineItem" style="height:8mm;">
							<div class="styIRS8862LNDesc" style="width:187mm;padding-left:0mm;">
								To determine which person can treat the child as a qualifying child for the dependency exemption, EIC, and CTC/ACTC, see 
								<i>Qualfying Child of More Than One Person</i> in Pub. 501.
							</div>
						</div>
						<div class="styIRS8862LineItem" style="height:6mm;">
							<div class="styIRS8862LNDesc" style="width:181mm;height:auto;height:5mm;padding-left:0mm;">
								<b>Note:</b>  The IRS may ask you to prove additional information to verify your eligibility to claim each credit.
							</div>
						</div>
						<br/>
					</div>
					<!-- Page Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:5mm;border-top-width:1px;">
						<div style="float:right;">
							<span style="width:40px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">8862</span> (Rev. 1-2018)
                        </div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">100</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8862Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
					<!-- Separated Data for Part V -->
					<xsl:if test="count($Form8862Data/QlfyChildMoreThan1PersonGrp/LiveWithChildAddrGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part V Line 22
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Number and street</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">City or town, state, and ZIP code</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/QlfyChildMoreThan1PersonGrp/LiveWithChildAddrGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b>
												<xsl:number value="position()" format="1"/>
											</b>
										</td>
										<!-- (Number and street) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:choose>
													<xsl:when test="USAddress">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="USAddress/AddressLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLiveWithChldFrgnAddr/AddressLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</td>
										<!-- (City or town, state, and ZIP code) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateCityStateInfo">
													<xsl:with-param name="TargetNode" select="USAddress"/>
													<xsl:with-param name="ForeignAddressTargetNode" select="ForeignAddress"/>
												</xsl:call-template>
												<span style="width:7px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignAddress"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part V Line 23 -->
					<xsl:if test="count($Form8862Data/EICEligClmLiveWithChld2AddrGrp/EICEligClmLivedWithChldAddrGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part V - Line 6 23
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Number and street</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">City or town, state, and ZIP code</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/EICEligClmLiveWithChld2AddrGrp/EICEligClmLivedWithChldAddrGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b>
												<xsl:number value="position()" format="1"/>
											</b>
										</td>
										<!-- (Number and street) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:choose>
													<xsl:when test="EICEligClmLivedWithChldUSAddr">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr/AddressLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLivedWithChldUSAddr/AddressLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr/AddressLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLiveWithChldFrgnAddr/AddressLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</td>
										<!-- (City or town, state, and ZIP code) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateCityStateInfo">
													<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr"/>
													<xsl:with-param name="ForeignAddressTargetNode" select="EICEligClmLiveWithChldFrgnAddr"/>
												</xsl:call-template>
												<span style="width:7px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/CountryCd"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part II - Line 6 (c) -->
					<xsl:if test="count($Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmLivedWithChldAddrGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part II - Line 6 (c)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Number and street</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">City or town, state, and ZIP code</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/EICEligClmLiveWithChld3AddrGrp/EICEligClmLivedWithChldAddrGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b>
												<xsl:number value="position()" format="1"/>
											</b>
										</td>
										<!-- (Number and street) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:choose>
													<xsl:when test="EICEligClmLivedWithChldUSAddr">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr/AddressLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLivedWithChldUSAddr/AddressLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr/AddressLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="EICEligClmLiveWithChldFrgnAddr/AddressLine2Txt">
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/AddressLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</td>
										<!-- (City or town, state, and ZIP code) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateCityStateInfo">
													<xsl:with-param name="TargetNode" select="EICEligClmLivedWithChldUSAddr"/>
													<xsl:with-param name="ForeignAddressTargetNode" select="EICEligClmLiveWithChldFrgnAddr"/>
												</xsl:call-template>
												<span style="width:7px;"/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmLiveWithChldFrgnAddr/CountryCd"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part V - Line 23 -->
					<xsl:if test="count($Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part V Line 23
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Name</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Relationship</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/OtherPersonLiveWithChildGrp/OtherPersonInformationGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b>
												<xsl:number value="position()" format="1"/>
											</b>
										</td>
										<!-- (Name) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</div>
										</td>
										<!-- (Relationship) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelationshipDescriptionTxt"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part II - Line 7 (b) -->
					<xsl:if test="count($Form8862Data/EICEligClmLiveWithPrsnChld2Grp/EICEligClmLiveWithOthPersonGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part II - Line 7 (b)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Name</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Relationship</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/EICEligClmLiveWithPrsnChld2Grp/EICEligClmLiveWithOthPersonGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b>
												<xsl:number value="position()" format="1"/>
											</b>
										</td>
										<!-- (Name) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmOtherPersonNm"/>
												</xsl:call-template>
											</div>
										</td>
										<!-- (Relationship) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmOtherPersonRlnDesc"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Separated Data for Part II - Line 7 (c) -->
					<xsl:if test="count($Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmLiveWithOthPersonGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 8862, Part II - Line 7 (c)
						</span>
						<table class="styDepTbl" cellspacing="0">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styIRS8862TableCell" scope="col" style="width:5%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Child</th>
									<th class="styIRS8862TableCell" scope="col" style="width:50%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Name</th>
									<th class="styIRS8862TableCell" scope="col" style="width:45%;border-color:black;font-size:6.5pt;text-align:center;font-family:arial;padding-top:3mm;padding-bottom:3mm;">Relationship</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form8862Data/EICEligClmLiveWithPrsnChld3Grp/EICEligClmLiveWithOthPersonGrp">
									<tr style="font-size:7pt;font-family:arial;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:5%;text-align:center;</xsl:attribute>
											<b>
												<xsl:number value="position()" format="1"/>
											</b>
										</td>
										<!-- (Name) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:50%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmOtherPersonNm"/>
												</xsl:call-template>
											</div>
										</td>
										<!-- (Relationship) +++++++++++++++++++++++ -->
										<td class="styIRS8862TableCell">
											<xsl:attribute name="style">width:45%;text-align:left;border-left-width:1px;</xsl:attribute>
											<div class="styIRS8862LNDesc" style="width:100%;height:auto;word-wrap:break-word;padding-left:2px;font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EICEligClmOtherPersonRlnDesc"/>
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
