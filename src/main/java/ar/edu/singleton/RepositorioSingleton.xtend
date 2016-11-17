package ar.edu.singleton

import ar.edu.POIs.Poi
import ar.org.excepciones.BussinessException
//import com.google.gson.Gson
import java.util.List
import org.apache.commons.collections15.Predicate
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import ar.edu.usuario.Usuario

@Accessors
class RepositorioSingleton extends CollectionBasedRepo<Poi> {

	static RepositorioSingleton instance

	private new() {
	}

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioSingleton
		}
		instance
	}

	override update(Poi poi) {
		if (poi.isNew) {
			throw new BussinessException("El punto de interés no existe")
		} else {
			val id = poi.getId
			val oldObject = searchById(id)
			getObjects().remove(oldObject)
			getObjects().add(poi)
		}
	}

	def List<Poi> search(String valorBuscado) {
		getObjects().filter[o|o.matchearPoi(valorBuscado)].toList
	}

	override createExample() {
	}

	override getEntityType() {
		typeof(Poi)
	}

	override protected Predicate<Poi> getCriterio(Poi example) {
	}

	def List<Poi> buscadorPoisPersonales(Usuario usuario) {
		var pois = this.getObjects()
		pois.forEach [ poi |
			poi.setDisponibilidad()
			poi.setPoiEstaCerca(usuario.ubicacion)
			poi.setDistancia(usuario.ubicacion)
		]
		return pois
	}

}
