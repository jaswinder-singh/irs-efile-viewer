<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/OtherLiabilitiesSchedule2" />

  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="OtherLiabilitiesSchedule2Temp">
    <table id="OtherLiabilitiesSchedule2Tbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center">Description</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Beginning of Year Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">End of Year Amount</th>

        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
       <xsl:for-each select="$DependencyData/OtherLiabilities">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <!-- Description -->
          <td class="stydepTblCell" style="text-align:left;">
          	<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Description" />
                </xsl:call-template>
          </td>          
	  <!-- Amount -->
          <td class="stydepTblCell" style="text-align:right;">
          <!--<span style="width:33mm;text-align:right;">-->
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="BOYAmount" />
                </xsl:call-template>
           <!--</span>-->
          </td>
          <td class="stydepTblCell" style="text-align:right;">
          <!--<span style="width:33mm;text-align:right;">-->
            <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="EOYAmount" />
                </xsl:call-template>
           <!--</span>-->
          </td>

        </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>  
  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Author" content="Trin Xue" />
         <meta name="Description" content= "{$depDocTitle}" />
         
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"></xsl:call-template>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">
      <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
    
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:75mm;">
              <xsl:value-of select="$depDocTitle" />
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>                
        <xsl:call-template name="OtherLiabilitiesSchedule2Temp" />    
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

