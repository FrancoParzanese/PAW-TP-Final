<?php

namespace PAW\Modelos;

/**
 * Roles creados por los administradores (creadores) de los grupos.
 */
public class Rol {

	/**
	 * ID del rol.
	 */
	private $id;
	/**
	 * Grupo al cual pertenece el rol.
	 */
	private $grupo;
	/**
	 * Nombre unívoco (dentro del grupo) del rol.
	 */
	private $nombre;
	/**
	 * Descripción opcional del rol.
	 */
	private $descripcion;

}

?>
