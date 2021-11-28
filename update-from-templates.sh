#!/bin/sh
set -eo pipefail

mvn clean verify -f oss-quickstart-template-simple/pom.xml
mvn archetype:create-from-project -f oss-quickstart-template-simple/pom.xml
cp -r oss-quickstart-template-simple/target/generated-sources/archetype/src oss-quickstart-archetype-simple

# The archetype creation process drops the line-wrap after the license header in the pom.xml; adding this back
# using gsed on macOS to have flag compatibility with gnu sed on Linux
gsed -i 's/--><project/-->\n<project/g' oss-quickstart-archetype-simple/src/main/resources/archetype-resources/pom.xml
gsed -i 's/<name>OSS.*<\/name>/<name>My OSS Project<\/name>/g' oss-quickstart-archetype-simple/src/main/resources/archetype-resources/pom.xml
gsed -i 's/<description>.*<\/description>/<description>My Latest OSS Project<\/description>/g' oss-quickstart-archetype-simple/src/main/resources/archetype-resources/pom.xml
gsed -i 's/<url>https.*<\/url>/<url>tbd.<\/url>/g' oss-quickstart-archetype-simple/src/main/resources/archetype-resources/pom.xml
