import 'package:mobile_one/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_one/theme.dart';
import 'package:mobile_one/widgets/custom_list.dart';
import 'package:mobile_one/widgets/card.dart';

class TerbaruPage extends StatefulWidget {
  const TerbaruPage({Key? key}) : super(key: key);

  @override
  State<TerbaruPage> createState() => _TerbaruPageScreen();
}

class _TerbaruPageScreen extends State<TerbaruPage> {
    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
     const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Terbaru!',
                style: GoogleFonts.poppins(
                  color: const Color(0xff272C2F),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 16, left: 24.0),
                child: CustomList(
                  gambar: 'assets/sepatu_satu.png',
                  sepatu: 'Sepatu Baru',
                  deskripsi: 'Desc. Google',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 24.0),
              child: CustomList(
                gambar: 'assets/sepatu-dua.png',
                sepatu: 'Sepatu Baru 2',
                deskripsi: 'Desc. Google',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 24.0),
              child: CustomList(
                gambar: 'assets/sepatu-tiga.png',
                sepatu: 'Sepatu Baru 3',
                deskripsi: 'Desc. Google',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 24.0),
              child: CustomList(
                gambar: 'assets/elite-satu.png',
                sepatu: 'Sepatu Baru 4',
                deskripsi: 'Desc. Google',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 24.0),
              child: CustomList(
                gambar: 'assets/elite-dua.png',
                sepatu: 'Sepatu Baru 5',
                deskripsi: 'Desc. Google',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 24.0),
              child: CustomList(
                gambar: 'assets/elite-tiga.png',
                sepatu: 'Sepatu Baru 6',
                deskripsi: 'Desc. Google',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 24.0),
              child: CustomList(
                gambar: 'assets/elite-empat.png',
                sepatu: 'Sepatu Baru 7',
                deskripsi: 'Desc. Google',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 24.0),
              child: CustomList(
                gambar: 'assets/elite-lima.png',
                sepatu: 'Sepatu Baru 8',
                deskripsi: 'Desc. Google',
              ),
            ),
          ],
        ),
      );

    }

    


  }
