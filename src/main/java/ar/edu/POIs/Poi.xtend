package ar.edu.POIs

import ar.edu.calificaciones.Calificacion
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable
import org.uqbar.geodds.Point
import java.text.DecimalFormat

@Observable
@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)

abstract class Poi extends Entity {
	HorarioDeAtencion horario
	Direccion _direccion
	val HashSet<String> palabrasClave = newHashSet
	String nombre
	String distancia = ""
	Boolean cercania = false   //estaCerca
	// la cambié a cercania porque en js la confunde con la funcion
	Boolean disponibilidad = false
	boolean estaEnFavoritos = true;
	Calificacion calificacion = new Calificacion
	String tipo = setTipoPoi

	def getNombre() { nombre }

	def getDireccion() {
		_direccion.toString()
	}

	def getDistancia(Point gpsPosicion) {
		_direccion.getDistancia(gpsPosicion)
	}

	def boolean estaCerca(Point unPunto) {
		getDistancia(unPunto) < 0.5
	}

	def boolean estaDisponible(DateTime momento) {
		horario.estaDisponible(momento)
	}

	def boolean matchearPoi(String valorBuscado) {
		StringUtilities.valorBuscadoEstaContenidoExactamenteEnPalabraClave(palabrasClave, valorBuscado)
	}

	def boolean matchearNombrePoi(String valorBuscado) {
		val nombrePoi= getNombre()
		StringUtilities.queComienceCon(valorBuscado, nombrePoi)
	}

	override validateCreate() {
		Validacion.general(this)
	}
	
	def void setDisponibilidad(){
		disponibilidad = this.estaDisponible(DateTime.now)
	}
	
	def void setPoiEstaCerca(Point unPunto) { 
		/*estaCerca*/cercania = this.estaCerca(unPunto)
	}
	
	def String setTipoPoi(){
		 this.getClass().getSimpleName().toString//.toLowerCase()
	}
	
	def void setDistancia(Point unPunto){
		val DecimalFormat decimales = new DecimalFormat("0.00")  //distancia con dos decimales como string
		distancia = decimales.format(this.getDistancia(unPunto))
//		distancia = RedondeoDecimales.redondearDecimales(this.getDistancia(unPunto),2) //devuelve double
	}
	
}
