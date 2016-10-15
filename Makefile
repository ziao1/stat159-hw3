.PHONY: all data tests eda regression report clean

all: eda regression report

data: data/Advertising.csv

Advertising.csv:
	curl "http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv" -o data/Advertising.csv

regression.RData: code/scripts/regression-script.R data/Advertising.csv
	cd code; Rscript regression-script.R

eda: eda-script.R data/Advertising.csv
	cd code; Rscript eda-script.R

tests: code/test-that.R regression-functions.R test-regression.R
	Rscript test-that.R

regression: code/scripts regression-script.R data/Advertising.csv
	Rscript regression-script.R
	
report.pdf: report/report.Rmd regression.RData scatterplot-tv-sales.png
	cd report; Rscript -e "library(rmarkdown); render('report.Rmd')"

clean:
	rm -f report.pdf