import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_one/models/sepatu.dart';
import 'package:mobile_one/pages/main_page.dart';
import 'package:mobile_one/pages/update_page.dart';
import 'package:mobile_one/providers/post_provider.dart';
import 'package:mobile_one/theme.dart';
import 'package:provider/provider.dart';

import '../providers/wishlist_provider.dart';

class DetailPage extends StatelessWidget {
 

 final Sepatu api;
  DetailPage(this.api);
  @override
  Widget build(BuildContext context) {
    PostProvider postProvider = Provider.of<PostProvider>(context);
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);


    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              '${api.gambar}',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  api.nama.toString(),
                                  style: subTitleTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${api.harga}',
                                    style: subTitleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  api.deskripsi.toString(),
                                  style: emailTextStyle.copyWith(
                                    fontSize: 10,
                                  )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      postProvider.delete(api.id);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                    child: Icon(Icons.delete),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => getPage(api)));
                    },
                    child: Icon(Icons.update),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setSepatu(api);
                      if (wishlistProvider.isWishlist(api)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Ditambahkan',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Dihapuskan',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      wishlistProvider.isWishlist(api)
                          ? 'assets/Love Icon.png'
                          : 'assets/btn_wishlist.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
