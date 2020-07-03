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
		or self.horasDeSolPorDia() + 2 > unaPlanta.horasDeSolQueTolera()
	){
		self.error("NO_SE_PUEDE_PLANTAR_MAS_NADA")
	}
	else{
		plantas.add(unaPlanta)
	}
	method alturaMax() = plantas.max({plant => plant.altura()})
	
	method seAsociaBien(unaPlanta) // abstracto
	method cantidadAsociadas()
	method porcentajeAsociadas() = self.cantidadAsociadas()/self.cantidadDePlantas()*100
}


class ParcelaEco inherits Parcelas{
	override method cantidadAsociadas() = plantas.count({
		plant => self.seAsociaBien(plant)
	})	
	override method seAsociaBien(unaPlanta) = not self.tieneComplicaciones() and unaPlanta.esIdealPara(self) 
}

class ParcelaIndus inherits Parcelas{
	
	override method seAsociaBien(unaPlanta) = self.cantidadMaxima() >=2 and unaPlanta.esFuerte()
}