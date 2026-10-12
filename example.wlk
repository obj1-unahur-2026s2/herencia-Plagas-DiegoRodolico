class Hogar{
  const nivelMugre = 0
  const confort = 0
  method esBueno() = confort /2 >= nivelMugre
  method recibirAtaque(plaga){nivelMugre + plaga.nivelDanio()}
}
class Huerta{
  const capacidadProduccion = 0
  const nivel = 1
  method esBueno() = capacidadProduccion > nivel  
  method recibirAtaque(plaga){
    if (plaga.transmiteEnfermedades())
      capacidadProduccion - plaga.nivelDanio() * 0.10 - 10
    else capacidadProduccion - plaga.nivelDanio()
    }
}
class Mascota{
  const nivelSalud = 0
  //esSaludable
  method esBueno() = nivelSalud > 250
  method recibirAtaque(plaga){ 
    if (plaga.transmiteEnfermedades())
      nivelSalud - plaga.nivelDanio()
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
  const poblacion
  const pesoPromedio
  method nivelDanio() = poblacion /2
  method transmiteEnfermedades() = poblacion > 10 and pesoPromedio >= 10
  method atacarElemento(elemento){
    elemento.recibirAtaque(self)
    poblacion * 1.10
    pesoPromedio + 2
  }
}
class Mosquitos{
  const poblacion
  const pesoPromedio
  method nivelDanio() = poblacion 
  method transmiteEnfermedades() = poblacion > 10 and poblacion % 3 == 0
  method atacarElemento(elemento){
    elemento.recibirAtaque(self)
    poblacion * 1.10
  }
}
class Pulgas{
  const poblacion
  const pesoPromedio
  method nivelDanio() = poblacion * 2
  method transmiteEnfermedades() = poblacion > 10
  method atacarElemento(elemento){
    elemento.recibirAtaque(self)
    poblacion * 1.10
  }
}
class Garrapatas{
  const poblacion
  const pesoPromedio
  method nivelDanio() = poblacion * 2
  method transmiteEnfermedades() = poblacion > 10 
  method atacarElemento(elemento){
    elemento.recibirAtaque(self)
    poblacion * 1.20
  }
}


/*
const hogar1 = new Hogar(confort=200)
const hogar2 = new Hogar()
*/