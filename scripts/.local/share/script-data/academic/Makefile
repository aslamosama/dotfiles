PDF=output.pdf
MD=$(wildcard *.md)
METADATA=metadata.yaml
PANDOC_ENGINE=pdflatex
FILTERS=--filter pandoc-crossref --citeproc
HIGHLIGHT=kate

all: $(PDF)

$(PDF): $(MD) $(METADATA)
	pandoc $(MD) -o $(PDF) --pdf-engine=$(PANDOC_ENGINE) $(FILTERS) --highlight-style=$(HIGHLIGHT) --metadata-file=$(METADATA)

clean:
	rm -f $(PDF) *.aux *.log *.out
