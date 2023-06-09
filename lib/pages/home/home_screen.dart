import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer/models/user_model.dart';
import 'package:customer/pages/search_screen.dart';
import 'package:customer/providers/auth_provider.dart';
import 'package:customer/providers/store_provide.dart';
import 'package:customer/theme.dart';
import 'package:customer/widgets/nearbyLaundry_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../models/store_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    StoreProvider storeProvider = Provider.of<StoreProvider>(context);
    storeProvider.getStore(user.token);
    Widget header() {
      return Padding(
        padding:
            const EdgeInsets.only(left: 40.0, right: 40, top: 30, bottom: 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Pagi!",
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    user.fullName,
                    style: headingTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    user.userPhoto,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget location() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SvgPicture.asset('assets/location_yellow.svg'),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lokasi Kamu",
                      style: whiteTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Jalan Ayani No 93, Pontianak",
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset('assets/arrow_down.svg')
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget banner() {
      return CarouselSlider(
        items: [
          Image.asset(
            'assets/banner1.png',
            width: double.infinity,
          ),
          Image.asset(
            'assets/banner2.png',
            width: double.infinity,
          ),
          Image.asset(
            'assets/banner3.png',
            width: double.infinity,
          ),
        ],
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          onPageChanged: ((index, reason) {
            setState(() {
              currentIndex = index;
            });
          }),
        ),
      );
    }

    Widget serviceMenu() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Layanan Laundry",
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen('biasa'),
                    ),
                  ),
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color(0xffF4E2EB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/regular.png',
                          width: 32,
                        ),
                        Text(
                          'Regular',
                          style: primaryTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFECBE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/regular_plus.png',
                        width: 32,
                      ),
                      Text(
                        'Regular+',
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xffDDE2FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/express.png',
                        width: 32,
                      ),
                      Text(
                        'Express',
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xffD2F4D5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/lainnya.png',
                        width: 32,
                      ),
                      Text(
                        'Lainnya',
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget nearbyLaundry() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24.0,
              left: 40,
              right: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Laundry Terbaik Terdekat",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "Lihat Semua",
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 243,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: storeProvider.store
                  .map(
                    (store) => NearbyLaundryCard(store),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          header(),
          location(),
          banner(),
          serviceMenu(),
          nearbyLaundry(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
