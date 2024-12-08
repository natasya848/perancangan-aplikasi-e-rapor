<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="<?=base_url('css/bootstrap.min.css')?>">
	<script src="<?=base_url('bootstrap.bundle.min.js')?>"type="text/javascript"></script>

</head>
<body>
<div class="container mt-3">
<h3 align="center">login</h3>
<form action="" method="POST">
<table>
	<tr>
		<label for="user">Username:</label>
		<input type="text" value=""
		class="form-control" id="user" placeholder="Enter Username" name="user"required>
	</tr>
	</div>
	<div class="container mb-3">
	<tr>
		<label for="pass">Password:</label>
		<input type="password"class="form-control" id="pass" placeholder="Enter password" name="Password" required>
	</tr>
</div>

		<tr>
		<td></td>
		<td><input type="submit" value="Login">
		</td>
	</tr>
	</table>
	
</form>

</body>
</html>