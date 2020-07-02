import plantas.*

class Parcelas {
	var property ancho
	var property largo
	var property horasDeSolPorDia	
	var property plantas = []
	
	method superficie() = ancho * largo
	method cantidadMaxima() = if(largo>3){largo+4} else{self.superficie()/2} // (de plantas)
	method tieneComplicaciones() = plantas.any({
		plant => plant.horasDeSolQueTolera()<horasDeSolPorDia	
	})
	method cantidadDePlantas() = plantas.size()
	method plantar(unaPlanta) = 
	if ( self.cantidadDePlantas() >= self.cantidadMaxima() 
		or self.horasDeSolPorDia() + 2 > unaPlanta.horasDeSolQueTolera() //corroborar en test
	){
		self.error("NO_SE_PUEDE_PLANTAR_MAS_NADA")
	}
	else{
		plantas.add(unaPlanta)
	}
	method alturaMax() = plantas.max({plant => plant.altura()})
	
}


class ParcelaEco inherits Parcelas{
	
	method seAsociaBien(unaPlanta) = not self.tieneComplicaciones() and unaPlanta.esIdealPara(self)
//	method porcentajeAsociadas() 
}

class ParcelaIndus inherits Parcelas{
	
	method seAsociaBien(unaPlanta) = self.cantidadMaxima() >=2 and unaPlanta.esFuerte()
//	method porcentajeAsociadas()	
}