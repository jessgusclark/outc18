<!-- 
    THIS FILE IS NOT COMPLETE!

    The code below can be copied into the template-matches.xsl file
    that should be in your instance. Test this before you put it
    into production.
-->

<!-- remove index.aspx -->
<xsl:template match="a[ends-with(@href, 'index.aspx')]">
    <xsl:element name="a">
        <!-- loop through link atributes -->
        <xsl:for-each select="@*">
            <xsl:attribute name="{name()}">
                <xsl:choose>
                    <xsl:when test="name() = 'href'">
                        <xsl:value-of select="replace(., 'index.aspx', '')" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="." />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
        </xsl:for-each>
        
        <!-- display link text -->
        <xsl:copy-of select="node()" />
    </xsl:element>
</xsl:template>