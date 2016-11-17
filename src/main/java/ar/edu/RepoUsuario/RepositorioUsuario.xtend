package ar.edu.RepoUsuario

import ar.edu.usuario.Usuario
import java.util.List
import org.apache.commons.collections15.Predicate
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.UserException

@Accessors
class RepositorioUsuario extends CollectionBasedRepo<Usuario> {

	static RepositorioUsuario instance

	private new() {
	}

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioUsuario
		}
		instance
	}



	def Usuario iniciarSesion(Usuario usuario) {
		val cuenta = usuario.cuenta
		val password = usuario.password

		if (cuenta.nullOrEmpty) {
			throw new UserException("Debe ingresar la cuenta")
		} else if (password.nullOrEmpty) {
			throw new UserException("Debe ingresar la clave")
		} else if (getListaUsuario(cuenta, password).isEmpty) {
			throw new UserException("Credenciales Incorrectas")
		} else {
			(getListaUsuario (cuenta, password)).get(0)
		}
	}
	
	def List<Usuario> getListaUsuario(String cuenta, String password) {
		getObjects().filter[u|u.verificarCuenta(cuenta, password)].toList
	}
	
	

	override createExample() {
	}

	override getEntityType() {
		typeof(Usuario)
	}

	override protected Predicate<Usuario> getCriterio(Usuario example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
