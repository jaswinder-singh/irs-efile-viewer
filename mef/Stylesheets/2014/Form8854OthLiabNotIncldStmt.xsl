<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" /> 

  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/Form8854OthLiabNotIncldStmt" />

  <xsl:template name="ShowDependencyData">
    <!-- Add stylesheet dependency code here -->
  </xsl:template>

  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
  </xsl:param>

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
      <body class="styBodyClass" >
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:83mm">
            <xsl:value-of select="$depDocTitle" />
          </span>
        </div>

        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
        <xsl:call-template name="ShowDependencyData" />
        <br/>

        <table class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
          <thead class="styTableThead">
            <tr class="styDepTblHdr">
               <th class="styDepTblCell" scope="col" style="width:154mm;">Liability Description</th>
               <th class="styDepTblCell" scope="col" style="width:32mm;">Liability Value Amount</th>         
            </tr>
          </thead>  
          <tfoot></tfoot>
          <tbody>  
          <xsl:for-each select="$DependencyData/Form8854OthLiabNotIncldGrp">
            <tr>
              <xsl:attribute name="class">
              <xsl:choose>
                 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
              </xsl:choose>
              </xsl:attribute>
              <td class="styDepTblCell" valign="top" align="left" style="width:154mm;">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="LiabilityDescription" /></xsl:call-template>   
              </td>
              <td class="styDepTblCell" valign="top" align="right" nowrap="nowrap" style="width:32mm;">
                <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="LiabilityValueAmt" /></xsl:call-template>   
              </td>          
            </tr>
          </xsl:for-each>
          </tbody>    
        </table>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
