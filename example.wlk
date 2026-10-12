class Hogar{
  var nivelMugre = 0
  var confort = 0
  method nivelMugre() = nivelMugre
  method confort() = confort
  method esBueno() = confort /2 >= nivelMugre
  method recibirAtaque(plaga){nivelMugre = nivelMugre + plaga.nivelDanio()}
}
class Huerta{
  var capacidadProduccion = 0
  var nivel = 1
  method capacidadProduccion() = capacidadProduccion
  method nivel() = nivel
  method esBueno() = capacidadProduccion > nivel  
  method recibirAtaque(plaga){
    if (plaga.transmiteEnfermedades())
      capacidadProduccion = capacidadProduccion - plaga.nivelDanio() * 0.10 - 10
    else capacidadProduccion = capacidadProduccion - plaga.nivelDanio()
    }
}
class Mascota{
  var nivelSalud = 0
  //esSaludable
  method nivelSalud() = nivelSalud
  method esBueno() = nivelSalud > 250
  method recibirAtaque(plaga){ 
    if (plaga.transmiteEnfermedades())
      nivelSalud = nivelSalud - plaga.nivelDanio()
    }
}

class Barrio{
  const elementos = []
  const elementosBuenos = []
  const elementosNoBuenos = []
  method elementosBuenos() = elementosBuenos
  method elementosNoBuenos() = elementosNoBuenos

  method agregarElemento(element) = elementos.add(element)
  method agregarElementoBueno(elemento){elementosBuenos.add(elemento)}
  method agregarNoElementoBueno(elemento){elementosNoBuenos.add(elemento)}
  method elementoEsBueno(elemento) {
      if (elemento.esBueno()) self.agregarElementoBueno(elemento) else self.agregarNoElementoBueno(elemento)
  }
  method esCopado() = self.elementosBuenos().size() > self.elementosNoBuenos().size()
}

class Cucarachas{
  var poblacion
  var pesoPromedio
  method poblacion() = poblacion
  method pesoPromedio() = pesoPromedio
  method nivelDanio() = poblacion /2
  method transmiteEnfermedades() = poblacion > 10 and pesoPromedio >= 10
  method atacarElemento(elemento){
    elemento.recibirAtaque(self)
    poblacion = poblacion * 1.10
    pesoPromedio = pesoPromedio + 2
  }
}
class Mosquitos{
  var poblacion
  var pesoPromedio
  method poblacion() = poblacion
  method pesoPromedio() = pesoPromedio
  method nivelDanio() = poblacion 
  method transmiteEnfermedades() = poblacion > 10 and poblacion % 3 == 0
  method atacarElemento(elemento){
    elemento.recibirAtaque(self)
    poblacion = poblacion * 1.10
  }
}
class Pulgas{
  var poblacion
  var pesoPromedio
  method poblacion() = poblacion
  method pesoPromedio() = pesoPromedio
  method nivelDanio() = poblacion * 2
  method transmiteEnfermedades() = poblacion > 10
  method atacarElemento(elemento){
    elemento.recibirAtaque(self)
    poblacion = poblacion * 1.10
  }
}
class Garrapatas{
  var poblacion
  var pesoPromedio
  method poblacion() = poblacion
  method pesoPromedio() = pesoPromedio
  method nivelDanio() = poblacion * 2
  method transmiteEnfermedades() = poblacion > 10 
  method atacarElemento(elemento){
    elemento.recibirAtaque(self)
    poblacion = poblacion * 1.20
  }
}



const hogar1 = new Hogar(confort=200,nivelMugre=100)
const mascota1 = new Mascota(nivelSalud=10)
const huerta1 = new Huerta(capacidadProduccion=10,nivel=2)
const hogar2 = new Hogar()
const garrapata1 = new Garrapatas(poblacion=10,pesoPromedio=20)
const pulgas1 = new Pulgas(poblacion=1,pesoPromedio=20)
const cucas1 = new Cucarachas(poblacion=10,pesoPromedio=20)