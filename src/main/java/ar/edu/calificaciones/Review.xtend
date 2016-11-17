package ar.edu.calificaciones

import ar.edu.usuario.Usuario
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
@JsonIgnoreProperties(ignoreUnknown = true)
class Review {
	
	Usuario usuario
	String comentario
	int puntuacion
	
	new(Usuario _usuario, String _comentario, int _puntuacion){
		usuario = _usuario
		comentario = _comentario
		puntuacion = _puntuacion
	}
	def getNombreDeUsuario(){
		usuario.getCuenta
	}
}
