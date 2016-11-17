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
	List<Servicio> servicios = new ArrayList<Servicio>

	new(Comuna _comuna, Direccion _miDireccion) {
		comuna = _comuna
		_direccion = _miDireccion
	}
	
	new() {}
	
	def List<String> getListaServicios(){
		var int i;
		var List<String> serviciosStrings = new ArrayList<String>();
        for(i=0; i<servicios.size(); i++){
            serviciosStrings.add(servicios.get(i).toString());
        }

//		return StringUtilities.join("\n", serviciosStrings)
		return serviciosStrings
	} 
	
	override getNombre(){
		comuna.numeroComuna
	}

	override estaCerca(Point unPunto) {
		comuna.getZonaComuna.isInside(unPunto) || super.estaCerca(unPunto)
	}

	override estaDisponible(DateTime momento) {
		servicios.exists[s|s.estaDisponible(momento)]
	}

	def boolean estaDisponible(DateTime momento, String valorBuscado) {
		servicios.exists[s|StringUtilities.match(s.nombre, valorBuscado) && s.estaDisponible(momento)]
	}

	override matchearPoi(String valorBuscado) {
		super.matchearPoi(valorBuscado)/*StringUtilities.match(comuna.getNumeroComuna, valorBuscado)*/ || StringUtilities.alMenosUnServicioComienzaCon(valorBuscado, servicios)|| matchearNombrePoi(valorBuscado)
	}

}
