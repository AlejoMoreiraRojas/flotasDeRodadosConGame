object trafic {
	var interior
	var motor
	
	method configurar(unInterior, unMotor){
		interior = unInterior
		motor = unMotor
	}
	
	method capacidad(){
		return interior.capacidad()
	}
	
	method velMaxima(){
		return motor.velMaxima()
	}
	
	method peso(){
		return motor.peso() + interior.peso() + 4000
	}
	
	method color(){
		return "blanco"
	}
}


object interiorComodo {
	
	method capacidad(){
		return 5
	}
	
	method peso(){
		return 700
	}
}

object interiorPopular {

	method capacidad(){
		return 12
	}
	
	method peso(){
		return 1000
	}
}

object motorPulenta {
	
	method velMaxima(){
		return 130
	}
	
	method peso(){
		return 800
	}
}

object motorBataton {
	
	method velMaxima(){
		return 80
	}
	
	method peso(){
		return 500
	}
}