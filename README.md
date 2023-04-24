# pdfaddtoc

`main.tex` is a LaTeX template designed to enhance a PDF document by adding a navigable table of contents using the `pdfpages` and `hyperref` packages. The template allows users to manually add customizable outlines that link to any page with a desired title by recompiling a pdf file, as well as generates a new table of contents page.

This template can be incredibly useful when you need to read a PDF file on a computer, but the outline is missing. Without an outline, it can be difficult to navigate to a specific chapter or section. By recompiling the PDF file with `main.tex`, users can easily create a navigable table of contents and access specific sections quickly. This can save time and improve the overall reading experience.

## Installation

All you need is a text editor and a latex compile you like.

It is suggested to use the `texlive` [docker image](https://hub.docker.com/r/texlive/texlive).
In my own experience, installing LaTeX may be troublesome, especially if you accidentally miss some packages during installation.
The official docker image includes everything you need and it is easy to install (and uninstall).

## Sample Usages

Below are two examples:

- toy-example: a simple example that helps user know how `main.tex` works.
- merge-lecture-notes: merge lecture notes (pdf slides) into a single file with TOC added.

### Toy Example

See the files under the `examples/toy-example` directory.

In this toy example, we have a `book-no-outline.pdf` that looks like any pdf files you download on the internet.
(Note: This file is compiled from `book.tex`, where outline is not added on purpose. A similar file, `book-outline.pdf`, is the version that is compiled with outline.)

To add a table of contents using `main.tex`, users can manually edit the file by adding the `\includepdf` command. An example usage of the command is shown below: 

```tex
\includepdf[pages={4-6},pagecommand=\thispagestyle{mystyle},addtotoc={
    4,chapter,1,{This is a title},chap:ch1,
    4,section,2,{This is a subtitle},sec:ch1-1
}]{book-no-outline.pdf}
```

The command includes pages 4 to 6 of the `book-no-outline.pdf` file and configures the page with a self-defined page style called `mystyle`. The table of contents is generated using the addtotoc option and includes two entries:
- The first entry links to page 4 and is a chapter with level 1 titled "This is a title". The chapter is labeled with `chap:ch1` in the LaTeX file.
- The second entry links to page 4 and is a section with level 2 titled "This is a subtitle". The section is labeled with `sec:ch1-1` in the LaTeX file.

Finally, `build.sh` is a simple script that compiles `main.tex`. It uses the `xelatex` compiler. Usually users need to compile `main.tex` twice to generate the table of contents, which is automatically done in `build.sh`.

The generated pdf file is default named as `main.pdf` that comes with a pdf outline :)

![](./toy-example/toc-screenshot.png)

For detailed usage of the command, please refer to the [documentation](https://texdoc.org/serve/pdfpages.pdf/0) of `pdfpages` package.

The `build.sh` utilize the `xelatex` in the `texlive` docker image, which can be installed from [dockerhub](https://hub.docker.com/r/texlive/texlive).

### Merge Lecture Notes with TOC

See the files under the `examples/merge-lecture-notes` directory.

Consider a scenario where lecture notes are provided in separate files, chapter by chapter. This may be challenging to search for specific information across multiple files. It would be useful to merge all the files into a single document while maintaining an outline of the chapters. By doing so, you can easily search for relevant content throughout the entire document without having to switch between different files, while preserving the convenience to navigate to a specific chapter.

I believe this happens commonly in college, so I will use a [course](http://www.cs.nthu.edu.tw/~wkhon/random18.html) I've taken to demo.

The `main.tex` merges all lecture notes (lecture1.pdf to lecture24.pdf) and it it does not generate an addition TOC page. Also it preserves most of the page settings of the original lecture notes.


## Thanks

I am inspired by and learnt a lot from this [blog](https://rainnic.altervista.org/en/content/how-add-clickable-toc-pdf-file?language_content_entity=en). 