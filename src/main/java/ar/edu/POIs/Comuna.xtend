package ar.edu.POIs

import org.uqbar.geodds.Polygon
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Comuna {
	
	Polygon ZonaComuna
	String numeroComuna
	
	new(Polygon _comuna, String _numeroComuna) {
		ZonaComuna = _comuna
		numeroComuna = _numeroComuna
	}
	
	new() {}
	
}