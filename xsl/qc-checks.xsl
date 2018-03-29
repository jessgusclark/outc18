<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet>

<xsl:stylesheet version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ou="http://omniupdate.com/XSL/Variables"
	xmlns:fn="http://omniupdate.com/XSL/Functions"
	xmlns:ouc="http://omniupdate.com/XSL/Variables"
	exclude-result-prefixes="xs ou fn ouc">

	<!-- QC checks! -->
    <xsl:template name="quality-check">
    	<xsl:param name="document" />
        <xsl:if test="$ou:action != 'pub'">
            <xsl:variable name="meta" select="$document/ouc:properties[@label='metadata']/." />
            
            <xsl:choose>
                <xsl:when test="$meta/meta[@name='Description'][@content='']">
                    <div class="alert-box alert qc-check">
                        <div class="row">
                        <p><strong>Quality Control Check:</strong> It looks like the Description field in the 'Title and Metadata' section is missing. This field is important to help search engines find and understand what pages are about. Adding a description not only helps this page but pages that are linked to and from it. Please add a short sentence that describes the page and its purpose. [<a href="http://a.cms.omniupdate.com/10/#oucampus/UNCO/{$ou:site}/pageparameters{replace($ou:path, '.aspx','.pcf')}" target="_parent">Go to the parameters of the page</a>] [<a href="http://www.unco.edu/web-support/resources/ou-campus/quality/standards-web.aspx#pagedescription" target="_blank">Learn more about Meta tags</a>]</p>
                        </div>
                    </div>
                </xsl:when>
                <xsl:when test="string-length($meta/meta[@name='Description']/@content) lt 50">
                    <div class="alert-box warning qc-check">
                        <div class="row">
                            <p><strong>Quality Control Check:</strong> Thank you for adding a Description in the 'Title and Metadata' section. However, the description is only <strong><xsl:value-of select="string-length($meta/meta[@name='Description']/@content)" /> characters</strong>, which is short of the 50 character recommendation. Please expand your meta description a few more words that describe what this page is about. [<a href="http://a.cms.omniupdate.com/10/#oucampus/UNCO/{$ou:site}/pageparameters{replace($ou:path, '.aspx','.pcf')}" target="_parent">Go to the parameters of the page</a>] [<a href="http://www.unco.edu/web-support/resources/ou-campus/quality/standards-web.aspx#pagedescription" target="_blank">Learn more about Meta tags</a>]</p>
                        </div>
                    </div>
                </xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
	
</xsl:stylesheet>
