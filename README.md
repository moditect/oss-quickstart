# OSS Quickstart

Apache Maven archetypes for bootstrapping new open-source projects.

Think [Maven Quickstart Archetype](https://maven.apache.org/archetypes/maven-archetype-quickstart/) and friends, but more modern, complete, and opinionated.

_Latest version: 1.0.0.Alpha1_

## Features

The archetypes aim add providing commonly used functionality, while defining sensible defaults, following modern conventions and best practices:

* Up-to-date (and fixed) dependency and plug-in versions
* Provide a license
* Basic set-up for CI
* House-keeping and quality assurance plug-ins, e.g. for formatting and license header checking
* (Optionally) provide a _module-info.java_ descriptor

## Usage

Run the following command to create a new project based on the _oss-quickstart-simple-archetype_ archetype:

```shell
mvn archetype:generate \
  -DarchetypeGroupId=org.moditect.ossquickstart \
  -DarchetypeArtifactId=oss-quickstart-simple-archetype \
  -DarchetypeVersion=1.0.0.Alpha1
```

Then provide values for the parameters prompted for, such as group and artifact id of the project to be generated.

Alternatively, use the non-interactive ("batch") mode and provide all the values like so:

```shell
mvn archetype:generate -B \
  -DarchetypeGroupId=org.moditect.ossquickstart \
  -DarchetypeArtifactId=oss-quickstart-simple-archetype \
  -DarchetypeVersion=1.0.0.Alpha1 \
  -DgroupId=com.example.demos \
  -DartifactId=fancy-project \
  -Dversion=1.0.0-SNAPSHOT \
  -DmoduleName=com.example.fancy
```

Use the special value `NONE` for `moduleName` if you don't want generate a _module-info.java_ file.

## Components

* _oss-quickstart-simple-archetype_: A Maven archetype for creating a single module project following best practices
* _oss-quickstart-simple-template_: A template for the single module archetype

## Building this Project

Run the following command to install the archetypes defined by this project into your local Maven repostory:

```shell
mvn clean install
```

## Updating the Archetypes

Do the required changes to the template projects (currently _oss-quickstart-simple-template_ only),
then update the archetype by running this command:

```shell
./update-from-templates.sh
```

Examine the changes to the archetype module and commit the changes.

## License

This code base is available under the Apache License, version 2.
