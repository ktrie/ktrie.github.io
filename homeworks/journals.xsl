<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!--Formatting-->
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space()"/>
    </xsl:template> 
    
    <!--Match root element-->
    <xsl:template match="ul">
        <xsl:result-document href="/Users/kyratriebold/Desktop/Digital Publishing/journals.xml">
            <journals_list>
                <xsl:apply-templates>
                    <xsl:sort select="span" order="ascending"/>
                </xsl:apply-templates>
            </journals_list>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="main/ul">
        <xsl:apply-templates>
            <xsl:sort select="span"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <!--Stuff I don't want-->
    <xsl:template match="head"/>
    <xsl:template match="script"/>
    <xsl:template match="header"/> 
    
    <xsl:template match="main/div[@class='container breadcrumbs-wrapper']"/>
    <xsl:template match="//div[@class='page-header-wrapper']"/>
    <xsl:template match="//div[@class='block']"/>
    <xsl:template match="//div[@class='interior-rail']"/>
    <xsl:template match="//div[@id='tb_external']"/>
    
    <!--Stuff I do want-->
    <xsl:template match="li"> 
        <journal>
            <xsl:apply-templates/>
        </journal> 
    </xsl:template>
    
    <xsl:template match="a">
        <title>
            <xsl:value-of select="normalize-space(text())"/>
        </title>
        <URL>
            <xsl:value-of select="@href"/>
        </URL>
    </xsl:template>
    
    <xsl:template match="span">
        <institution>
            <xsl:value-of select="substring (text(), 4)"/>
        </institution>
    </xsl:template>
    
    <xsl:template match="p[last()]">
        <description>
            <xsl:apply-templates/>
        </description>
    </xsl:template>
    
</xsl:stylesheet>