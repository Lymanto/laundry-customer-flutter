import 'package:customer/pages/home/home_screen.dart';
import 'package:customer/pages/home/pesan_screen.dart';
import 'package:customer/pages/home/pesanan_screen.dart';
import 'package:customer/pages/home/profile_screen.dart';
import 'package:customer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  Widget customBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      backgroundColor: backgroundColor2,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(
              top: 12,
              // bottom: 12,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/ICHome.svg',
                  width: 24,
                  color: currentIndex == 0 ? primaryColor : thirdColor,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Home',
                  style: currentIndex == 0
                      ? headingTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        )
                      : primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                )
              ],
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(
              top: 12,
              // bottom: 12,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/ICPesanan.svg',
                  width: 24,
                  color: currentIndex == 1 ? primaryColor : thirdColor,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Pesanan',
                  style: currentIndex == 1
                      ? headingTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        )
                      : primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                )
              ],
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(
              top: 12,
              // bottom: 12,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/ICPesan.svg',
                  width: 24,
                  color: currentIndex == 2 ? primaryColor : thirdColor,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Pesan',
                  style: currentIndex == 2
                      ? headingTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        )
                      : primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                )
              ],
            ),
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(
              top: 12,
              // bottom: 12,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/ICProfile.svg',
                  width: 24,
                  color: currentIndex == 3 ? primaryColor : thirdColor,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Profile',
                  style: currentIndex == 3
                      ? headingTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        )
                      : primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                )
              ],
            ),
          ),
          label: "",
        ),
      ],
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const PesananScreen();
      case 2:
        return const PesanScreen();
      case 3:
        return const ProfileScreen();

      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: backgroundColor1,
      bottomNavigationBar: customBottomNavBar(),
      body: SafeArea(
        child: body(),
      ),
    );
  }
}
