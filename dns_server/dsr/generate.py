#!/usr/bin/env python

import os
import sys
import re

import csv

from pprint import pprint

FORMAT_REQ = {
    "Requirement ID": {"type": "id"},
    "Requirement Description": {"name": "text",
                                "type": "latex"},
    "Satisfaction Argument": {"name": "argument",
                              "type": "latex"},
    "Satisfied by": {"name": "satisfied",
                     "type": "tags"},
    }

FORMAT_DOM = {
    "Domain ID": {"type": "id"},
    "Domain Statement Description": {"name": "text",
                                     "type": "latex"},
    }

FORMAT_SPEC = {
    "Spec ID": {"type": "id"},
    "Specification Statement Description": {"name": "text",
                                            "type": "latex"},
    "In the context of": {"name": "context",
                          "type": "tags"},
    }

FORMAT_DATA = {
    "Term": {"type": "id"},
    "Definition": {"name": "definition",
                   "type": "latex"},
    }

def read_input(filename, format):
    fd = open(filename, "rU")
    first_row = True
    column_map = {}
    rv = {}
    for row in csv.reader(fd):
        if first_row:
            # Map columns to the stuff in format and check we have
            # nothing we don't know about.
            for i, item in enumerate(row):
                if item in format:
                    column_map[i] = item
                else:
                    print "error: %s: unknown column `%s'" % (filename, item)
                    sys.exit(1)

            # Make sure we are not missing bits either.
            for required_column in format:
                if required_column not in column_map.values():
                    print "error: %s: missing column `%s'" % (filename,
                                                              required_column)
                    sys.exit(1)

            first_row = False

        else:
            the_id   = None
            the_data = {}
            for col_number, fmt_name in column_map.iteritems():
                fmt = format[fmt_name]
                txt = row[col_number]

                if fmt["type"] == "id":
                    the_id = txt
                elif fmt["type"] == "latex":
                    the_data[fmt["name"]] = txt
                elif fmt["type"] == "tags":
                    the_data[fmt["name"]] = \
                        [t
                         for t in map(lambda x: x.strip(),
                                      txt.split(", "))
                         if len(t) >= 1]


            if the_id in rv:
                print "error: %s: duplicate entry `%s'" % (filename,
                                                           the_id)
                sys.exit(1)

            rv[the_id] = the_data

    fd.close()
    return rv


def mk_link(tag):
    return "\hyperref[%s]{%s}" % (tag, tag)

def link_to_dictionary(s, dictionary):
    rv = s

    for item in dictionary:
        tmp = re.compile(r"\b" + item + r"\b",
                         re.IGNORECASE)
        rv = tmp.sub(r"\hyperref[term:%s]{%s}" % (item.lower(), item),
                     rv)

    return rv

def produce_latex():
    fd = open("dsr.tex", "w")

    requirements  = read_input("requirements.csv",  FORMAT_REQ)
    domain        = read_input("domain.csv",        FORMAT_DOM)
    specification = read_input("specification.csv", FORMAT_SPEC)
    dictionary    = read_input("dictionary.csv",    FORMAT_DATA)

    # Sanity check
    errors = False
    for r_tag in requirements:
        for s_tag in requirements[r_tag]["satisfied"]:
            if s_tag not in specification:
                print "error: %s: unknown spec item %s" % (r_tag, s_tag)
                errors = True
    for s_tag in specification:
        for d_tag in specification[s_tag]["context"]:
            if d_tag not in domain:
                print "error: %s: unknown domain item %s" % (s_tag, d_tag)
                errors = True
    if errors:
        sys.exit(1)

    # We have three mostly identical copies of this because we
    # probably will want to do some individual output, such as linking
    # to other bits for each.

    fd.write("\\section{Requirement Statements}\n")

    for tag in sorted(requirements):
        req = requirements[tag]

        fd.write("\\subsection{%s}\n" % tag)
        fd.write("\\label{%s}\n" % tag)
        fd.write(link_to_dictionary(req["text"],
                                    dictionary) + "\n")
        fd.write("\n")

        fd.write("\\paragraph{Satisfaction argument}\n")
        fd.write(link_to_dictionary(req["argument"],
                                    dictionary) + "\n")

        fd.write("\\paragraph{Satisfied by}\n")
        fd.write("\\begin{itemize}\n")
        for s_tag in req["satisfied"]:
            fd.write("  \\item %s" % mk_link(s_tag))
            if len(specification[s_tag]["context"]) > 0:
                fd.write(" (")
                fd.write(", ".join(map(mk_link,
                                       specification[s_tag]["context"])))
                fd.write(")")
            fd.write("\n")
        fd.write("\\end{itemize}\n")


    # fd.write("\\clearpage\n")
    fd.write("\\section{Domain Statements}\n")

    for tag in sorted(domain):
        dom = domain[tag]

        fd.write("\\subsection{%s}\n" % tag)
        fd.write("\\label{%s}\n" % tag)
        fd.write(link_to_dictionary(dom["text"],
                                    dictionary) + "\n")
        fd.write("\n")


    # fd.write("\\clearpage\n")
    fd.write("\\section{Specification Statements}\n")

    for tag in sorted(specification):
        spec = specification[tag]

        fd.write("\\subsection{%s}\n" % tag)
        fd.write("\\label{%s}\n" % tag)
        fd.write(link_to_dictionary(spec["text"],
                                    dictionary) + "\n")
        fd.write("\n")

        if len(spec["context"]) > 0:
            fd.write("\\paragraph{In the context of}\n")
            fd.write(", ".join(map(mk_link, spec["context"])))

    fd.close()


    fd = open("dictionary.tex", "w")

    fd.write("\\section{Terms}\n")

    for term in sorted(dictionary):
        data = dictionary[term]

        fd.write("\\subsection{%s}\n" % term.capitalize())
        fd.write("\\label{term:%s}\n" % term.lower())
        fd.write(data["definition"] + "\n\n")

    fd.close()

if __name__ == "__main__":
    produce_latex()
