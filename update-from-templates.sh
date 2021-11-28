#!/bin/sh
set -eo pipefail

mvn clean verify -f oss-quickstart-template-simple/pom.xml
mvn archetype:create-from-project -f oss-quickstart-template-simple/pom.xml
cp -r oss-quickstart-template-simple/target/generated-sources/archetype/src oss-quickstart-archetype-simple
