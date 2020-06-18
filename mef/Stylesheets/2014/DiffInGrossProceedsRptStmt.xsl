<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/DiffInGrossProceedsRptStmt"/>
  <xsl:param name="depDocTitle">
    <!--1040 Sch-D Dependency  - Difference In Gross Proceeds Reported Statement  -->
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <xsl:template name="DiffInGrossProceedsRptStmtGrpTemp">  
    <table id="DiffInGrossProceedsRptStmtGrp" class="styDepTbl">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
           <th class="styDepTblCell"  scope="col" style="text-align:center">Full Amount</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Amount Received</th>
           <th class="styDepTblCell"  scope="col" style="text-align:center">Explanation Of Difference</th>
        </tr>
      </thead>
      <tfoot></tfoot>
      <tbody>
       <xsl:for-each select="$DependencyData/DiffInGrossProceedsRptStmtGrp">
        <!-- set row background -->
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
          <td class="styDepTblCell" style="width:50mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="FullAmount" />
              </xsl:call-template>            
            </td>
          <td class="styDepTblCell" style="width:50mm;text-align:right;" >
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="AmountReceived" />
                </xsl:call-template>              
          </td>
          <td class="stydepTblCell" style="width:80mm;text-align:left;">
          	<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="ExplanationOfDifference" />
                </xsl:call-template>
          </td>
        </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <!-- Main template -->
  <xsl:template match="/">
    <!-- New -->
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:value-of select="$depDocTitle"/>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="{$depDocTitle}"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css"/>
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
          <span class="styDepTitle" style="width:187mm;">
            <span>
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
       <xsl:call-template name="PopulateDepCommonLeftover">
        <xsl:with-param name="TargetNode" select="$DependencyData" />
        </xsl:call-template>                
        <xsl:call-template name="DiffInGrossProceedsRptStmtGrpTemp" />    
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
