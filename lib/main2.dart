import 'package:flutter/material.dart';
import 'package:login/screen/album.dart';
import 'package:login/screen/calendar.dart';
import 'package:login/screen/history.dart';
import 'package:login/screen/mainscreen.dart';
import 'package:login/screen/setting.dart';
import 'package:login/theme/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    historyPage(),
    albumPage(),
    mainPage(),
    calendarPage(),
    settingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.primary,
          selectedItemColor: AppColor.text,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Icon(
                    Icons.contact_support_outlined,
                    size: 30,
                    color: AppColor.secondary,
                  ),
                ),
                label: '오늘의 질문'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Icon(
                    Icons.perm_media_outlined,
                    size: 30,
                    color: AppColor.secondary,
                  ),
                ),
                label: '앨범'),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: Image.asset(
                        '/Users/parkjiwon/Desktop/soda/sodapj/assets/oo.png',
                        width: 28)),
                label: '홈'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Icon(
                    Icons.date_range_outlined,
                    size: 30,
                    color: AppColor.secondary,
                  ),
                ),
                label: '캘린더'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Icon(
                    Icons.settings_outlined,
                    size: 30,
                    color: AppColor.secondary,
                  ),
                ),
                label: '설정'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
