<?php

namespace PAW\Modelos;

/**
 * Comentario en un post.
 */
public class Comentario {

	/**
	 * ID del comentario.
	 */
	private $id;
	/**
	 * Usuario que realizó el comentario.
	 */
	private $usuario;
	/**
	 * Post en el cual se realizó el comentario.
	 */
	private $post;
	/**
	 * Fecha en la cual se realizó el comentario.
	 */
	private $fecha;
	/**
	 * Comentario en sí.
	 */
	private $comentario;

}

?>
