## Credits
## Helveston (2021, March 25). jhelvy.com: Customizing distill with {htmltools} and CSS. Retrieved from https://www.jhelvy.com/posts/2021-03-25-customizing-distill-with-htmltools-and-css/
## https://github.com/jhelvy/jhelvy_distill/tree/master

library(htmltools)
library(distilltools)
library(stringr)
library(dplyr)

create_footer <- function() {
  
  footer <- HTML(paste0(
    '<footer>',
    '© 2024 <a href="https://www.alexjohnquijano.com">Alex John Quijano</a> <a href="https://creativecommons.org/licenses/by/4.0/">CC-BY 4.0</a>\n',
    br(),
    ' Made with ','<a href="https://cran.r-project.org/">R</a>', ' and ',
    '<a href="https://quarto.org/">Quarto,</a> \n',
    br(),
    last_updated(), "\n\n",
    '</footer>',
    '<div class="tocify-extend-page" data-unique="tocify-extend-page" style="height: 0;"></div>',
    
    '<!-- Add function to open links to external links in new tab, from: -->',
    '<!-- https://yihui.name/en/2018/09/target-blank/ -->\n\n',
    '<script src="js/external-link.js"></script>'
  ))
  
  save_raw(footer, "_footer.html")
}

create_header <- function() {
  
  header <- HTML(paste0(last_updated()))
  
  save_raw(header, "_header.html")
}

last_updated <- function() {
  return(span(
    paste0(
      'Last updated on ',
      format(Sys.Date(), format="%B %d, %Y")
    ),
    style = "font-size:0.8rem;")
  )
}

save_raw <- function(text, path) {
  fileConn <- file(path)
  writeLines(text, fileConn)
  close(fileConn)
}
