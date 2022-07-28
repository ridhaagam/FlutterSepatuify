import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobile_one/firebase_options.dart';
import 'package:mobile_one/notification_handler.dart';
import 'package:mobile_one/pages/splash_page.dart';
import 'package:mobile_one/providers/post_provider.dart';
import 'package:mobile_one/providers/sepatu_provider.dart';
import 'package:mobile_one/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await initializeNotification();
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
  AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
  await onTerminated();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SepatuProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreenPage(),
        )
    );
  }

  }
