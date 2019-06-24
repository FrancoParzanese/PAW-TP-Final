<?php

namespace PAW\Modelos;

use PDO;

/**
 * Clase para la gestión de la conexión a la base de datos.
 *
 * @author Franco L. Parzanese.
 */
class Database {

	/**
	 * Ruta del archivo de configuración para la conexión a la base de datos.
	 */
	const DATABASE_CONFIG = "D:\\XAMPP\\htdocs\\config\\database.json";

	/**
	 * Instancia de la clase.
	 * @var Conexion.
	 */
	private static $instance;

	/**
	 * Constructor.
	 * @param String Host al cual se establecerá la conexión.
	 * @param Integer Puerto al cual se establecerá la conexión.
	 * @param String Nombre de la base de datos.
	 * @param String Nombre de usuario en el SGBD.
	 * @param String Contraseña del usuario en el SGBD.
	 */
	private function __construct($host, $port, $dbname, $user, $pass) {
		try {
			$this->conn = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $user, $pass);
		} catch (PDOException $e) {
			$this->conn = null;
		}
	}

	/**
	 * Devuelve la instancia de la clase.
	 * @return Conexion La instancia de la clase.
	 */
	public static function getInstance() {
		if (is_null(self::$instance)) {
			try {
				$file = fopen(self::DATABASE_CONFIG, "r");
				$read = fread($file, filesize(self::DATABASE_CONFIG));
				fclose($file);
				$read = json_decode($read, true);
				self::$instance = new self($read["host"], $read["port"], $read["dbname"], $read["user"], $read["pass"]);
			} catch (Exception $e) {
				return false;
			}
		}
		return self::$instance;
	}

	/**
	 * Cerrar una conexión.
	 */
	public static function cerrar() {
		self::$instance = null;
	}

	/**
	 * Crear una 'prepared statement'.
	 * @param String Consulta a preparar.
	 * @return PDOStatement|false El objeto PDOStatement si todo salió bien, o 'false' en caso de error.
	 */
	public function prepararConsulta($sql) {
		try {
			return $this->conn->prepare($sql);
		} catch (PDOException $e) {
			return false;
		}
	}
	/**
	 * Obtener el ID de la fila insertada. Se debe llamar a esta función luego de haber insertado la fila.
	 * @return Integer ID de la última fila insertada.
	 */
	public function ultimoId() {
		return $this->conn->lastInsertId();
	}

}

?>
