class Komoditas {
  final String nama;
  final String harga;

  Komoditas({required this.nama, required this.harga});

  factory Komoditas.fromFirestore(Map<String, dynamic> data) {
    return Komoditas(
      nama: data['nama'] ?? '',
      harga: data['harga'] ?? '0',
    );
  }
}