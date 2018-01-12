<!-- 
    THIS FILE IS NOT COMPLETE!

    The code below can be copied into the template-matches.xsl file
    that should be in your instance. Test this before you put it
    into production.

    The template below was from OU Campus and lines 23-25 were added 
    to check for .svg in the path name. You could also use ends-with()
    if you have a legitimate reason .svg should be in the path of a 
    widget file. 
-->

<xsl:template name="includeWidget">
    <!-- directory name + file name -->
    <xsl:param name="fullpath" />
    <!-- on publish, it will output the proper SSI code, but on staging we require the omni div tag -->
    
    <!-- remove domain if it exists from a dependency tag -->
    <xsl:variable name="widgetpath" select="replace($fullpath, $ou:httproot, '/')" />
    
    <xsl:choose>
        <xsl:when test="contains($fullpath, '.svg')">
            <xsl:comment>SVGs can not be loaded like this.</xsl:comment>
        </xsl:when>
        <xsl:when test="$ou:action = 'pub'">
            <xsl:comment>#include virtual="<xsl:value-of select="$widgetpath" />" </xsl:comment>
            <!--<xsl:processing-instruction name="php"> include($_SERVER['DOCUMENT_ROOT'] . "<xsl:value-of select="$fullpath" />"); ?</xsl:processing-instruction>-->
        </xsl:when>
        <xsl:otherwise>
            <xsl:if test="unparsed-text-available(concat($domain, $widgetpath),'utf-8')">
                <xsl:value-of select="unparsed-text(concat($domain, $widgetpath),'utf-8')" disable-output-escaping="yes"/>
            </xsl:if>
            
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>