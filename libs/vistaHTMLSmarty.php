<?php

namespace PAW\Libs;

require "vendor\\smarty\\smarty\\libs\\smarty.class.php";

/**
 * Vista HTML con motor de templates Smarty.
 *
 * @author Franco Parzanese.
 */
class VistaHTMLSmarty extends Vista {

	/**
	 * Directorio base de templates.
	 * @var string
	 */
	private $baseDir;

	/**
	 * Objeto Smarty.
	 */
	private $smarty;

	public function __construct() {
		parent::__construct();
		$this->contentType = "text/html";
		$this->baseDir = __DIR__ . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "vistas" . DIRECTORY_SEPARATOR;
		$this->smarty = new \Smarty;
	}

	protected function doRender($accion) {
		$this->smarty->display($this->baseDir . $accion . ".tpl");
	}

	public function setVariable($nombre, $valor) {
		$this->smarty->assign($nombre, $valor);
	}

}

?>
