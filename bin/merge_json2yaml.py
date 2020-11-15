#!/usr/bin/env python
"""Merge json files to yaml."""
import json
from yaml import dump
from argparse import ArgumentParser

try:
    from yaml import CDumper as Dumper
except ImportError:
    from yaml import Dumper


def main():
    parser = ArgumentParser()
    parser.add_argument(
        "--infile",
        action="store",
        help="json file to merge.",
    )
    parser.add_argument(
        "-o",
        "--outfile",
        action="store",
        dest="outfile",
        help="outputfile to save yaml.",
    )
    args = parser.parse_args()
    if args.infile:
        with open(args.infile, "r") as inf:
            data = json.load(inf)
    if args.outfile:
        with open(args.outfile, "a") as wf:
            dump(data, wf, Dumper=Dumper)
    return


if __name__ == "__main__":
    main()
