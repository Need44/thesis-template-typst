#import "title.typ": template_title 
#import "declaration_of_originality.typ": originality_sign
#import "acknowledgements.typ": gratitude
#import "abstract.typ": abstract
#import "ai.typ": ai
#import "helpers.typ": *

#let show-numbers = state("show-numbers", false)

//Template function, sets all the setting for the document
#let template_conf(
  vars: (
    Title: "Název práce v češtině",
    TitleEN: "Title of the thesis in english",
    Author: "Autor práce",
    StudyPrograme: "Studijní program",
    StudyField: "Studijní obor",
    Department: "Název katedry",
    Supervisor: "Vedoucí práce včetně titulů",
    Year: "Rok odevzdání",
    Date: "Datum odevzdání",
  ),
  doc,
  ) = {

    set page(
      paper: "a4",
      margin: (
        top:25mm,
        bottom:30mm,
        left:30mm,
        right:25mm,
      ),
      numbering: "1",
      number-align: center,
      footer: context {
        if show-numbers
        .at(here()){
          align(center, counter(page).display("1"))
        } else {
          none
        }
      },
    )
    set text(
      font: "New Computer Modern",
      size: 12pt,
      weight: "regular",
      region: "CZ",
      lang: "cs",
    )
    set par(
      justify: true,
      leading: 1.5em,
      spacing: 5mm,

    )
    set heading(
      numbering: "1.1.1"
    )

    //This adds more spacing after heading, this is used for cleaner look of the text
    //Found at https://forum.typst.app/t/how-to-add-spacing-around-headings-but-not-between-headings/5967
    show heading: it => {
    // Clever trick to reduce spacing between consecutive headings
    // See https://github.com/typst/typst/issues/2953
    let previous_headings = query(selector(heading).before(here(), inclusive: false))
    if previous_headings.len() > 0 {
      let prev_loc = previous_headings.last().location().position()
      let it_loc = it.location().position()
      if (it_loc.page == prev_loc.page and it_loc.x == prev_loc.x and it_loc.y - prev_loc.y < 60pt) { // threshold
        v(-1.5em) // amount to reduce spacing, could make this dependent on it.level
      }
      else {}
    }
    [#v(1em) #it #v(0.5em)]
  }

  let tableofcontents() = {     
  outline()
  pagebreak()
  }
    
  template_title(vars)
  originality_sign(vars)
  gratitude(vars)
  abstract(vars)
  tableofcontents()
  doc
  ai()

}


