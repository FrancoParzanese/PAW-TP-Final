<?php

namespace PAW\Modelos;

/**
 * Entidad que relaciona dos usuarios cuando uno sigue al otro. Indica que $seguidor
 * está siguiendo a $seguido.
 */
class Seguidor {

	/**
	 * Usuario que está siguiendo al otro.
	 */
	private $seguidor;
	/**
	 * Usuario que está siendo seguido por el otro.
	 */
	private $seguido;

}

?>
