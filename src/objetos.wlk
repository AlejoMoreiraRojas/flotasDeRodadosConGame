import wollok.game.*

class Pared {
	var property position
	var property image = "pared.png"
	var property resistencia = 20
	
	method esGolpeada(){
		if(resistencia > 0){
			resistencia -= 5
		}
		else{
			game.removeVisual(self)
		}
	}
	
	method informarResistencia(){
		return "Resistencia: " + resistencia
	}
}


//COLORES
object rojo { method image(){ return "autitoRojo.png" } }

object verde { method image(){ return "autitoverde.png" } }

object azul { method image(){ return "autitoAzul.png" } }

object negro {}

object beige {}

object celeste {}

object amarillo {}