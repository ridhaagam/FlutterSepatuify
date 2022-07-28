import 'dart:convert';

import 'package:mobile_one/models/sepatu.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  static const String url = "https://sepatuifynodejs.herokuapp.com/sepatu";

  void dioCoba(
    String nama,
    String deskripsi,
    String gambar,
    int harga,


  ) async {
    List<Sepatu> data = [];
    var dio = Dio();

    dio.post(
      url,
      data: jsonEncode({
        "nama": nama,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "harga": harga,

      }),
    );

    notifyListeners();
  }

  Future post(
    String nama,
    String deskripsi,
    String gambar,
    int harga,
  ) async {
    var dio = Dio();

    try {
      final result = await dio.post(
        url,
        data: jsonEncode({
        "nama": nama,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "harga": harga,
        }),
      );

      return result.data;
    } catch (e) {
      print(e);
    }
  }

  Future delete(String id) async {
    var dio = Dio();

    try {
      final result = await dio.delete(
        "${url}/${id}",
      );

      return result.data;
    } catch (e) {
      print(e);
    }
  }

  Future path(
    String nama,
    String deskripsi,
    String gambar,
    int harga,
    String id,
  ) async {
    var dio = Dio();

    try {
      final result = await dio.patch(
        "${url}/${id}",
        data: jsonEncode({
        "nama": nama,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "harga": harga,
        }),
      );
      return result.data;
    } catch (e) {
      print(e);
    }
  }
}
