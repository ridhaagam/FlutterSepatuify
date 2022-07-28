// To parse this JSON data, do
//
//     final sepatu = sepatuFromJson(jsonString);

import 'dart:convert';

List<Sepatu> sepatuFromJson(String str) => List<Sepatu>.from(json.decode(str).map((x) => Sepatu.fromJson(x)));

String sepatuToJson(List<Sepatu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sepatu {
    Sepatu({
        required this.id,
        required this.nama,
        required this.deskripsi,
        required this.gambar,
        required this.harga,
    });

    String id;
    String? nama;
    String? deskripsi;
    String? gambar;
    int? harga;

    factory Sepatu.fromJson(Map<String, dynamic> json) => Sepatu(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        gambar: json["gambar"],
        harga: json["harga"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "harga": harga,
    };
}
