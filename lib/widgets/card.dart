import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_one/models/sepatu.dart';
import 'package:mobile_one/pages/detail_page.dart';
import 'package:mobile_one/pages/second_homepage.dart';
import 'package:provider/provider.dart';

import '../providers/wishlist_provider.dart';

class SepatuCard extends StatelessWidget {
  final Sepatu api;
  SepatuCard(this.api);



  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return InkWell(
            onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(api),
          ),
        );
      },
      child: Container(
        height: 200,
        width: 150,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 7),
            child: Text(
              api.nama.toString(),
              style: GoogleFonts.poppins(
                  color: const Color(0xff272C2F),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('${api.gambar}'),
          ),
        ),
      ),
    );
  }
}
