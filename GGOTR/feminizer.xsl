<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- Passes. One for each change. -->
    
    <xsl:template match="/">
        <xsl:variable name="vPass1"> 
            <xsl:apply-templates mode="pass1" select="node()"/>
        </xsl:variable>
        <xsl:variable name="vPass2"> 
            <xsl:apply-templates mode="pass2" select="$vPass1"/>
        </xsl:variable>
        <xsl:variable name="vPass3">
            <xsl:apply-templates mode="pass3" select="$vPass2"/>
        </xsl:variable>
        <xsl:variable name="vPass4">
            <xsl:apply-templates mode="pass4" select="$vPass3"/>
        </xsl:variable>
        <xsl:variable name="vPass5">
            <xsl:apply-templates mode="pass5" select="$vPass4"/>
        </xsl:variable>
        <xsl:variable name="vPass6">
            <xsl:apply-templates mode="pass6" select="$vPass5"/>
        </xsl:variable>
        <xsl:variable name="vPass7">
            <xsl:apply-templates mode="pass7" select="$vPass6"/>
        </xsl:variable>
        <xsl:variable name="vPass8">
            <xsl:apply-templates mode="pass8" select="$vPass7"/>
        </xsl:variable>
        <xsl:variable name="vPass9">
            <xsl:apply-templates mode="pass9" select="$vPass8"/>
        </xsl:variable>
        <xsl:variable name="vPass10">
            <xsl:apply-templates mode="pass10" select="$vPass9"/>
        </xsl:variable>
        <xsl:variable name="vPass11">
            <xsl:apply-templates mode="pass11" select="$vPass10"/>
        </xsl:variable>
        <xsl:variable name="vPass12">
            <xsl:apply-templates mode="pass12" select="$vPass11"/>
        </xsl:variable>
        <xsl:variable name="vPass13">
            <xsl:apply-templates mode="pass13" select="$vPass12"/>
        </xsl:variable>
        <xsl:result-document href="{concat('/Users/kyratriebold/Desktop/ggotr/',xhtml:html/xhtml:body/xhtml:div/xhtml:p[1],'.xhtml')}">
            <xsl:copy-of select="$vPass13"/> 
        </xsl:result-document>
    </xsl:template>
    
    <!-- Keeps HTML from source. Change mode for each pass. -->
    
    <xsl:template match="node()|@*" mode="pass1">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass1"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass2">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass2"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass3">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass3"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass4">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass4"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass5">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass5"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass6">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass6"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass7">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass7"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass8">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass8"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass9">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass9"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass10">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass10"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass11">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass11"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass12">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass12"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="node()|@*" mode="pass13">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" mode="pass13"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- globalReplace template. Only needed once. -->
    
    <xsl:template name="globalReplace">
        <xsl:param name="outputString"/>
        <xsl:param name="target"/>
        <xsl:param name="replacement"/>
        <xsl:choose>
            <xsl:when test="contains($outputString,$target)">
                
                <xsl:value-of select=
                    "concat(substring-before($outputString,$target),
                    $replacement)"/>
                <xsl:call-template name="globalReplace">
                    <xsl:with-param name="outputString" 
                        select="substring-after($outputString,$target)"/>
                    <xsl:with-param name="target" select="$target"/>
                    <xsl:with-param name="replacement" 
                        select="$replacement"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$outputString"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Calls globalReplace template for each change. -->
    
    <xsl:template  match="text()" mode="pass1">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="' he '"/>
            <xsl:with-param name="replacement" select="' she '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass2">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="' his '"/>
            <xsl:with-param name="replacement" select="' her '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass3">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="' him'"/>
            <xsl:with-param name="replacement" select="' her'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass4">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="' Mr. '"/>
            <xsl:with-param name="replacement" select="' Ms. '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass5">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="'He '"/>
            <xsl:with-param name="replacement" select="'She '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass6">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="'father '"/>
            <xsl:with-param name="replacement" select="'mother '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass7">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="' son '"/>
            <xsl:with-param name="replacement" select="' daughter '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass8">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="' man '"/>
            <xsl:with-param name="replacement" select="' woman '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass9">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="' Men '"/>
            <xsl:with-param name="replacement" select="' Women '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass10">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="' king '"/>
            <xsl:with-param name="replacement" select="' queen '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass11">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="' nephew '"/>
            <xsl:with-param name="replacement" select="' niece '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass12">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="' uncle '"/>
            <xsl:with-param name="replacement" select="' aunt '"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template  match="text()" mode="pass13">
        <xsl:call-template name="globalReplace">
            <xsl:with-param name="outputString" select="."/>
            <xsl:with-param name="target" select="'Fellowship'"/>
            <xsl:with-param name="replacement" select="'Girl Gang'"/>
        </xsl:call-template>
    </xsl:template>
      
</xsl:stylesheet>