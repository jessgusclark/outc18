<!-- 
    THIS FILE IS NOT COMPLETE!

    The code below can be copied into the template-matches.xsl file
    that should be in your instance. Test this before you put it
    into production.
-->

<!-- remove underline -->
<xsl:template match="span[@style='text-decoration: underline;']" >
    <xsl:copy-of select="node()" />
</xsl:template>

