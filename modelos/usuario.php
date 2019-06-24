<?php

namespace PAW\Modelos;

/**
 * Usuario del sitio web.
 */
class Usuario {

	/**
	 * ID del usuario.
	 */
	private $id;
	/**
	 * Nombre real del usuario.
	 */
	private $nombre;
	/**
	 * Apellido del usuario.
	 */
	private $apellido;
	/**
	 * Nombre de usuario en el sitio web (unívoco).
	 */
	private $username;
	/**
	 * Hash de la contraseña del usuario.
	 */
	private $password;
	/**
	 * Cuenta de Facebook del usuario (sólo si se logueó con Facebook).
	 */
	private $facebook;
	/**
	 * Nivel del usuario.
	 */
	private $nivel;
	/**
	 * Puntos del usuario.
	 */
	private $puntos;
	/**
	 * Mensaje personal del usuario.
	 */
	private $mensajePersonal;

}

?>
