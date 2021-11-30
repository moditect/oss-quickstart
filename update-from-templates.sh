#!/bin/sh
#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright 2021 - 2021 The original authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -eo pipefail

mvn clean verify -f oss-quickstart-simple-template/pom.xml
mvn archetype:create-from-project -f oss-quickstart-simple-template/pom.xml
cp -r oss-quickstart-simple-template/target/generated-sources/archetype/src/main/resources/archetype-resources oss-quickstart-simple-archetype/src/main/resources
rm -rf oss-quickstart-simple-archetype/src/main/resources/archetype-resources/src/main/java/com
rm -rf oss-quickstart-simple-archetype/src/main/resources/archetype-resources/src/test/java/com
rm -rf oss-quickstart-simple-archetype/src/main/resources/archetype-resources/src/main/java/__packageInPathFormat__/

# Adjusting pom.xml

# The archetype creation process drops the line-wrap after the license header in the pom.xml; adding this back
# using gsed on macOS to have flag compatibility with gnu sed on Linux
gsed -i 's/--><project/-->\n<project/g' oss-quickstart-simple-archetype/src/main/resources/archetype-resources/pom.xml
gsed -i 's/<name>OSS.*<\/name>/<name>My OSS Project<\/name>/g' oss-quickstart-simple-archetype/src/main/resources/archetype-resources/pom.xml
gsed -i 's/<description>.*<\/description>/<description>My Latest OSS Project<\/description>/g' oss-quickstart-simple-archetype/src/main/resources/archetype-resources/pom.xml
gsed -i 's/<url>https.*<\/url>/<url>tbd.<\/url>/g' oss-quickstart-simple-archetype/src/main/resources/archetype-resources/pom.xml

# Adjusting module-info.java

gsed -i 's/module \${package}/module \${moduleName}/g' oss-quickstart-simple-archetype/src/main/resources/archetype-resources/src/main/java/module-info.java
