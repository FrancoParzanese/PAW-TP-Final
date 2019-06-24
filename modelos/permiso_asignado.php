<?php

namespace PAW\Modelos;

/**
 * Entidad de relación entre permisos y niveles. Permite indicar las capacidades
 * y limitaciones de los usuarios en base al nivel que tienen.
 */
class Permiso_Asignado {

	/**
	 * Nivel que posee el permiso.
	 */
	private $nivel;
	/**
	 * Permiso que se le asigna al nivel.
	 */
	private $permiso;

}

?>
