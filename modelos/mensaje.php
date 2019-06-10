<?php

namespace PAW\Modelos;

/**
 * Mensaje privado entre dos usuarios.
 */
public class Mensaje {

	/**
	 * ID del mensaje.
	 */
	private $id;
	/**
	 * Usuario emisor del mensaje.
	 */
	private $origen;
	/**
	 * Usuario receptor del mensaje.
	 */
	private $destino;
	/**
	 * Título (asunto) del mensaje.
	 */
	private $titulo;
	/**
	 * Mensaje en sí.
	 */
	private $mensaje;
	/**
	 * Estado del mensaje. Indica quiénes poseen aún el mensaje (no lo eliminaron).
	 * Valores posibles:
	 * "AM": Ambos usuarios poseen el mensaje aún.
	 * "SO": Sólo el origen posee el mensaje, el receptor ya lo eliminó.
	 * "SD": Sólo el receptor tiene el mensaje, el emisor ya lo eliminó.
	 * Cuando ambos usuarios eliminan el mensaje, la instancia se destruye.
	 */
	private $estado;

}

?>
