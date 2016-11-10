<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>
  <xsl:param name="repo"/>
  <xsl:param name="branch"/>
  <xsl:param name="user"/>
  <xsl:param name="passwd"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="flow-definition/properties/hudson.model.ParametersDefinitionProperty/parameterDefinitions/hudson.model.StringParameterDefinition/defaultValue[../name = 'Repository']">
    <xsl:element name="defaultValue">
      <xsl:value-of select="$repo"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="flow-definition/properties/hudson.model.ParametersDefinitionProperty/parameterDefinitions/hudson.model.StringParameterDefinition/defaultValue[../name = 'Branch']">
    <xsl:element name="defaultValue">
      <xsl:value-of select="$branch"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="flow-definition/properties/hudson.model.ParametersDefinitionProperty/parameterDefinitions/hudson.model.StringParameterDefinition/defaultValue[../name = 'User']">
    <xsl:element name="defaultValue">
      <xsl:value-of select="$user"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="flow-definition/properties/hudson.model.ParametersDefinitionProperty/parameterDefinitions/hudson.model.StringParameterDefinition/defaultValue[../name = 'Password']">
    <xsl:element name="defaultValue">
      <xsl:value-of select="$passwd"/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
