{include file="../header.tpl" title="Iniciar sesión"}

<h1>Iniciar sesión</h1>
<form method="post">
	<label for="user">Nombre de usuario:</label>
	<input type="text" name="user" value="{$user}" placeholder="Nombre de usuario..." />
	<label for="pass">Contraseña:</label>
	<input type="password" name="pass" />
	<p class="error">{$error}</p>
	<input type="reset" value="Resetear" />
	<input type="submit" value="Iniciar sesión" />
</form>

{include file="../footer.tpl"}