package ar.edu.POIs

//import java.util.ArrayList
//import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class LocalComercial extends Poi {
	Rubro rubro
	String nombre
//	List<String> palabrasClave = new ArrayList<String>

	new(Direccion _miDireccion, String _nombre, HorarioDeAtencion _horario, Rubro _rubro) {
		_direccion = _miDireccion
		rubro = _rubro
		nombre = _nombre
		horario = _horario
	}
	
	new() {	}
	
	override getNombre(){
		rubro.nombre + " " + nombre
	}

	override estaCerca(Point unPunto) {
//		_direccion.miUbicacion.distance(unPunto) < miRubro.getCercania()
		getDistancia(unPunto) < rubro.getCercania()		//para evitar repetición de código
	}

	override matchearPoi(String valorBuscado) {
		StringUtilities.queComienceCon(valorBuscado, nombre) ||
		super.matchearPoi(valorBuscado)||
//		StringUtilities.valorBuscadoEstaContenidoExactamenteEnPalabraClave(palabrasClave, valorBuscado) ||
		StringUtilities.match(rubro.getNombre, valorBuscado)|| matchearNombrePoi(valorBuscado)
		}

}
