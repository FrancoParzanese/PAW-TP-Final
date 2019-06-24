<?php

namespace PAW\Controladores;

// Clase del modelo.
use PAW\Modelos\Usuario;

use PAW\Libs\VistaHTML;

/**
 * Usuario del sitio web.
 */
class Usuarios extends \PAW\Libs\Controlador {

	public function login() {
		if (isset($_SESSION["userIn"]) && !empty($_SESSION["userIn"])) {
			$this->redireccionar();
		}
		$user = "";
		$error = "";
		if ($this->tieneDatos()) {
			if (isset($_REQUEST["user"]) && !empty($_REQUEST["user"])
					&& isset($_REQUEST["pass"]) && !empty($_REQUEST["pass"])) {
				if (Usuario::login($_REQUEST["user"], $_REQUEST["pass"])) {
					$_SESSION["userIn"] = Usuario::getResumedInfo($_REQUEST["user"]);
					$this->redireccionar();
				} else {
					$user = $_REQUEST["user"];
					$error = "* - LOS DATOS SON INVÁLIDOS. INTENTE NUEVAMENTE.";
				}
			} else {
				$error = "* - POR FAVOR COMPLETE TODOS LOS CAMPOS.";
			}
		}
		$this->pasarVariableAVista("user", $user);
		$this->pasarVariableAVista("error", $error);
	}

}

?>
