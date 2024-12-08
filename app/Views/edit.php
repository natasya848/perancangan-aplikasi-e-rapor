<h3>Edit Barang Masuk</h3>
	<form action="<?= base_url('home/simpan_nilai') ?>" method="post">
	<div class="mb-3 mt">
		<label for="email" class="form-label">Pengetahuan: </label>
		<input type="number" class="form-control" id="nama" placeholder="Enter Id" name="id" value="<?= $takdirestui->pengatahuan ?> ">
	</div>
	<div class="mb-3">
		<label for="tanggal" class="form-label">Keterampilan: </label>
		<input type="number" class="form-control" id="jumlah" placeholder="Enter Jumlah" name="jumlah" 
		value="<?= $takdirestui->keterampilan ?>">
	</div>
	   <input type="hidden" value="<?= $takdirestui->id_nilai?>" name="idm"> 
	   <button type="submit" class="btn btn-primary">Submit</button>
</form>