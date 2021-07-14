class Kategori {
  late int kategoriID;
  late String kategoriBaslik;
  Kategori({
    required this.kategoriBaslik,
  });

  Kategori.withID({required this.kategoriID, required this.kategoriBaslik});

  Map<String, dynamic> toMap() {
    return {
      'kategoriID': kategoriID,
      'kategoriBaslik': kategoriBaslik,
    };
  }

  Kategori.fromMap(Map<String, dynamic> map) {
    kategoriID = map['kategoriID'];
    kategoriBaslik = map['kategoriBaslik'];
  }

  @override
  String toString() =>
      'Kategori(kategoriID: $kategoriID, kategoriBaslik: $kategoriBaslik)';
}
