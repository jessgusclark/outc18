<!-- 
    THIS FILE IS NOT COMPLETE!

    The code below can be copied into the template-matches.xsl file
    that should be in your instance. Test this before you put it
    into production.

    Be very careful implementing this, it could piss some people off.
-->



<xsl:template match="a[lower-case(node()) = 'click here']">
    <xsl:element name="a">
        <!-- copy all link atributes -->
        <xsl:for-each select="@*">
            <xsl:attribute name="{name()}"><xsl:value-of select="." /></xsl:attribute>
        </xsl:for-each>
        
        <!-- get the correct link text -->
        <xsl:choose>
            <xsl:when test="contains(@href, 'www.unco.edu')">
                <xsl:variable name="linkPath" 
                    select="concat($ou:root, $ou:site, replace(replace(@href, 'http://www.unco.edu', ''),'.aspx','.pcf'))" />
                <xsl:variable name="linkTitle" 
                    select="document($linkPath)/document/ouc:properties[@label='metadata']/title" />
                <xsl:choose>
                    <xsl:when test="$linkTitle">
                        <xsl:value-of select="$linkTitle"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@href" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="@href" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:element>
</xsl:template>