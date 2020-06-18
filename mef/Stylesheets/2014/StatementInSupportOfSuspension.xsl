<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate_ETEC.xsl"/>

<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/StatementInSupportOfSuspension" />
 
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
  </xsl:call-template>  
  </xsl:param>
  
  <xsl:template name="StatementInSupportOfSuspensionTemp">
  
    <table id="GeneralDependencyTbl" class="styDepTbl">
      <tr class="styDepTblHdr">
        <th class="styDepTblCell" style="width:42mm;">VIN</th>
        <th class="styDepTblCell" style="width:120mm">Name</th>
        <th class="styDepTblCell" style="width:25mm;">Date</th>
      </tr>
      <xsl:for-each select="$DependencyData/StatementInSupportOfSuspensionInfo/Item">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>        
          <td class="styDepTblCell" style="text-align:left;font-size:7pt;padding-left:2mm">
             <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="VIN" />
             </xsl:call-template>
          </td>  
          <td class="styDepTblCell" style="text-align:left;font-size:7pt;padding-left:2mm">
             <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine1" />
             </xsl:call-template>
             <br />
             <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Name/BusinessNameLine2" />
             </xsl:call-template>
          </td>
          <td class="styDepTblCell" style="text-align:left;font-size:7pt;padding-left:2mm">
             <xsl:call-template name="PopulateMonthDayYear">
                  <xsl:with-param name="TargetNode" select="Date" />
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
         <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Author" content="Jason Goltermann" />
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
        <xsl:call-template name="DocumentHeaderDependency">
        </xsl:call-template>
          <div class="styDepTitleLine">
            <span class="styDepTitle">
              <span style="width:388px;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>
          <div class="styTopSectionLine" >
             <xsl:call-template name="SetFormLinkInline">
                 <xsl:with-param name="TargetNode" select="$DependencyData"/> 
             </xsl:call-template>
         </div>  
        <xsl:call-template name="PopulateDepCommonLeftover">
                <xsl:with-param name="TargetNode" select="$DependencyData" />
                               <xsl:with-param name="NoGap" select="'true'" />
        </xsl:call-template>
          <xsl:call-template name="StatementInSupportOfSuspensionTemp" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>