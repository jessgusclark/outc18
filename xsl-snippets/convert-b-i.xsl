<!-- 
    THIS FILE IS NOT COMPLETE!

    The code below can be copied into the template-matches.xsl file
    that should be in your instance. Test this before you put it
    into production.
-->

<!-- convert b to strong -->
<xsl:template match="b">
    <strong><xsl:copy-of select="node()" /></strong>
</xsl:template>

<!-- convert i to em -->
<xsl:template match="i">
	<em><xsl:copy-of select="node()" /></em>
</xsl:template>