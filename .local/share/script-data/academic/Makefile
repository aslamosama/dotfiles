PDF=output.pdf
MD=*.md
METADATA=metadata.yaml
PANDOC_ENGINE=xelatex
FILTERS=--filter pandoc-crossref --citeproc
HIGHLIGHT=tango

all: $(PDF)

$(PDF): $(wildcard $(MD)) $(METADATA)
	pandoc $(wildcard $(MD)) -o $(PDF) --pdf-engine=$(PANDOC_ENGINE) $(FILTERS) --highlight-style=$(HIGHLIGHT) --metadata-file=$(METADATA)

clean:
	rm -f $(PDF)
