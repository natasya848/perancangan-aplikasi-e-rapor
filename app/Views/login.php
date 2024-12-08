<!DOCTYPE html>

	<title>Login Page</title>
	<link rel="stylesheet" type="text/css" href="<?=base_url('css/bootstrap.min.css')?>">
	<script src="<?=base_url('bootstrap.bundle.min.js'); ?>"></script>

<body>
<div class="container mt-3">
<h3>Login</h3>
<form action="<?= base_url('home/aksi_login')?>" method="post">
	<div class="mb-3 mt-3">
		<label for="email">Email:</label>
		<input type="email" class="form-control" id="email" placeholder="Enter Email" name="email">
	</div>
	<div class="mb-3">
		<label for="pswd">Password:</label>
		<input type="password"class="form-control" id="pswd" placeholder="Enter Password" name="pswd">
	</div>
    <div class="form-check mb-3">
    	<label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember">Remember me
        </label>
        </div>
		<button type="submit" class="btn btn-primary">Submit</button>
	
</form>
</div>
</body>