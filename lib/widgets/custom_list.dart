import 'package:flutter/material.dart';
import 'package:mobile_one/theme.dart';

class CustomList extends StatelessWidget {
  final String sepatu;
  final String gambar;
  final String deskripsi;

  const CustomList({Key? key,  required this.sepatu,  required this.gambar,  required this.deskripsi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            gambar,
            width: 90,
            height: 90,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sepatu,
                  style: sepatuTextStyle,
                ),
                Text(
                  deskripsi,
                  style: namaTextStyle,
                ),
                const SizedBox(height: 18),
                const Divider(
                  color: Color(0xffECEDF1),
                  thickness: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
