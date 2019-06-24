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

	/**
	 * Devuelve la información resumida del usuario, ideal para mostrar en el header.
	 * @param string $user Nombre de usuario.
	 * @return string[]|false Devuelve los datos del usuario resumidos en caso de éxito.
	 * Devuelve <code>false</code> en caso de error.
	 */
	public static function getResumedInfo($user) {
		$db = Database::getInstance();
		// CORREGIR NIVEL PARA QUE DEVUELVA EL NOMBRE Y NO EL ID.
		$sql = "SELECT id, nivel, puntos FROM usuarios WHERE username = :user";
		$stmt = $db->prepararConsulta($sql);
		$stmt->bindParam(":user", $user);
		if (!$stmt->execute()) {
			return false;
		}
		$result = $stmt->fetchAll();
		return $result ? $result[0] : false;
	}

	/**
	 * Valida el inicio de sesión de un usuario.
	 * @param string $user Nombre de usuario.
	 * @param string $pass Contraseña.
	 * @return boolean Indica si el inicio de sesión es válido o no.
	 */
	public static function login($user, $pass) {
		$db = Database::getInstance();
		$sql = "SELECT password FROM usuarios WHERE username = :user";
		$stmt = $db->prepararConsulta($sql);
		$stmt->bindParam(":user", $user);
		if (!$stmt->execute()) {
			return false;
		}
		$result = $stmt->fetchAll();
		if ($result) {
			return password_verify($pass, $result[0]["password"]) ? true : false;
		}
		return false;
	}

}

?>
