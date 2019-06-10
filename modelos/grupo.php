<?php

namespace PAW\Modelos;

/**
 * Grupo creado en el sitio web.
 */
public class Grupo {

	/**
	 * ID del grupo.
	 */
	private $id;
	/**
	 * Nombre unívoco del grupo.
	 */
	private $nombre;
	/**
	 * Descripción opcional del grupo.
	 */
	private $descripcion;
	/**
	 * Categoría a la cual pertenece el grupo.
	 */
	private $categoria;
	/**
	 * Fecha de creación del grupo.
	 */
	private $fecha;
	/**
	 * Usuario creador del grupo.
	 */
	private $creador;
	/**
	 * Cantidad de integrantes del grupo.
	 */
	private $integrantes;

}

?>
