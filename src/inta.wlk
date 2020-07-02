import parcelas.*
import plantas.*

object inta {
	var property parcelas = []	
	
	method cantidadTotalDePlantas() = parcelas.sum({
		parc => parc.cantidadDePlantas()
	})
	method cantidadDeParcelas() = parcelas.size()
	method promedioDePlantas() = self.cantidadTotalDePlantas() / self.cantidadDeParcelas()
	
	method primeraCondicion() = parcelas.filter({
		parc => parc.cantidadDePlantas()>4
	})
	method parcelaMasSustentable() = self.primeraCondicion().max({
		parc => parc.porcentajeAsociadas()
	})
}