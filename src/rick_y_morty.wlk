

object rick{
	var property acompaniante=[]
	var property demencia=10;
	
	method irDeAventura(_acompaniante){
		if(_acompaniante.acompaniarARick()<100 && _acompaniante.puedeIrAventura()){
			
		}
		
		else{
			self.convertirEnPepinillo()
		}			
			
	}
    method convertirEnPepinillo(){demencia=demencia/2}
}

class Acompaniante{
	method puedeIrAventura()=true
	method acompaniarARick()
}

object morty inherits Acompaniante{
	var saludMental=2
	override method acompaniarARick(){
		self.puedeIrAventura()
		rick.acompaniante().add(self)
		saludMental-=30
		return rick.demencia()+50
	}
	
	
}

object beth inherits Acompaniante{
	var afecto=2
	override method acompaniarARick(){
		rick.acompaniante().add(self)
		afecto+=10
		return rick.demencia()-20
	}	
	
}

object summer inherits Acompaniante{
	var hoy=new Date()
	var afecto=10
	override method puedeIrAventura(){return hoy==wednesday}
    
	override method acompaniarARick(){
		rick.acompaniante().add(self)
		afecto+=10
		return rick.demencia()-20
	}	
	
}

object jerry inherits Acompaniante{

	override method puedeIrAventura()=false
    
	override method acompaniarARick(){
        rick.acompaniante().add(self)
		return rick.demencia()
	}	
	
}	
	
