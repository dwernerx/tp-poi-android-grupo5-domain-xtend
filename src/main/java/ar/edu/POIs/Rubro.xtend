package ar.edu.POIs

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Rubro {
	String nombre //nombreRubro
	double cercania

	new(String _nombreRubro, double _cercania) {
		nombre = _nombreRubro
		cercania = _cercania
	}
	
	def estaCerca(Double distancia){
		distancia < cercania;
	}

}
