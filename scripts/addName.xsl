<?xml version="1.0"?>
<xsl:stylesheet xmlns:t="http://maven.apache.org/POM/4.0.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="name"/>
  
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="t:project/t:name/text()">
      <xsl:value-of select="$name"/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="/t:project[not(t:name)]">
    <xsl:copy>
      <xsl:element name="name">
        <xsl:value-of select="$name"/>
      </xsl:element>
    <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
