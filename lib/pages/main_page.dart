import 'package:mobile_one/pages/create_page.dart';
import 'package:mobile_one/pages/detail_page.dart';
import 'package:mobile_one/pages/favourite_page.dart';
import 'package:mobile_one/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_one/pages/profile_page.dart';
import 'package:mobile_one/pages/terbaru_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  var getname = "";
  var getemail = "";
  getName() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("displayName") != null && prefs.getString("displayEmail") != null) {
      var displayName = prefs.getString("displayName");
      var displayEmail = prefs.getString("displayEmail");
      setState(() {
        getname = displayName.toString();
        getemail = displayEmail.toString();
      });
      
    }
  }

  @override
  void initState() {
    super.initState();
    getName();
  }

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xffF6F7F8),
          currentIndex: currentIndex,
          onTap: (value) {
            if (kDebugMode) {
              print(value);
            }
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          unselectedItemColor: const Color(0xffB3B5C4),
          selectedItemColor: const Color(0xff272C2F),
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                  child: Icon(
                    Icons.home,
                    color: currentIndex == 0
                        ? Color(0xff4141A4)
                        : Colors.grey,
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                  child: Icon(
                    Icons.snowshoeing,
                    color: currentIndex == 1
                        ? Color(0xff4141A4)
                        : Colors.grey,
                  ),
                ),
                label: 'Terbaru'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                  child: Icon(
                    Icons.shopping_bag,
                    color: currentIndex == 2
                        ? Color(0xff4141A4)
                        : Colors.grey,
                  ),
                ),
                label: 'Favorit'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                  child: Icon(
                    Icons.person,
                    color: currentIndex == 2
                        ? Color(0xff4141A4)
                        : Colors.grey,
                  ),
                ),
                label: 'Create'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                  child: Icon(
                    Icons.person,
                    color: currentIndex == 4
                        ? Color(0xff4141A4)
                        : Colors.grey,
                  ),
                ),
                label: 'Profile'),
          ],
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage(
            nama: getname,
          );
        case 1:
          return const TerbaruPage();
        case 2:
          return FavouritePage();
        case 3:
          return CreatePage();
        case 4:
          return ProfilePage(
            nama: getname,
            email: getemail,
          
          );
      }
      return body();
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
