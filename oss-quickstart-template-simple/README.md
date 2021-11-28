# My OSS Project

An open-source project bootstrapped using the [ModiTect OSS Quickstart](https://github.com/moditect/oss-quickstart) archetype.

## Build

Run the following command to build this project:

```
mvn clean verify
```

Pass the `-Dquick` option to skip all non-essential plug-ins and create the output artifact as quickly as possible:

```
mvn clean verify -Dquick
```

Run the following command to format the source code and organize the imports as per the project's conventions:

```
mvn process-sources
```

## License

This code base is available under the Apache License, version 2.
