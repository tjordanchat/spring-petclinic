<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="name"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="com.cloudbees.hudson.plugins.folder.Folder/displayName/text()">
      <xsl:value-of select="$name"/>
    	<xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>
