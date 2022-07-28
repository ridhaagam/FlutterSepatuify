import 'package:mobile_one/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_one/pages/home_page.dart';
import 'package:mobile_one/pages/main_page.dart';
import 'package:mobile_one/theme.dart';
import 'package:mobile_one/widgets/custom_list.dart';
import 'package:mobile_one/widgets/card.dart';
import 'package:provider/provider.dart';

import '../providers/wishlist_provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageScreen();
}

class _FavouritePageScreen extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Sepatu Favourite',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_love.png',
                color: Colors.purple,
                width: 90,
              ),
              SizedBox(
                height: 27,
              ),
              Text(
                'Ayo beli sepatu mahal sekarang!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Sepatu favoritmu kosong',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ));
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    backgroundColor: Color.fromARGB(255, 121, 0, 143),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            children: wishlistProvider.wishlist
                .map(
                  (sepatu) => SepatuCard(sepatu),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? emptyWishlist() : content(),
      ],
    );
  }
}
