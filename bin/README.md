# My Custom Scripts

## wikitabex
A wikipedia table extractor.

A python script enabling you to extract tables from a wikipedia url.

### Dependencies
- [pandas](https://pandas.pydata.org)
- [Beautiful Soup](https://pypi.org/project/beautifulsoup4/)
- requests

### Usage
```console
# Get Usage
$ wikitabex --help
#
#
# List tables available in the page
$ wikitabex <https://wikipediaurl>
#
#
# Save table specified by the number N to the ouputfilename specified
$ wikitabex <https://wikipediaurl> -c -N <Table Number To extract> -o <output filename.csv>
```

## ctfr
A tool to get all subdomains of a given domain and optionally output it to a csv
file.
