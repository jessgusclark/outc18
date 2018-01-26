<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "http://commons.omniupdate.com/dtd/standard.dtd">
<!--
Implementations Skeletor v3 - 5/10/2014

BREADCRUMBS 
Assumes that a section properties files is being used to extract section titles. 
If there aren't any props files, the xsl can be modified to check the page title of the index/default page of each section instead.

Example:
<xsl:call-template name="breadcrumb">
	<xsl:with-param name="path" select="$ou:dirname"/>								
</xsl:call-template>

Requires ouvariables.xsl, vars.xsl, and functions.xsl

Contributors: OmniUpdate, Jesse Clark
Last Updated: Spring 2018

Jesse's Notes:
    The change in this file is addition of structured data
    towards the bottom of the file. At or around line 115.

-->
<xsl:stylesheet version="3.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ou="http://omniupdate.com/XSL/Variables"
	xmlns:fn="http://omniupdate.com/XSL/Functions"
	xmlns:ouc="http://omniupdate.com/XSL/Variables"
	exclude-result-prefixes="ou xsl xs fn ouc">
	
	
	<!-- if a subfolder has been defined in Access Settings -->
	<xsl:variable name="link-start" select="''"/>	
	<xsl:variable name="breadcrumbStart" select="ou:testVariable($ou:breadcrumbStart,'/')"/>
	
	
	<xsl:template name="breadcrumb">
		
		<xsl:param name="path" select="$dirname" /> <!-- defined in the vars xsl as $ou:dirname with a trailing '/' -->
		<xsl:param name="title" select="ou:pcfparam('breadcrumb')" /> <!-- defined in vars as the title of the current page -->	
		
		<!-- If sub domain then add www -->
		<xsl:if test="$ou:site != 'www'">
			<li><a href="http://www.unco.edu">UNC</a></li>
		</xsl:if>
		
		<!-- begin the recursive template for the crumbs (below) -->
		
		<!-- check for valid breadcrumbStart to prevent infinite recursion -->
		<xsl:if test="contains($dirname,$breadcrumbStart)">
			<xsl:call-template name="bc-folders">
				<xsl:with-param name="path" select="$dirname"/>
			</xsl:call-template>	
		</xsl:if>
		
		
		
		<!-- if the file is not the index page, display the final crumb -->
		<xsl:if test="not(contains($ou:filename,concat($index-file,'.')))">
			<li><xsl:value-of select="$title" /></li>
		</xsl:if>
		
		
	</xsl:template>
	
	<xsl:template name="bc-folders">
		
		<xsl:param name="path" />
		<!-- The following variables assume that the section breadcrumbs is in a file called '_props.pcf'. With some config the file may be substitued for breadcrumb.xml, index.pcf etc -->
		<xsl:variable name="this-props-path" select="concat($ou:root, $ou:site, $path, $props-file)"/>
        
        <xsl:variable name="title">	
			<xsl:choose>
				<!-- test if there is a props file before trying to read it -->
				<xsl:when test="doc-available($this-props-path)">
					
                    <xsl:choose>
                    	<xsl:when test="document($this-props-path)/document/ouc:properties[@label='config']/parameter[@name='breadcrumb-title']">
                        	<!-- new versoins of the props file use `breadcrumb-title` -->
                            <xsl:value-of select="document($this-props-path)/document/ouc:properties[@label='config']/parameter[@name='breadcrumb-title']"/>
                        </xsl:when>
                        <xsl:otherwise>
                        	<!-- older versions of props file used `section-title` -->
                            <xsl:value-of select="document($this-props-path)/document/ouc:properties[@label='config']/parameter[@name='section-title']"/>
                        </xsl:otherwise>
                    </xsl:choose>
					
				</xsl:when>
				<xsl:otherwise><xsl:if test="$ou:action!='pub'">System Message: Props File Not Found</xsl:if></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:if test="$path!=$breadcrumbStart">
			<!-- begin recursive function if the current path doesn't match the root or breadcrumbStart directory variable -->
			<xsl:call-template name="bc-folders">
				<xsl:with-param name="path" select="ou:findPrevDir($path)"/>
			</xsl:call-template>
		</xsl:if>
		
		
		<xsl:choose>
        	<!-- If link option is set to No. -->
            <xsl:when test="document($this-props-path)/document/ouc:properties[@label='config']/parameter[@name='link']/option[@selected='true'] = 'No'">
            	  <li class="unavailable"><xsl:value-of select="$title"/></li>
            </xsl:when>
			<!-- if the path matches the current directory, and the current page is an index file, then display without an anchor element -->
			<xsl:when test="$path = $dirname and (contains($ou:filename,'default.') or contains($ou:filename,'index.'))">
				<li><xsl:value-of select="$title"/></li>
			</xsl:when>
			<xsl:otherwise>
            
                <!-- Structured Data List Item -->
                <li property="itemListElement" typeof="ListItem">
                    <a property="item" typeof="WebPage" href="{concat($link-start,$path)}">
                        <span property="name"><xsl:value-of select="$title"/></span>
                        <meta property="position" content="" />
                    </a>
                </li>
                
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	
</xsl:stylesheet>
