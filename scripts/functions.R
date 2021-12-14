element_textbox <- function(...) {
  el <- element_text(...)
  class(el) <- c("element_textbox", class(el))
  el
}

element_grob.element_textbox <- function(element, ...) {
  text_grob <- NextMethod()
  rect_grob <- element_grob(calc_element("strip.background", theme_classic()))
  
  ggplot2:::absoluteGrob(
    grid::gList(
      element_grob(calc_element("strip.background", theme_classic())),
      text_grob
    ),
    height = grid::grobHeight(text_grob), 
    width = grid::unit(1, "npc")
  )
}