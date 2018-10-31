# Minimal makefile for Sphinx documentation
#

.PHONY: help Makefile cp clean

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = QC101
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make html".
html:
	@$(SPHINXBUILD) -M html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	cp -fr  _build/html ~/Downloads/

help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

cp:
	cp -fr  _build/html ~/Downloads/

clean:
	rm -fr ~/Downloads/html
	rm -fr _build/

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
