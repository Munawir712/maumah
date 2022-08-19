class PropertyModel {
	final String nama;
	final int harga;
	final String jangkaWaktu;
	final String kategori;
	final String description;
	final String lokasi;
	final String alamat;
	final String tipe;
	final String status;
	final List<String>? imagesPath;
	final List<Fasilitas>? fasilitas;
	bool isBookmark;

  PropertyModel({
		required this.nama, 
		required this.harga,
		required this.jangkaWaktu, 
		required this.kategori, 
		required this.description, 
		required this.lokasi,
		required this.alamat,
		required this.tipe,
		required this.status,
		this.imagesPath, 
		this.fasilitas, 
		this.isBookmark = false,
	});
}

class Fasilitas {
	final String nama;
	final String jumlah;

  Fasilitas(this.nama, this.jumlah);
}

List<PropertyModel> listProperty = [
	PropertyModel(
		nama: "Kos Arena Putri", 
		harga: 500000, 
		jangkaWaktu: "bulan", 
		kategori: "Kos",
		lokasi: "Banda Aceh - Darussalam",
		alamat: "Jl. Kemana-mana tidak maju no. 5", 
		description: "Ini kos Putri Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium, perspiciatis. Ut suscipit laboriosam excepturi repellendus nobis velit eligendi ipsa dolorum sunt voluptatem facere fugit nostrum, nemo quaerat reprehenderit, ipsum natus perferendis ducimus voluptates obcaecati impedit labore? Animi debitis architecto, voluptatem voluptatum voluptate quia cum veritatis obcaecati, enim ea eos? Ratione inventore voluptate voluptatibus quod, excepturi iusto saepe nam incidunt accusamus!", 
		status: "tersedia", 
		tipe: "sewa",
		isBookmark: false,
		imagesPath: [
			"https://images.unsplash.com/photo-1572120360610-d971b9d7767c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
			"https://images.unsplash.com/photo-1480074568708-e7b720bb3f09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
		],
		fasilitas: [
			Fasilitas("Wifi", ""),
			Fasilitas("Kamar", "2"),
			Fasilitas("Kamar Mandi", "1"),
			Fasilitas("Lemari", "2"),
			Fasilitas("Dapur", "1"),
		],
	),
	PropertyModel(
		nama: "Kos Arena Putra", 
		harga: 600000, 
		jangkaWaktu: "bulan", 
		kategori: "Kos", 
		lokasi: "Banda Aceh - Penayong",
		alamat: "Jl. Kumalala no. 9",
		description: "ini adalah kos putra Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium, perspiciatis. Ut suscipit laboriosam excepturi repellendus nobis velit eligendi ipsa dolorum sunt voluptatem facere fugit nostrum, nemo quaerat reprehenderit, ipsum natus perferendis ducimus voluptates obcaecati impedit labore? Animi debitis architecto, voluptatem voluptatum voluptate quia cum veritatis obcaecati, enim ea eos? Ratione inventore voluptate voluptatibus quod, excepturi iusto saepe nam incidunt accusamus!", 
		status: "tersedia", 
		tipe: "sewa",
		isBookmark: true,
		imagesPath: [
			"https://images.unsplash.com/photo-1516156008625-3a9d6067fab5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjF8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
			"https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fGhvdXNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
		],
		fasilitas: [
			Fasilitas("Wifi", ""),
			Fasilitas("Kamar", "2"),
			Fasilitas("Kamar Mandi", "2"),
		],
	),
];