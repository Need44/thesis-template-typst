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
      justify: true
    )

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
        \
        "Studijní program:" & #vars.StudyPrograme \ 
        \
        "Studijní obor:" & #vars.StudyField$ 

        #v(1fr)
      //]

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

      //Acknowledgements, thanks to others
      let gratitude() = {

      }

      //Abstract of thesis
      let abstract() = {

      }

      //Start of main text
      let intro() = {

      }
    }

    title()
    originality_sign()

  }