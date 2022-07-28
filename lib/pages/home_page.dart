import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_one/auth.dart';
import 'package:mobile_one/models/sepatu.dart';
import 'package:mobile_one/notification_handler.dart';
import 'package:mobile_one/providers/sepatu_provider.dart';
import 'package:mobile_one/theme.dart';
import 'package:mobile_one/widgets/card.dart';
import 'package:provider/provider.dart';

import '../providers/sepatu_provider.dart';


AuthenticationService service = AuthenticationService(FirebaseAuth.instance);

class HomePage extends StatefulWidget {
  final String nama;
  const HomePage({Key? key, required this.nama}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    var initializationSettingAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSetting =
        InitializationSettings(android: initializationSettingAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSetting);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      debugPrint("Kamu menerima pesan! ${message.notification?.title}");
      debugPrint("${message.notification?.body}");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: android.smallIcon,
              // color: Colors.red,
              playSound: true,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
  var sepatuProvider = Provider.of<SepatuProvider>(context);
    final List _id = [1, 2, 3, 4, 5, 6];

    final List _sepatu = [
      'Sneakers',
      'Sepatu Sekolah',
      'Kantoran',
      'Sepatu Anak',
      'Sepatu roda',
    ];
    final List _sepatuTrending = [
      'Elite Satu',
      'Elite Dua',
      'Elite Tiga',
      'Elite Empat',
      'Elite Lima',
    ];
    final List _gambar = [
      'assets/sepatu_satu.png',
      'assets/sepatu-dua.png',
      'assets/sepatu-tiga.png',
      'assets/sepatu-empat.png',
      'assets/sepatu-lima.png',
    ];
    final List _gambarTrending = [
      'assets/elite-satu.png',
      'assets/elite-dua.png',
      'assets/elite-tiga.png',
      'assets/elite-empat.png',
      'assets/elite-lima.png',
    ];

    Widget header() {
      return SafeArea(
        child: Container(
          decoration: new BoxDecoration(color: Colors.black38),
          padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat berbelanja,',
                    style: headerTextStyle,
                  ),
                  Text(
                    service.getName(),
                    style: buttonTextStyle,
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/foto.png',
                width: 75,
                height: 75,
              )
            ],
          ),
        ),
      );
    }

    Widget body() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 24),
          //   child: Text(
          //     'Kategori',
          //     style: GoogleFonts.poppins(
          //       color: const Color(0xff272C2F),
          //       fontSize: 15,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
        // Padding(
        //       padding: EdgeInsets.symmetric(
        //         horizontal: 24,
        //       ),
        //       child: ListView(
        //         scrollDirection: Axis.horizontal,
        //         children: 
        //           [FutureBuilder(
        //             future: sepatuProvider.getRecommendedSepatus(),
        //             builder: (context, snapshot) {
        //               if (snapshot.hasData) {
        //                 List<SepatuCard>? data = snapshot.data as List<SepatuCard>?;
              
        //                 int index = 0;
              
        //                 return Column(
        //                   children: data!.map((item) {
        //                     index++;
        //                     return Container(
        //                       margin: EdgeInsets.only(
        //                         top: index == 1 ? 0 : 30,
        //                       ),
        //                       child: SepatuCard(item),
        //                     );
        //                   }).toList(),
        //                 );
        //               }
        //               return Center(
        //                 child: CircularProgressIndicator(),
        //               );
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Sepatu Trending',
              style: GoogleFonts.poppins(
                color: const Color(0xff272C2F),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder(
                  future: sepatuProvider.getRecommendedSepatus(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Sepatu>? data = snapshot.data as List<Sepatu>?;
              
                      int index = 0;
              
                      return Row(
                        children: data!.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SepatuCard(item),
                          );
                        }).toList(),
                      );
                    }
                    return
                  SizedBox(
                        child: Center(
                        child: CircularProgressIndicator(),
                        ),
                    );
                  },
                ),
              ),
            ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          body(),
        ],
      ),
    );
    // );
  }
}
