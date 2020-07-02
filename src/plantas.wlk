import parcelas.*

class Plantas {
	var property anioObtencion
	var property altura         // en metros
	
	method horasDeSolQueTolera() = return 7  // Horas genéricas
	method esFuerte() = self.horasDeSolQueTolera() > 9
	method daNuevasSemillas() = self.esFuerte() or self.condicionParticular()
	
	// Métodos abstractos
	method espacioQueOcupa()        //una vez plantada, en metros cuadrados

	method condicionParticular()   // método abstracto para re-definir en cada sub-clase	
	method esIdealPara(unaParcela) // método abstracto para re-definir en cada sub-clase
}

class Menta inherits Plantas{
	
	override method condicionParticular() = self.daNuevasSemillas() and self.espacioQueOcupa() > 1.5
	override method espacioQueOcupa() = altura + 1
	
	override method esIdealPara(unaParcela) = unaParcela.superficie() > 6
}

class Soja inherits Plantas{
	
	override method horasDeSolQueTolera() = if(altura<0.3){6} 
												else if(altura.beetwin(0.3,0.8)){7} 
													else {12}
	override method condicionParticular() = self.anioObtencion()>2007 and altura.beetwin(0.75,0.9)
	override method espacioQueOcupa() = altura * 0.5
	
	override method esIdealPara(unaParcela) = self.horasDeSolQueTolera() == unaParcela.horasDeSolPorDia()
}

class Quinoa inherits Plantas{
	var property espacioQuinoa
	
	override method espacioQueOcupa() = self.espacioQuinoa()
	override method horasDeSolQueTolera() = if(self.espacioQueOcupa()>0.3){10} else {super()}
	override method condicionParticular() = anioObtencion.beetwin(2001,2008)

	override method esIdealPara(unaParcela) = unaParcela.alturaMax() <= 1.5
}

class SojaTrans inherits Soja{
	
	override method daNuevasSemillas() = false
	
	override method esIdealPara(unaParcela) = unaParcela.cantidadMaxima() == 1 
}

class Peperina inherits Menta{
	
	override method espacioQueOcupa() = super()*2
}