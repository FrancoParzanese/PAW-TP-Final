<?php

namespace PAW\Modelos;

/**
 * Entidad que relaciona un usuario con un grupo. Indica que $usuario es miembro
 * de $grupo.
 */
class Usuario_Grupo {

	/**
	 * Usuario que se está relacionando con el grupo.
	 */
	private $usuario;
	/**
	 * Grupo al que se le está relacionando el usuario.
	 */
	private $grupo;
	/**
	 * Fecha de ingreso del usuario al grupo.
	 */
	private $fecha;
	/**
	 * Rol del usuario en el grupo.
	 */
	private $rol;

}

?>
