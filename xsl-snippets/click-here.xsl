<!-- 
    THIS FILE IS NOT COMPLETE!

    The code below can be copied into the template-matches.xsl file
    that should be in your instance. Test this before you put it
    into production.

    Be very careful implementing this, it could piss some people off.
    There are three different implementations of this code. 
-->

<!-- Simple Approach -->
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


<!-- More Advanced Version -->
<xsl:template match="a[lower-case(node()) = 'click here']">
    <xsl:element name="a">
        <!-- copy all link atributes -->
        <xsl:for-each select="@*">
            <xsl:attribute name="{name()}"><xsl:value-of select="." /></xsl:attribute>
        </xsl:for-each>
        
        <!-- get the correct link text -->
        <xsl:choose>
            <xsl:when test="contains(@href, 'www.unco.edu') and ends-with(@href, '.aspx')">
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


 <!-- A different approach using Foundaions' tooltips -->
<xsl:template match="a[contains(lower-case(node()), 'click here')]">
    <xsl:if test="$ou:action != 'pub'">
        <span data-tooltip="data-tooltip" aria-haspopup="true" class="has-tip code-error" 
            title="The text 'click here' is not accessible for users with disabilities. Please rewrite the link text without using the words 'click here'.">
            <!-- link text -->
            <xsl:value-of select="node()" />
        </span>
    </xsl:if>
</xsl:template>