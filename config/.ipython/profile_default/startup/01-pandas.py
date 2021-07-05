#!/usr/bin/env python
"""Pandas configuration options."""
import pandas.io.formats.format as pf
import contextlib
import pandas as pd
from IPython.core.interactiveshell import InteractiveShell

InteractiveShell.ast_node_interactivity = "all"
# general options
pd.set_option("display.max_columns", 100)
pd.set_option("display.max_rows", 64)
pd.set_option("precision", 4)
pd.set_option("display.float_format", "{:,.2f}".format)
pd.set_option("mode.use_inf_as_na", True)


def color_negative_red(val):
    """Color Negatives as red.

    Takes a scalar and returns a string with
    the css property `'color: red'` for negative
    strings, black otherwise.
    """
    color = "red" if val < 0 else "black"
    if color == "black":
        color = "green" if val > 0 else "black"
    return "color: %s" % color


# np.random.seed(2015)


class IntArrayFormatter(pf.GenericArrayFormatter):
    """Integer Array Formatter."""

    def _format_strings(self):
        formatter = self.formatter or "{:,d}".format
        fmt_values = [formatter(x) for x in self.values]
        return fmt_values


pf.IntArrayFormatter = IntArrayFormatter


@contextlib.contextmanager
def custom_formatting():
    """Format integers and floats."""
    orig_float_format = pd.options.display.float_format
    orig_int_format = pf.IntArrayFormatter

    pd.options.display.float_format = "{:0,.2f}".format

    class IntArrayFormatter(pf.GenericArrayFormatter):
        def _format_strings(self):
            formatter = self.formatter or "{:,d}".format
            fmt_values = [formatter(x) for x in self.values]
            return fmt_values

    pf.IntArrayFormatter = IntArrayFormatter
    yield
    pd.options.display.float_format = orig_float_format
    pf.IntArrayFormatter = orig_int_format
