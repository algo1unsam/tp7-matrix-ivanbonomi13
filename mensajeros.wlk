import mensajeria.*

object morfeo {
  var property kilos = 90
  var peso = 0
  var property transporte = camion
  var property puedeLlamar = false
  
  method peso() {
    peso = self.kilos() + transporte.peso()
    return peso
  }
}

object trinity {
  var property peso = 900
  var property puedeLlamar = true
}

object neo {
  var property peso = 0
  var property puedeLlamar = true
}

object cypher {
  var property peso = 100
  const property puedeLlamar = false
} //nuevo mensajero

object camion {
  var property acoplados = 1
  
  method peso() = self.acoplados() * 500
}

object monopatin {
  method peso() = 1
}

object puente {
  method dejarPasar(mensajero) = mensajero.peso() < 1000
}

object matrix {
  method dejarPasar(mensajero) = mensajero.puedeLlamar()
}

object paquete {
  var property precio = 50
  var property pago = false
  var property destino = puente
  
  method pagar() {
    self.pago(true)
  }
  
  method estaPago() = pago
  
  method puedeSerEntregadoPor(
    mensajero
  ) = self.estaPago() and destino.dejarPasar(mensajero)
}

object paquetito {
  const property precio = 0
  
  method puedeSerEntregadoPor(mensajero) = true
  
  method estaPago() = true
}

object paqueton {
  const property destinos = []
  var precio = 0
  var property pago = 0
  
  method agregarDestino(destino) {
    destinos.add(destino)
  }
  
  method precio() {
    precio = self.destinos().size() * 100
    return precio
  }
  
  method pagar(monto) {
    pago += monto
  }
  
  method estaPago() = self.pago() == self.precio()
  
  method puedeSerEntregadoPor(mensajero) = self.estaPago() and destinos.all(
    { destino => destino.dejarPasar(mensajero) }
  )
}

object express {
  var property precio = 150
  var property pago = false
  var property destino = matrix
  
  method pagar() {
    self.pago(true)
  }
  
  method estaPago() = pago
  
  method puedeSerEntregadoPor(
    mensajero
  ) = self.estaPago() and destino.dejarPasar(mensajero)
}