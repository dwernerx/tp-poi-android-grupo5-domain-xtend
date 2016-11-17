package ar.edu.POIs

import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime

@Accessors
class Servicio {
	String nombre //nombreServicio
	HorarioDeAtencion horario

	new(String _nombreServicio, HorarioDeAtencion _horario) {
		nombre = _nombreServicio
		horario = _horario
	}
	
	new() {	}

	def boolean estaDisponible(DateTime momento) {
		horario.estaDisponible(momento)
	}
}
