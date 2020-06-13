class Pedido {
	var property distancia
	var property tiempoMax
	var property cantPasajeros
	const property coloresIncompatibles = #{}
	
	method agregarIncompatible(color){
		coloresIncompatibles.add(color)
	}
	
	method velocidadRequerida(){
		return distancia / tiempoMax
	}
	
	method esColorIncompatible(unAuto){
		return coloresIncompatibles.contains(unAuto.color())
	}
	
	method puedeHacerElViaje(unAuto){
		return (unAuto.velMaxima() - 10) >= self.velocidadRequerida()
			and unAuto.capacidad() >= cantPasajeros
			and not self.esColorIncompatible(unAuto)
	}
	
	method hayColorIncompatible(unColor){
		return coloresIncompatibles.contains(unColor)
	}
	
	method acelerar(){ tiempoMax -= 1 }
	method relajar(){ tiempoMax += 1 }
}