all: \
	example.pdf

%.pdf: %.tex
	pdflatex -halt-on-error $^

%.png: %.dot
	dot -Tpng $^ > $@

again:
	touch *.tex
	make

watch:
	( find . -name '*.tex' -type f ; find . -name '*.tex' -type f ; find . -name '*.bib' -type f) \
		| entr -pc make again

clean:
	rm *.pdf || true
	rm *.dvi || true
	rm *.log || true
	rm *.aux || true
	rm *.toc || true
	rm *.out || true
	rm *.nav || true
	rm *.snm || true
	rm *.vrb || true
	rm *.synctex.gz || true

example.pdf: example.png
