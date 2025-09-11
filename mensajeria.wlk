import wollok.vm.*
import mensajeros.*

object mensajeria {
  const property mensajeros = []
  const property enviados = []
  const property pendientes = []
  
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
  
  method puedeSerEntregado(paquete) = mensajeros.any(
    { m => paquete.puedeSerEntregadoPor(m) }
  )
  
  method mensajerosQuePueden(paquete) = mensajeros.filter(
    { m => paquete.puedeSerEntregadoPor(m) }
  )
  
  method tieneSobrepeso() = mensajeros.map({ m => m.peso() }).average() > 500
  
  method enviar(paquete) {
    if (self.puedeSerEntregado(paquete)) {
      const elegido = self.mensajerosQuePueden(paquete).anyOne()
      enviados.add(paquete)
    } else {
      pendientes.add(paquete)
    }
  }
  
  method facturacion() = enviados.map({ p => p.precio() }).sum()
  
  method enviarTodos(paquetes) {
    paquetes.forEach({ p => self.enviar(p) })
  }
  
  method enviarPendienteMasCaro() {
    const masCaro = pendientes.max({ p => p.precio() })
    if (self.puedeSerEntregado(masCaro)) {
      self.enviar(masCaro)
      pendientes.remove(masCaro)
    }
    return masCaro
  }
}