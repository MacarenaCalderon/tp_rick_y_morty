class Personaje {

	method irDeAventura()

	method puedeIrDeAventura()

}

class Rick inherits Personaje {

	var property familiares
	var property acompaniante
	var property demencia

	constructor(unosFamiliares, unAcompaniante, unaDemencia) {
		familiares = unosFamiliares
		acompaniante = unAcompaniante
		demencia = unaDemencia
	}
	
	method eligeFamiliar()={acompaniante = familiares.anyOne()}

	override method puedeIrDeAventura() {
		if (acompaniante == null) {
			self.eligeFamiliar()
		}
		return (demencia+acompaniante.modificarDemencia()) < 100

	}

	override method irDeAventura() {
		if (acompaniante.puedeIrDeAventura() && self.puedeIrDeAventura()) {
			acompaniante.acompaniarA(self)
			demencia+=acompaniante.modificarDemencia()
		} else {
			self.convertirseEnPepinillo()
		}
	}

	method convertirseEnPepinillo() {
		demencia = demencia / 2
	}

}

class Familiar inherits Personaje {

	var property modificarDemencia

	constructor(unmodificarDemencia) {
		modificarDemencia = unmodificarDemencia
	}

	method acompaniarA(alguien) {
		alguien.demencia(alguien.demencia()+modificarDemencia)
	}
	


}

class Morty inherits Familiar {

	var property saludMental

	constructor(unaSaludMental) = super(50) {
		saludMental = unaSaludMental
	}

	override method puedeIrDeAventura() = true

	override method irDeAventura() {
		saludMental -= 30
	}

	override method acompaniarA(alguien) {
		if (self.puedeIrDeAventura()) {
			self.irDeAventura()
			alguien.acompaniante(self)
		}
	}

}

class FamiliarMujer inherits Familiar {

	var property afecto

	constructor(unAfecto) = super(-50) {
		afecto = unAfecto
	}

	override method acompaniarA(alguien) {
		if (self.puedeIrDeAventura()) {
			alguien.acompaniante(self)
			self.irDeAventura()
		}
	}

	override method puedeIrDeAventura() = true

	override method irDeAventura() {
		afecto -= 30
	}

}

class Beth inherits FamiliarMujer {

}

class Summer inherits FamiliarMujer {

	var hoy = new Date()

	override method puedeIrDeAventura() {
		return hoy == wednesday
	}

}

object jerry {
	method puedeIrDeAventura()=false
}
