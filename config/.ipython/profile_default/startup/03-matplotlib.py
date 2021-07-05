#!/usr/bin/env python
"""Matplotlib startup configuration."""
import warnings
import matplotlib.pyplot as plt

# @markdown This sets the warning status (default is `ignore`,)
warning_status = (
    # @param ["ignore", "always", "module", "once", "default", "error"]
    "ignore"
)

warnings.filterwarnings(warning_status)
with warnings.catch_warnings():
    warnings.filterwarnings(warning_status, category=DeprecationWarning)
    warnings.filterwarnings(warning_status, category=UserWarning)
    warnings.filterwarnings(warning_status, category=FutureWarning)

# %matplotlib notebook

plt.style.use("fivethirtyeight")
