#'Export plot to pptx
#' @param plot: plot to export
#' @param template: file pptx with the design.
#' @param design_name: name of design.
#' @param file: export file name.

pptx_export <- function(plot, template = file.choose(), design_name, file = "test plot.pptx")
{
  mydoc = ReporteRs::pptx(template = template)
  ReporteRs::slide.layouts(mydoc)
  mydoc = ReporteRs::addSlide(mydoc, slide.layout = design_name)
  myplot = plot
  mydoc = ReporteRs::addPlot(mydoc, function() print(myplot), vector.graphic=TRUE)
  ReporteRs::writeDoc(mydoc, file = file)
}