<!DOCTYPE html>
<html>
<head>
	<title>{$title|default:"Blog UNLu"}</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale:1.0">
	<link rel="stylesheet" href="../../css/styles.css">
</head>
<body>
	<header>
		<img src="../../img/logo.jpg" alt="Logo del sitio" title="Universidad Nacional de Luján">
		{if $sesion neq null}
		<a id="contenedorPerfil" href="#">
			<div>
				<h2>{$sesion["user"]}</h2>
				<h3>{$sesion["nivel"]}</h3>
				<p>{$sesion["puntos"]}</p>
			</div>
		</a>
		{else}
		<a href="http://localhost/index.php/usuarios/login">Iniciar sesión</a>
		<a href="http://localhost/index.php/usuarios/agregar">Registrarse</a>
		{/if}
		<nav id="nav">
			<ul>
				<li>
					<a href="#">POSTS</a>
					<ul>
						<li><a href="#">Portada</a></li>
						<li><a href="#">Nuevo post</a></li>
					</ul>
				</li>
				<li>
					<a href="#">GRUPOS</a>
					<ul>
						<li><a href="#">Portada</a></li>
						<li><a href="#">Nuevo grupo</a></li>
						<li><a href="#">Unirse a un grupo</a></li>
					</ul>
				</li>
				<li><a href="#">RANKINGS</a></li>
				<li>
					<a href="#">CUENTA</a>
					<ul>
						<li><a href="#">Perfil</a></li>
						<li><a href="#">Mis posts</a></li>
						<li><a href="#">Mis grupos</a></li>
						<li><a href="#">Siguiendo</a></li>
						<li><a href="#">Favoritos</a></li>
						<li><a href="#">Mensajes</a></li>
						<li><a href="#">Configuración</a></li>
					</ul>
				</li>
				<li><a href="#">AYUDA</a></li>
			</ul>
		</nav>
		<!-- BUSCADOR -->
	</header>