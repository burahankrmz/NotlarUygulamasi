class Not {
  late int notID;
  late int kategoriID;
  late String notBaslik;
  late String notIcerik;
  late String notTarih;
  late int notOncelik;
  Not({
    required this.kategoriID,
    required this.notBaslik,
    required this.notIcerik,
    required this.notTarih,
    required this.notOncelik,
  });

  Not.withID({
    required this.notID,
    required this.kategoriID,
    required this.notBaslik,
    required this.notIcerik,
    required this.notTarih,
    required this.notOncelik,
  });

  Map<String, dynamic> toMap() {
    return {
      'notID': notID,
      'kategoriID': kategoriID,
      'notBaslik': notBaslik,
      'notIcerik': notIcerik,
      'notTarih': notTarih,
      'notOncelik': notOncelik,
    };
  }

  Not.fromMap(Map<String, dynamic> map) {
    notID = map['notID'];
    kategoriID = map['kategoriID'];
    notBaslik = map['notBaslik'];
    notIcerik = map['notIcerik'];
    notTarih = map['notTarih'];
    notOncelik = map['notOncelik'];
  }

  @override
  String toString() =>
      'Kategori(notID: $notID, kategoriID: $kategoriID, notBaslik: $notBaslik, notIcerik: $notIcerik, notTarih: $notTarih ,notOncelik: $notOncelik)';
}
