<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
   <!ENTITY nbsp "&#160;">
]>

<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:ou="http://omniupdate.com/XSL/Variables"
  xmlns:fn="http://omniupdate.com/XSL/Functions"
  xmlns:ouc="http://omniupdate.com/XSL/Variables"
  exclude-result-prefixes="xs ou fn ouc">

  <xsl:template match="p[node() = '&nbsp;'][not(*)]"></xsl:template>

</xsl:stylesheet>

