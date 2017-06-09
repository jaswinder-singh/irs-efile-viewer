<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

  <xsl:param name="DependencyData" select="$RtnDoc/ReductionInTaxesSchedule"/>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="ReductionInTaxesScheduleTemp">
    <table id="ReductionInTaxesScheduleTbl" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">

           <th class="styDepTblCell" scope="col" style="width:152mm;">Description</th>
           <th class="styDepTblCell" scope="col" style="width:35mm;">Amount</th>
        </tr>
      </thead>
      <xsl:for-each select="$DependencyData/ReductionInTaxes">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>

          <td class="styDepTblCell" style="text-align:left;width:152mm;">
            <xsl:call-template name="PopulateText">          
                 <xsl:with-param name="TargetNode" select="Desc"/>
            </xsl:call-template>
          </td>      
          <td class="styDepTblCell" style="text-align:right;width:35mm;">
            <xsl:call-template name="PopulateAmount">          
                 <xsl:with-param name="TargetNode" select="Amt"/>
            </xsl:call-template>
          </td>          
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>


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
         <meta name="Author" content="Venkata Boggavarapu:: boggav@us.ibm.com"/>
         <meta name="Desc" content="{$depDocTitle}"/>
         
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
  
        <xsl:call-template name="DocumentHeaderDependency"/>  
    
        <div class="styDepTitleLine">
          <span class="styDepTitle">
            <span style="width:85mm;">
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>        
        
        <xsl:call-template name="ReductionInTaxesScheduleTemp"/>
      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>