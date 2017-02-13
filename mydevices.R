to_svg= function(g,file = file.choose(), ancho = 5, alto = 4, dpi = 72){
  Cairo::Cairo(file=file, 
			type="svg",
			units="in", 
			width=ancho, 
			height=alto, 
			pointsize=12*dpi/72, 
			dpi=dpi)
  print(g)
  dev.off()
}


to_emf= function(g,file = file.choose(), ancho = 5, alto = 4, pointsize = 12, custom.lty = T) {
devEMF::emf(file=file, 
			width=ancho, 
			height=alto, 
			pointsize=pointsize,
		  custom.lty = custom.lty,
			family = 'Arial'
		)
print(g)
dev.off()
}
