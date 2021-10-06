#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Configuration file for Docs Repository."""

from datetime import datetime

try:
    import sphinx_rtd_theme
except ImportError:
    sphinx_rtd_theme = None

try:
    from sphinxcontrib import spelling
except ImportError:
    spelling = None

extensions = [
    'hieroglyph',
    'sphinx.ext.ifconfig',
    'sphinx.ext.todo',
    'sphinx-prompt',
]

if spelling is not None:
    extensions.append('sphinxcontrib.spelling')
source_suffix = '.rst'
master_doc = 'index'
project = 'Document Repository'
copyright = '%s, Brian Moss' % datetime.now().year
exclude_patterns = ['_build', 'samples', 'README.rst', 'common/*']
pygments_style = 'sphinx'
if sphinx_rtd_theme:
    html_theme = 'sphinx_rtd_theme'
else:
    html_theme = 'default'
html_logo = '_static/red_square.png'
html_favicon = '_static/red_square.ico'
html_static_path = ['_static']
html_css_files = ['theme_overrides.css']
smartquotes = False
htmlhelp_basename = 'document-repository'
html_permalinks = True
html_permalinks_icon = '#'

# -- Hierogyph options ----------------------------------------------------
slide_theme = 'slides2'
slide_theme_options = {'custom_css': 'myslide.css'}
