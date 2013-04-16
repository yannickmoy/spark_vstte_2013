#!/usr/bin/env python

import os
import sys

import csv

from pprint import pprint

FORMAT_REQ = {
    "Requirement ID": {"type": "id"},
    "Requirement Description": {"name": "text",
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
                    the_data[fmt["name"]] = map(lambda x: x.strip(),
                                                txt.split(", "))

            if the_id in rv:
                print "error: %s: duplicate entry `%s'" % (filename,
                                                           the_id)
                sys.exit(1)

            rv[the_id] = the_data

    fd.close()
    return rv

def mk_link(tag):
    return "\hyperref[%s]{%s}" % (tag, tag)

def produce_latex():
    fd = open("dsr.tex", "w")

    requirements  = read_input("requirements.csv",  FORMAT_REQ)
    domain        = read_input("domain.csv",        FORMAT_DOM)
    specification = read_input("specification.csv", FORMAT_SPEC)

    # We have three mostly identical copies of this because we
    # probably will want to do some individual output, such as linking
    # to other bits for each.

    fd.write("\\section{Requirement Statements}\n")

    for tag in sorted(requirements):
        req = requirements[tag]

        fd.write("\\subsection{%s}\n" % tag)
        fd.write("\\label{%s}\n" % tag)
        fd.write(req["text"] + "\n")
        fd.write("\n")

        fd.write("\\paragraph{Is satisfied by}\n")
        fd.write(", ".join(map(mk_link, req["satisfied"])))


    # fd.write("\\clearpage\n")
    fd.write("\\section{Domain Statements}\n")

    for tag in sorted(domain):
        dom = domain[tag]

        fd.write("\\subsection{%s}\n" % tag)
        fd.write("\\label{%s}\n" % tag)
        fd.write(dom["text"] + "\n")
        fd.write("\n")


    # fd.write("\\clearpage\n")
    fd.write("\\section{Specification Statements}\n")

    for tag in sorted(specification):
        spec = specification[tag]

        fd.write("\\subsection{%s}\n" % tag)
        fd.write("\\label{%s}\n" % tag)
        fd.write(spec["text"] + "\n")
        fd.write("\n")

        fd.write("\\paragraph{In the context of}\n")
        fd.write(", ".join(map(mk_link, spec["context"])))


    fd.write("\\section{Requirement Satisfaction}\n")

    fd.write("\\begin{longtable}{p{2.25cm} >{\\raggedright\\arraybackslash}p{8.5cm}}\n")
    fd.write("\\hline\n")

    fd.write(r"Requirement & Satisfied by\\" + "\n")
    fd.write("\\hline\n")

    for r_tag in sorted(requirements):
        fd.write(r"%s &" % r_tag)
        spec_tmp = []
        for s_tag in sorted(requirements[r_tag]["satisfied"]):
            dom_tmp = []
            for d_tag in sorted(specification[s_tag]["context"]):
                dom_tmp.append("%s" % mk_link(d_tag))
            if len(dom_tmp) > 0:
                spec_tmp.append("%s (%s)" % (mk_link(s_tag),
                                             ", ".join(dom_tmp)))
            else:
                spec_tmp.append("%s" % (mk_link(s_tag)))
        fd.write(r"%s \\" % ", ".join(spec_tmp))
        fd.write("\n")

    fd.write("\\hline\n")
    fd.write("\\end{longtable}\n")

    fd.close()

if __name__ == "__main__":
    produce_latex()
