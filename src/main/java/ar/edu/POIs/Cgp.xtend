package ar.edu.POIs

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Cgp extends Poi {
	Comuna comuna
	List<Servicio> servicios1 = new ArrayList<Servicio>
	List<String> servicios = new ArrayList<String>

	new(Comuna _comuna, Direccion _miDireccion) {
		comuna = _comuna
		_direccion = _miDireccion
	}
	
	new() {}
	
	override getNombre(){
		comuna.numeroComuna
	}

	override estaCerca(Point unPunto) {
		comuna.getZonaComuna.isInside(unPunto) || super.estaCerca(unPunto)
	}

	override estaDisponible(DateTime momento) {
		servicios1.exists[s|s.estaDisponible(momento)]
	}

	def boolean estaDisponible(DateTime momento, String valorBuscado) {
		servicios1.exists[s|StringUtilities.match(s.nombre, valorBuscado) && s.estaDisponible(momento)]
	}

	override matchearPoi(String valorBuscado) {
		super.matchearPoi(valorBuscado)/*StringUtilities.match(comuna.getNumeroComuna, valorBuscado)*/ || StringUtilities.alMenosUnServicioComienzaCon(valorBuscado, servicios1)|| matchearNombrePoi(valorBuscado)
	}

}
