import wollok.game.*
import objetos.*

class ChevroletCorsa {
	var property color
	var property position
	const property posiciones = #{}
	var property esActivo = false
	
	method capacidad(){ return 4 }
	method velMaxima(){ return 150 }
	method peso(){ return 1300 }
	method image(){ return self.color().image()}
	
	method moverHaciaArriba(){
		if(self.esActivo()){
			self.position(self.position().up(1))
			self.agregarPosicion()
		}
	}
	
	method moverHaciaAbajo(){
		if(self.esActivo()){
			self.position(self.position().down(1))
			self.agregarPosicion()
		}
	}
	
	method moverHaciaLaDerecha(){
		if(self.esActivo()){	
			self.position(self.position().right(1))
			self.agregarPosicion()
		}
	}
	
	method moverHaciaLaIzquierda(){
		if(self.esActivo()){
			self.position(self.position().left(1))
			self.agregarPosicion()
		}
	}
	
	method chocar(unObjeto){
		unObjeto.esGolpeada()
	}
	
	method agregarPosicion(){
		posiciones.add(self.position())
	}
	
	method pasoPor(posicion){
		return posiciones.contains(posicion)
	}
	
	method pasoPorColumna(numero){
		const esColumna = {pos => pos.x() == numero}
		return posiciones.any(esColumna)
	}
	
	
	method filas(){
		const fila = {pos => pos.y()}
		return posiciones.map(fila).asSet()
	}
	
	method recorrioFilas(listaDeFilas){
		return listaDeFilas.asSet().difference(self.filas()).isEmpty()
	}
}

class RenaultKwid {
	var tieneTanqueAdicional = true
	
	method sacarTanque(){tieneTanqueAdicional = false}
	method ponerTanque(){tieneTanqueAdicional = true}
	
	method capacidad(){
		return if(tieneTanqueAdicional){3} else{4}
	}
	
	method velMaxima(){
		return if(tieneTanqueAdicional){120} else{110}
	}
	
	method peso(){
		return if(tieneTanqueAdicional){1350} else{1200}
	}
	
	method color(){
		return azul
	}
}

class AutoEspecial {
	var property capacidad = 0
	var property velMaxima = 0
	var property peso = 0
	var property color
}