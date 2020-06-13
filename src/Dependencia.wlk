import Rodados.*
import Trafic.*
import pedidos.*
import objetos.*

class Dependencia {
	const property flota = #{}
	var property cantEmpleados
	const property pedidos = #{}
	method agregarAFlota(rodado){ flota.add(rodado) }
	method quitarDeFlota(rodado){ flota.remove(rodado) }
	
	method agregarPedido(viaje){ pedidos.add(viaje) }
	method quitarPedido(viaje){ pedidos.remove(viaje) }
	
	//method agregar_A_(objeto, coleccion){ coleccion.add(objeto) }
	//method quitar_A_(objeto, coleccion){ coleccion.remove(objeto) }
	
	method autoActivo(){
		const esActivo = {a => a.esActivo()}
		return flota.filter(esActivo)
	}
	
	method activar(auto){
		flota.forEach({a => a.esActivo(false)})
		auto.esActivo(true)
	}
	
	method activarTodos(){
		flota.forEach({a => a.esActivo(true)})
	}
	
	method pesoTotalFlota(){
		const pesos = {rodado => rodado.peso()}
		return flota.sum(pesos)
	}
	
	method estaBienEquipada(){
		const velocidadMax = {rodado => rodado.velMaxima() >= 100}
		return 	flota.size() >= 3
				&&
				flota.all(velocidadMax)
	}
	
	method capacidadTotalEnColor(color){
		const esColor = {rodado => rodado.color() == color}
		const capacidades = {rodado => rodado.capacidad()}
		return flota.filter(esColor).sum(capacidades)
	}
	
	method colorDelRodadoMasRapido(){
		const elMasRapido = {rodado => rodado.velMaxima()}
		return flota.max(elMasRapido).color()
	}
	
	method capacidadFaltante(){
		const capacidades = {rodado => rodado.capacidad()}
		return (self.cantEmpleados() - flota.sum(capacidades)).max(0)
	}
	
	method esGrande(){
		return 	self.cantEmpleados() >= 40
				&&
				flota.size() >= 5
	}
	
	method totalDePasajeros(){
		const pasajeros = {viaje => viaje.cantPasajeros()}
		return pedidos.sum(pasajeros)
	}
	
	method satisfaceElPedido(unPedido){
		const loSatisface = {auto => unPedido.puedeHacerElViaje(auto)}
		return flota.any(loSatisface)
	}
	
	method noSonSatisfechos(){
		 const noLosSatisface = {pedido => not self.satisfaceElPedido(pedido)}
		 return pedidos.filter(noLosSatisface)
	}
	
	method esColorIncompatible(unColor){
		const colorIncompatible = {pedido => pedido.hayColorIncompatible(unColor)}
		return pedidos.all(colorIncompatible)
	}
	
	method relajar(){
		const relajarPedidos = {viaje => viaje.relajar()}
		pedidos.forEach(relajarPedidos)
	}
}











