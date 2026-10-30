#import "conf/thesis_conf.typ": template_conf, show-numbers
#import "conf/helpers.typ": *

//Part of the template, fill with your data and credentials
#let vars = (
    Title: "Název práce v češtině",
    TitleEN: "Title of the thesis in english",
    Author: "Autor práce",
    StudyPrograme: "Studijní program",
    StudyField: "Studijní obor",
    Department: "Název katedry",
    Supervisor: "Vedoucí práce včetně titulů",
    Year: "Rok odevzdání",
    Date: "Datum odevzdání",
  );

//Calling template function to apply to document, will accept vars as argument
#show: template_conf.with(vars: vars)

//This switches page numbering on
#show-numbers.update(true) 

#include "chapters/Introduction.typ"
#include "chapters/lorem.typ"
#include "chapters/ipsum.typ" 
#include "chapters/conclusion.typ"

#bibliography(
  "bibliography.bib",
  title: "Seznam použité literatury")
#pagebreak()

#outline(
  title: [Seznam obrázků],
  target: figure.where(kind: image)
)
#pagebreak()
#outline(
  title: [Seznam kódu],
  target: figure.where(kind: "code")
)
#pagebreak()