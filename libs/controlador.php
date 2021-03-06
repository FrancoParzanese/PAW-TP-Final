<?php

namespace PAW\Libs;

/**
 * Clase base para controladores.
 *
 * @author Santiago Ricci <sricci.soft at gmail.com>
 */
abstract class Controlador {

	/**
	 * Nombre de la clase a emplear como vista.
	 * @var string
	 */
	private $viewClass;

	/**
	 * Variables para el renderizado de la vista.
	 * @var array
	 */
	private $variablesVista;

	public function __construct() {
		$this->variablesVista = [];
		$this->viewClass = "PAW\\Libs\\VistaHTMLSmarty";
	}

	protected function redireccionar($controlador = null, $accion = null, $parametros = []) {
		if (!empty($_SERVER["HTTPS"]) && ($_SERVER["HTTPS"] == "on")) {
			$uri = "https://";
		} else {
			$uri = "http://";
		}
		$uri .= $_SERVER["HTTP_HOST"] . "/index.php";
		if (isset($controlador) && !empty($controlador) && isset($accion) && !empty($accion)) {
			$uri .= "/$controlador/$accion";
			foreach ($parametros as $param) {
				$uri .= "/$param";
			}
		}
		header("Location: $uri");
		exit;
	}

	public function ejecutarAccion($nombre, $parametros = []) {
		$this->antesDelFiltro();
		call_user_func_array([$this, $nombre], $parametros);
		$claseVista = $this->getViewClass();
		/* @var $vista Vista */
		$vista = new $claseVista();
		foreach ($this->variablesVista as $nombreVar => $valor) {
			$vista->setVariable($nombreVar, $valor);
		}
		$fqcn = explode("\\", get_class($this));
		$controllerName = array_pop($fqcn);
		$vista->dibujar($controllerName . DIRECTORY_SEPARATOR . $nombre);
	}

	public function pasarVariableAVista($nombre, $valor) {
		$this->variablesVista[$nombre] = $valor;
	}

	public function setViewClass($viewClass) {
		$this->viewClass = $viewClass;
	}

	public function getViewClass() {
		return $this->viewClass;
	}

	protected function tieneDatos() {
		return count($_REQUEST) > 0;
	}

	protected function antesDelFiltro() {
		if (isset($_SESSION["userIn"]) && !empty($_SESSION["userIn"])) {
			$data = [
				"id" => $_SESSION["userIn"]["id"],
				"user" => $_SESSION["userIn"]["username"],
				"nivel" => $_SESSION["userIn"]["nivel"]["nombre"],
				"puntos" => $_SESSION["userIn"]["puntos"]
			];
		} else {
			$data = null;
		}
		$this->pasarVariableAVista("sesion", $data);
	}

}

?>
