<!-- 
    THIS FILE IS NOT COMPLETE!

    The code below can be copied into the template-matches.xsl file
    that should be in your instance. Test this before you put it
    into production.
-->

<!-- Do not allow scripts in editable regions. This is mostly for the Web Content Asset: -->
<xsl:template match="ouc:div/script|ouc:div/*/script">
    <xsl:comment>
        Scripts in the content region have been disabled. 
        Contact Web Communications for help with execuiting JavaScript.
    </xsl:comment>
</xsl:template>