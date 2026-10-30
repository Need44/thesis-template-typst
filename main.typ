#import "conf/thesis_conf.typ": template_conf, show-numbers
#import "conf/helpers.typ": *

//Part of the template, fill with your data and credentials
#let vars = (
    Title: "",
    TitleEN: "",
    Author: "",
    StudyPrograme: "",
    StudyField: "",
    Department: "",
    Supervisor: "",
    Year: "",
    Date: "",
  );

//Testing variable
#let vars2 = (
    Title: "Umistovani prvku na strance",
    TitleEN: "Arranging elements on the page",
    Author: "Jan Novak",
    StudyPrograme: "Informatika v zurnalistice",
    StudyField: "Webove stranky a jejich sprava",
    Department: "Katedra internetove zurnalistiky",
    Supervisor: "PhDr. Carodej Dobrodej, LLM",
    Year: "2026",
    Date: "30. rijna",
  );

//Calling template function to apply to document, will accept vars as argument
#show: template_conf.with()

//This switches page numbering on
#show-numbers.update(true) 

#include "chapters/Introduction.typ"
#include "chapters/ipsum.typ" 
#include "chapters/lorem.typ"
#include "chapters/conclusion.typ"
