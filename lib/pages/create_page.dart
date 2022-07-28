import 'package:mobile_one/pages/home_page.dart';
import 'package:mobile_one/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:mobile_one/providers/post_provider.dart';
import 'package:mobile_one/models/sepatu.dart';
import 'package:mobile_one/pages/main_page.dart';
import 'package:mobile_one/providers/post_provider.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatelessWidget {
  TextEditingController nama = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController gambar = TextEditingController();
  TextEditingController harga = TextEditingController();


  @override
  Widget build(BuildContext context) {
    PostProvider control = Provider.of<PostProvider>(context);
    return Scaffold(

      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 15),
          //Text Nama
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: nama,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Nama Sepatu",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Text Trips
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: deskripsi,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "deskripsi",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: gambar,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Gambar",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Text Airplane
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: harga,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Harga",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Button Update
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  control.post(
                    nama.text,
                    deskripsi.text,
                    gambar.text,
                    int.parse(harga.text),
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                child: const Text("Create Data"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Button Delete
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Color(0xFF0266FF),
            indent: 10,
            endIndent: 10,
            thickness: 0.2,
          ),
          //Text 1

          //Content 1 Gambar
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
