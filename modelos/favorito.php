<?php

namespace PAW\Modelos;

/**
 * Entidad que relaciona a un usuario con un post añadido a favoritos. Indica que
 * $usuario añadió a favoritos al post $post.
 */
public class Favorito {

	/**
	 * Usuario que está añadiendo a sus favoritos al post.
	 */
	private $usuario;
	/**
	 * Post que está siendo añadidio como favorito por el usuario.
	 */
	private $post;

}

?>
