<?php

namespace PAW\Modelos;

/**
 * Post creado por un usuario, puede pertenecer a un grupo o no.
 */
public class Post {

	/**
	 * ID del post.
	 */
	private $id;
	/**
	 * Usuario creador del post.
	 */
	private $usuario;
	/**
	 * Grupo al que pertenece el post, en caso de pertenecer a uno.
	 */
	private $grupo;
	/**
	 * Título del post.
	 */
	private $titulo;
	/**
	 * Categoría temática a la cual pertenece el post.
	 */
	private $categoria;
	/**
	 * Contenido del post (código HTML).
	 */
	private $post;
	/**
	 * Fecha de creación del post.
	 */
	private $fecha;
	/**
	 * Puntos obtenidos del post.
	 */
	private $puntos;
	/**
	 * Cantidad de usuarios que añadieron a favoritos al post.
	 */
	private $favoritos;

}

?>
