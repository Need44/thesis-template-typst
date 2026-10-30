//Helper functions for text scaling, syntax borrowed from LaTeX
#let tiny(body) = text(0.5em, body)
#let small(body) = text(0.9em, body)
#let large(body) = text(1.2em, body)
#let Large(body) = text(1.44em, body)
#let LARGE(body) = text(1.73em, body)
#let huge(body) = text(2.07em, body)

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
    [#it #v(0.5em)]
  }

    //Title page of thesis
    show title: set align(center + horizon)
    show title: set text(
      size: 12pt,
      weight: "regular",
    )
    set document(title: [
      #Large[Univerzita Karlova]

      #v(4mm)

      #Large[Pedagogická fakulta]

      #v(4mm)

      #vars.Department

      #v(1fr)

      #Large[*BAKALÁŘSKÁ PRÁCE*]
      #v(1fr)

      #LARGE[*#vars.Title*]

      #v(8mm)

      #LARGE[*#vars.TitleEN*]

      #v(15mm)

      #LARGE[#vars.Author]

      #v(1fr)
      
        $"Vedoucí bakalářské práce:" & #vars.Supervisor \
        "Studijní program:" & #vars.StudyPrograme \ 
        "Studijní obor:" & #vars.StudyField$ 

        #v(1fr)

      Praha #vars.Year
    ])

    //Declaration of originality
    let originality_sign() = {
        pagebreak()
        align(bottom)[
          Odevzdáním této bakalářské práce na téma #vars.Title potvrzuji, že jsem ji vypracoval pod vedením vedoucího práce samostatně za použití v práci uvedených pramenů a literatury. Prohlašuji, že jsem při její tvorbě nepoužil nástrojů umělé inteligence jiným způsobem, než je uvedeno ve vyjádření, které je součástí textu práce. Dále potvrzuji, že tato práce nebyla využita k získání jiného nebo stejného titulu.
          ]
        v(10mm)
        [Praha, #vars.Date #vars.Year #h(0.5fr) Podpis autora #h(1fr)]
        v(20mm)
        pagebreak()
    }

    //Acknowledgements, thanks to others
    let gratitude() = {
      [Poděkování]

      v(20mm)
      pagebreak()
    }

      //Abstract of thesis
    let abstract() = {
        Large[*Abstrakt*]
        parbreak()

        [Text abstraktu v češtině]
        v(4mm)

        Large[*Klíčová slova* \ ]
        parbreak()

        //Doporučeno 3-5 klíčových slov
        [Klíčová, slova, oddělená, čárkou]

        pagebreak()

        Large[*Abstract*]
        parbreak()

        [Abstract in english]
        v(4mm)

        Large[*Keywords*]
        parbreak()

        //3-5 key words recommended
        [Key, words, separated, by, commas]

        pagebreak()
      }

    let tableofcontents() = {     
      outline()
      pagebreak()
    }
      //Start of main text
    let intro() = {
        heading(
          bookmarked: true,
          outlined: true,
          numbering: none,
        )[Úvod]
        

        pagebreak()
      }

    title()
    originality_sign()
    abstract()
    tableofcontents()
    intro()

    doc
  }