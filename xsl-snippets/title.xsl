<!-- 
    THIS FILE IS NOT COMPLETE!

    This assumes that the following variables are set: $pageTitle and $path-props.
    In my instance, these are both set in the ouvariables.xsl file. It also assumes
    that in your props file there is a parameter with the name section-title. The
    example below should be used as a reference and not straight copy/paste.
-->

<title>
    <xsl:variable name="pageTitle"
        select="/document/ouc:properties[@label='metadata']/title">
    <xsl:choose>
        <xsl:when test="$pageTitle = ''">
            <xsl:variable name="props-content"
                select="document($path-props)/document/ouc:properties[@label='config']" />

            <!-- create fake title based on filename and section title -->
            <xsl:value-of select="replace(replace($ou:filename, '.aspx', ''), '-', ' ')" /> -
            <xsl:value-of select="$props-content/parameter[@name='section-title']" />

        </xsl:when>
        <xsl:otherwise>
            <!-- pull in the title the content author used -->
            <xsl:value-of select="$pageTitle"/>
        </xsl:otherwise>
    </xsl:choose>
    
</title>
