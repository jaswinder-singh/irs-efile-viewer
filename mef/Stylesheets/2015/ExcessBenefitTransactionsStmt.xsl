<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>    
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="Form990Deps3Data" select="$RtnDoc/ExcessBenefitTransactionsStmt" />
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$Form990Deps3Data" /></xsl:call-template>  
  </xsl:param>  
  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
         <title>
           <!--Excess Benefit Transactions Statement-->
          <xsl:value-of select="$depDocTitle" />  
        </title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Author" content="Jessica Lee - jesslee@us.ibm.com" />
         <!--meta name="Description" content="Excess Benefit Transactions Statement" /-->
         <meta name="Description" content="{$depDocTitle}" />  
        
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
          <div class="styDepTitle" style="width:115mm">
            <xsl:value-of select="$depDocTitle"/>
            <!--TY 2003 Excess Benefit Transactions Statement-->
          </div>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$Form990Deps3Data"/></xsl:call-template>                  
              
        <div class="styTopSectionLine">
          <div class="styTopSectionLineLbl" style="float:left">
            <b>Statement: </b>
          </div>
          <div style="float:left" class="styExplanationLine">  
            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990Deps3Data/Statement" /></xsl:call-template>      
          </div>                  
        </div>  
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







