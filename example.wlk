
// PERSONAS
object luisa {
  var personaje = null
  method personaje() = personaje
  method nuevoPersonaje(nuevo) { personaje = nuevo}
  method aparece(elemento) = personaje.encontrar(elemento)
}

object froki {
  var arma = ballesta
  method cambiarArma(unArma) {arma = unArma}
  method encontrar(elemento) {
    if(arma.cargada()){
      elemento.recibeDaño(arma)
      arma.haceDaño()
    }
  }
}

object mario {
  var valorRecolectado = 0
  var ultimoElementoEncontrado = 0
  method encontrar(elemento) {
    valorRecolectado = valorRecolectado + elemento.valorOtorgado()
    elemento.trabajo()
    ultimoElementoEncontrado = elemento
  }
  method valorRecolectado() = valorRecolectado
  method esFeliz() = valorRecolectado >= 50 || ultimoElementoEncontrado.altura() >= 10
    
}

// ARMAS

object ballesta {
  var flechas = 10
  method hacerDaño() {flechas = flechas - 1}
  method cargada() = flechas >= 1
  method potencia() = 4
}

object jabalina {
  var cargada = true 
  method cargada() = cargada
  method haceDaño() { cargada = false}
  method potencia() = 30
}

// ELEMENTOS

object castillo {
  var defensaActual = 150
  method altura() = 20
  method recibeDaño(arma) { defensaActual = defensaActual - arma.potencia()}
  method nivelDeDefensa() = defensaActual
  method valorOtorgado() = defensaActual / 5
  method trabajo() = 200.min(defensaActual + 20)
}

object aurora {
  var vive = true
  method altura() = 1
  method vive() = vive
  method recibeDaño(arma) {
    if (arma.potencia() >= 10){
      vive = false
    }

  }
  method valorOtorgado() = 15
  method trabajo() {}


}

object tipa {
  var altura = 8
  method altura() = altura
  method recibeDaño(elemento) {}
  method valorOtorgado() = altura * 2
  method trabajo() { altura = altura + 1}
}