package ar.edu.POIs

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Banco extends Poi {

	String nombreBanco
	List<String> servicios = new ArrayList<String>
	
	override getNombre(){
	"Banco " + nombreBanco
	}

	new(Direccion _miDireccion, HorarioDeAtencion _horario, String _nombreBanco) {
		_direccion = _miDireccion
		horario = _horario
		nombreBanco = _nombreBanco
	}
	
	new() {	}

	override matchearPoi(String valorBuscado) {
		StringUtilities.queComienceCon(valorBuscado, nombreBanco) || super.matchearPoi(valorBuscado)|| matchearNombrePoi(valorBuscado)//StringUtilities.match(nombreBancoMasBarrio(), valorBuscado)
	}
	
	def String nombreBancoMasBarrio(){
		val nombreMasBarrio = nombreBanco + " " + _direccion.getBarrio
		nombreMasBarrio
	}
	
	def String serviciosToString(){
		String.join("\n", servicios)
	}

}
