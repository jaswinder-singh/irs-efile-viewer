<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>   
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
  <xsl:param name="INOLDData" select="$RtnDoc/ItemizedNOLDeductionsSchedule"/>
  <!-- - Common Forms displayed as - Itemized Net Operating Loss deductions schedule -  -->  
  <xsl:template name="ShowINOLD">
    <!-- Any Owned 50% or more of corporations voting stock statement -->
    <table id="INOLDTbl" class="styDepTblLandscape" style="font-size:7pt;">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">           
           <th class="styDepTblCell" scope="col" style="width:56mm;">Corporation Name</th>        
           <th class="styDepTblCell" scope="col" style="width:24mm;">Corporation EIN</th>  
           <th class="styDepTblCell" scope="col" style="width:20mm;">NOL from prior or succeeding year date</th>        
           <th class="styDepTblCell" scope="col" style="width:36mm;">NOL from prior or succeeding year amount</th>  
           <th class="styDepTblCell" scope="col">NOL carryover/ carryback from date</th>  
           <th class="styDepTblCell" scope="col">NOL carryover/carryback amount</th>  
           <th class="styDepTblCell" scope="col">Total NOL deduction</th>        
        </tr>
      </thead>
        <tfoot/>  
       <tbody>    
        <xsl:for-each select="$INOLDData/ItemizedNOLDeduction">  
          <tr>
            <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>              
            <td class="styDepTblCell" style="width:56mm;text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1Txt"/>
              </xsl:call-template>     
              <xsl:if test="CorporationName/BusinessNameLine2Txt != ''">
                <br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2Txt"/>
                </xsl:call-template>
              </xsl:if>
            </td>   
            <td class="styDepTblCell" style="width:24mm;text-align:center;">
              <nobr>
              <xsl:if test="CorporationEIN">
                     <xsl:call-template name="PopulateEIN">
                         <xsl:with-param name="TargetNode" select="CorporationEIN"/>
                     </xsl:call-template>
                </xsl:if>
              <xsl:if test="MissingEINReasonCd">
                     <xsl:call-template name="PopulateText">
                         <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                     </xsl:call-template>
                </xsl:if>
              </nobr>
            </td>   
            <td class="styDepTblCell" style="width:20mm;text-align:center;">            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NOLFromPriorYearDt"/>
              </xsl:call-template>            
            </td>   
            <td class="styDepTblCell" style="width:36mm;text-align:right;">            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="NOLFromPriorYearAmt"/>
              </xsl:call-template>            
            </td>   
            <td class="styDepTblCell" style="text-align:center;width:20mm;">            
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="NOLCarryoverCarrybackFromDt"/>
              </xsl:call-template>            
            </td> 
            <td class="styDepTblCell" style="text-align:right;width:36mm;">            
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="NOLCarryoverCarrybackAmt"/>
              </xsl:call-template>            
            </td>
            <td class="styDepTblCell" style="text-align:right;width:36mm;" nowrap="yes">                      
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="TotalNOLDeductionAmt"/>
              </xsl:call-template>                    
            </td>
          </tr>      
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>          
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$INOLDData"/></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Ravi Venigalla"/>
         <meta name="Description" content="{$depDocTitle}"/>  
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependencyLandscape"/>    
        <div class="styDepTitleLineLandscape ">
          <span class="styDepTitle" style="width:133mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftoverLandscape"><xsl:with-param name="TargetNode" select="$INOLDData"/></xsl:call-template>     
        <xsl:call-template name="ShowINOLD"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>