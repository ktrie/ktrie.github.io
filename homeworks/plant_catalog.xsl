<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Plants Plants Plants</title>
                <link rel="stylesheet" type="text/css" href="https://ktrie.github.io/css/plant_catalog.css"></link>
            </head>
            <body>
                <h1>Plants</h1>
                <table>
                    <thead>
                        <td>Common Name</td>
                        <td>Botanical Name</td>
                        <td>Zone</td>
                        <td>Light</td>
                        <td>Price</td>
                        <td>Availability</td>
                    </thead>
                    <xsl:for-each select="CATALOG/PLANT">
                    <tr>
                        <td><xsl:value-of select="COMMON"/></td>
                        <td><xsl:value-of select="BOTANICAL"/></td>
                        <td><xsl:value-of select="ZONE"/></td>
                        <td><xsl:value-of select="LIGHT"/></td>
                        <td><xsl:value-of select="PRICE"/></td>
                        <td><xsl:value-of select="AVAILABILITY"/></td>
                    </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
      
</xsl:stylesheet>
