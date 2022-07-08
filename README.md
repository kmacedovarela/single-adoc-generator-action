# Asciidoc single file generator github action 

This action can process an adoc file with multiple includes of partials, tags, etc., and generate a new, raw (adoc), single file with existing content plus all the content from other 
included references. 

## Inputs

## `file-to-process`

**Required** The full path to the file that should be processed. Example: `path/to/my/file/tobeprocessed.adoc`

## `generated-file-path`

Path in the current repository where the generated file should be stored.

## Outputs

## `generated-file`

The generated file with raw adoc included content.  

## Example usage

uses: actions/single-adoc-generator-action@v1
with:
  file-to-process: 'path/to/my/file/tobeprocessed.adoc'
  generated-file-path: '/path/to/store/generated/file'
