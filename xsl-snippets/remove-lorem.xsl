<!-- 
    THIS FILE IS NOT COMPLETE!

    The code below can be copied into the template-matches.xsl file
    that should be in your instance. Test this before you put it
    into production.
-->

<!-- removes paragraphs that start with 'Lorem ipsum' -->
<xsl:template match="p[starts-with(., 'Lorem ipsum')]"></xsl:template>