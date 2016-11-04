#!/bin/bash
set -x

cat <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<project xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd" xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <modelVersion>4.0.0</modelVersion>
  <groupId>$PROJECT</groupId>
  <artifactId>$REPO</artifactId>
  <version>${BRANCH}-SNAPSHOT</version>
  <name>${PREF}-${NAME}-SNAPSHOT</name>
  <packaging>${NAME%.*}</packaging>
  <description>Artifactory auto generated POM</description>
</project>
EOF
