<!-- 
    THIS FILE IS NOT COMPLETE!

    This assumes that the following variables are set: $pageTitle and $path-props.
    In my instance, these are both set in the ouvariables.xsl file. It also assumes
    that in your props file there is a parameter with the name section-title. The
    example below should be used as a reference and not straight copy/paste.
-->

<xsl:template name="social-meta">
    <!-- opengraph start -->
    <xsl:if test="$ou:og-image !=''"><meta property="og:image" content="{$ou:og-image}"/></xsl:if>

    <meta property="og:title" content="{ouc:properties/title/text()}"/>

    <meta property="og:url" content="{concat($domain, $ou:path)}"/>

    <meta property="og:description" content="{ouc:properties/meta[@name='Description']/@content}" />

    <meta property="og:site_name" content="{document($path-props)/document/ouc:properties[@label='config']/parameter[@name='section-title']}"/>

    <meta property="og:type" content="website"/>

</xsl:template>