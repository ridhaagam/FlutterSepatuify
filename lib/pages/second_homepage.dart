import 'package:flutter/material.dart';
import 'package:mobile_one/theme.dart';
import 'package:mobile_one/widgets/custom_list.dart';

class SecondHomePage extends StatelessWidget {
  final String sepatu;
  final String gambar;

  const SecondHomePage({Key? key, required this.gambar, required this.sepatu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 270,
                        child: Image.asset(
                          gambar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 200.0,
                        left: 24,
                      ),
                      child: Text(
                        sepatu,
                        style: sepatuTitleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 240,
                        left: 24,
                      ),
                      child: Text(
                        'Newest Hits',
                        style: buttonTextStyle,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jenis Sepatu',
                        style: title,
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: const [
                          CustomList(
                            sepatu: 'Sepatunya',
                            deskripsi: 'Deskripsi',
                            gambar: 'assets/sepatu_satu.png',
                          ),
                          SizedBox(height: 16),
                          CustomList(
                            sepatu: 'Sepatunya',
                            deskripsi: 'Deskripsi',
                            gambar: 'assets/sepatu-dua.png',
                          ),
                          SizedBox(height: 16),
                          CustomList(
                            sepatu: 'Sepatunya',
                            deskripsi: 'Deskripsi',
                            gambar: 'assets/elite-satu.png',
                          ),
                          SizedBox(height: 16),
                          CustomList(
                            sepatu: 'Sepatunya',
                            deskripsi: 'Deskripsi',
                            gambar: 'assets/elite-dua.png',
                          ),
                          SizedBox(height: 16),
                          CustomList(
                            sepatu: 'Sepatunya',
                            deskripsi: 'Deskripsi',
                            gambar: 'assets/elite-tiga.png',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
