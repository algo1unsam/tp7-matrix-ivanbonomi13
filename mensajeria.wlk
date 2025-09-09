import wollok.vm.*
import mensajeros.*

object mensajeria {
  const mensajeros = []
  
  method mensajeros() = mensajeros
  
  method contratar(mensajero) {
    mensajeros.add(mensajero)
  }
  
  method despedir(mensajero) {
    mensajeros.remove(mensajero)
  }
  
  method despedirATodos() {
    mensajeros.clear()
  }
  
  method esGrande() = mensajeros.size() > 2
  
  method puedeSerEntregadoPorElPrimero() = paquete.puedeSerEntregadoPor(
    mensajeros.first()
  )
  
  method pesoDelUltimo() = mensajeros.last().peso()
}

object paquetito {
  const property pago = true
  
  method puedeSerEntregadoPor(mensajero) = true
}

object paqueton {
  const destinos = []
  
}