#!/bin/sh
#
#  SPDX-License-Identifier: Apache-2.0
#
#  Copyright The original authors
#
#  Licensed under the Apache Software License version 2.0, available at http://www.apache.org/licenses/LICENSE-2.0
#

set -eo pipefail

mvn clean verify -f oss-quickstart-simple-template/pom.xml
mvn archetype:create-from-project -f oss-quickstart-simple-template/pom.xml
cp -r oss-quickstart-simple-template/target/generated-sources/archetype/src/main/resources/archetype-resources oss-quickstart-simple-archetype/src/main/resources
rm -rf oss-quickstart-simple-archetype/src/main/resources/archetype-resources/src/main/java/com
rm -rf oss-quickstart-simple-archetype/src/main/resources/archetype-resources/src/test/java/com
rm -rf oss-quickstart-simple-archetype/src/main/resources/archetype-resources/src/main/java/__packageInPathFormat__/

# Adjusting pom.xml

# OS specific support.  $var _must_ be set to either true or false.
# Inspired by mvnw
cygwin=false;
darwin=false;
mingw=false;
case "`uname`" in
  CYGWIN*) cygwin=true ;;
  MINGW*) mingw=true;;
  Darwin*) darwin=true;;
esac

# using gsed on macOS to have flag compatibility with gnu sed on Linux
SED_COMMAND='sed'
if $darwin ; then
    SED_COMMAND='gsed'
fi

# The archetype creation process drops the line-wrap after the license header in the pom.xml; adding this back
# Also replace some other values from the template with generic placeholders
$SED_COMMAND -i 's/--><project/-->\n<project/g' oss-quickstart-simple-archetype/src/main/resources/archetype-resources/pom.xml
$SED_COMMAND -i 's/<name>OSS.*<\/name>/<name>My OSS Project<\/name>/g' oss-quickstart-simple-archetype/src/main/resources/archetype-resources/pom.xml
$SED_COMMAND -i 's/<description>.*<\/description>/<description>My Latest OSS Project<\/description>/g' oss-quickstart-simple-archetype/src/main/resources/archetype-resources/pom.xml
$SED_COMMAND -i 's/^  <url>.*<\/url>/  <url>tbd.<\/url>/g' oss-quickstart-simple-archetype/src/main/resources/archetype-resources/pom.xml

# Adjusting module-info.java

$SED_COMMAND -i 's/module \${package}/module \${moduleName}/g' oss-quickstart-simple-archetype/src/main/resources/archetype-resources/src/main/java/module-info.java
