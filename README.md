# The amcat book

To view this book, visit https://amcat-book.netlify.app/

To preview the book as a website:

```
git clone https://github.com/ccs-amsterdam/amcat-book.git
quarto preview
```

To render as book (html and pdf):

```
quarto render
```

## Install dependencies

You need [quarto]() and [R]() to render the book.
To handle required R packages, the project uses a virtual environment with [renv](https://github.com/rstudio/renv/).
To automatically install all required R packages use:

```r
install.packages("renv")
```

You should also have 
