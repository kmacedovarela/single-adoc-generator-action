# About the expected adoc file 

The main goal is to avoid code(text) replication when generating a single adoc file, with content gathered from multiple other files (local or remote). 


## How to 

1. Clone your website repo 

```shell
git clone https://github.com/redhat-solution-patterns/solution-pattern-enhancing-applications.git
cd solution-pattern-enhancing-applications/
```

2. Create a new file that should have only the content you want to be included in your single page (single adoc file).

```shell
touch documentation/modules/ROOT/pages/single-page-pre.adoc
```

3. Add this boilerplate code below to your file, as a guidance to get you started:

```adoc
= Solution Pattern: Enhancing Applications with Application Services
:homepage: https://gitlab.com/osspa/portfolio-architecture-examples
:solution-url: https://red.ht/enhance-with-eda
:imagesdir: https://redhat-solution-patterns.github.io/solution-pattern-modernization-cdc/solution-pattern-modernization-cdc/_images/](https://github.com/redhat-solution-patterns/solution-pattern-enhancing-applications/tree/main/documentation/modules/ROOT/assets/images
:toclevels: 1
:icons: font
:source-highlighter: prettify
:toc: left
:sectlinks:

== About this solution pattern
// add the expected text of this section. Example: include::index.adoc[tag=about]

== Targeted use cases and objectives
// add the expected text of this section. Example: include::index.adoc[tag=use-cases]

== Technical challenges
// add the expected text of this section. Example: include::02-architecture.adoc[tag=technical-challenges]

== Modernization boosted by event-driven architecture and enterprise integration patterns
// add the expected text of this section. Example: include::01-pattern.adoc[tag=arch-overview]

== See the solution in action
// add the expected text of this section. Example: include::03-demo.adoc[tag=demo]

== Learn more about this solution pattern
For a complete documentation about how to enhance your services adopting the practices recommended by this solution pattern at: {solution-url}

== Extra knowledge: an in-depth look at the solution
// add the expected text of this section. Example: include::02-architecture.adoc[tag=arch-in-depth]

== Summary
// add the expected text of this section. Example: include::03-demo.adoc[tag=conclusion]
```

4. Locate and create a tag around every content you want to include in your single page. 
Using adoc tags you can select only pieces of your file to include with. The syntax is:
  * on the line before the wanted text, add a comment (yes, a comment): `// tag::tagName[]`
  * on the line after the last wanted text, add another comment: `//end:tagName[]`

See the example: 
```adoc
== Solution Overview
// tag::about[]

This solution pattern brings an architectural solution for scenarios where services integration must happen through data integration and cause no impact to the existing stack.

The architecture demonstrates how *https://www.redhat.com/en/topics/integration/what-is-change-data-capture[Change Data Capture (CDC)]* design pattern and event-driven architectures supports the *extension of existing capabilities with no changes to legacy apps* where new features can be delivered by cloud-native microservices and can deliver with *zero impact new search capabilities* through the integration of legacy and new services with specialized search index services.
// end::about[]
``` 

5. Now the text in between the `// tag:about[]` and `//end:about[]` can be reused wherever you want. In your `single-file-pre.adoc`: 
```
== About this solution pattern
include::index.adoc[tag=about]
```

## Checking everything works

Using any adoc viewer or checking the page in your website are two of the many possible ways you can confirm the content looks like you would like. 

## Next steps

Some external pages will expect your adoc file to be a raw file, meaning, includes won't work. That is where the processor jumps in, and creates a new file with all the included content being part of the automaticaly generated adoc file.
This generated file should then be referenced by external pages. :)

The github action is not yet finished, but the core processor is. 

For more on next steps, please reach out to Karina Varela.

