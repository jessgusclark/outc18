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
            <xsl:attribute name="{name()}">
                <xsl:value-of select="." />
            </xsl:attribute>
        </xsl:for-each>
        
        <!-- get the correct link text -->
        <xsl:value-of select="@href" />
            
    </xsl:element>
</xsl:template>

