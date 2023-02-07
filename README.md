# The amcat book

To view this book, visit https://amcat.nl/book/.

To preview the book as a website:

```bash
git clone https://github.com/ccs-amsterdam/amcat-book.git
quarto preview
```

To render as book (html and pdf):

```bash
quarto render
```

This needs a working amcat instance though.
You can use the included [makefile](makefile) to spin one up and render the book:

```bash
make all
```

## Install dependencies

You need [quarto]() and [R]() to render the book.
To handle required packages, the project uses a virtual environment (for both R and Python) with [renv](https://github.com/rstudio/renv/).
To automatically install all required R packages use:

```r
install.packages("renv")
```
