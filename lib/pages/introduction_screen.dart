import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int currentIndex = 0;
  List imagesUrl = [
    {
      "imageUrl": 'assets/introduction1.svg',
      "title": "Penjadwalan",
      "description":
          "Dengan adanya fitur penjadwalan maka cucian Kamu akan diambil sesuai dengan jadwal yang sudah ditentukan sebelumnya"
    },
    {
      "imageUrl": 'assets/introduction2.svg',
      "title": "Cari Lokasi",
      "description":
          "Bisa cari lokasi laundry yang terdekat dengan lokasi Kamu serta memilih lokasi tersebut"
    },
    {
      "imageUrl": 'assets/introduction3.svg',
      "title": "Filtering",
      "description":
          "Cari harga yang sesuai dengan isi dompet Kamu serta juga bisa filter sesuai ratting tiap tempat"
    },
  ];

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 36 : 15,
        height: 15,
        margin: EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: currentIndex == index ? primaryColor : secondaryColor,
        ),
      );
    }

    Widget slider(List images) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CarouselSlider(
          items: images
              .map(
                (e) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      e['imageUrl'],
                      height: 300,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      e['title'],
                      textAlign: TextAlign.center,
                      style: headingTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        e['description'],
                        textAlign: TextAlign.center,
                        style: primaryTextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            viewportFraction: 1,
            height: MediaQuery.of(context).size.height,
            initialPage: 0,
            enableInfiniteScroll: false,
            onPageChanged: ((index, reason) {
              setState(() {
                currentIndex = index;
              });
            }),
          ),
        ),
      );
    }

    Widget footer() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70,
            child: currentIndex == 2
                ? null
                : TextButton(
                    onPressed: () {
                      buttonCarouselController.animateToPage(2,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.linear);
                    },
                    child: Text(
                      "Skip",
                      style: headingTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesUrl.map((e) {
              int index = imagesUrl.indexOf(e);
              return indicator(index);
            }).toList(),
          ),
          TextButton(
            onPressed: () {
              if (currentIndex < imagesUrl.length - 1) {
                setState(() {
                  currentIndex++;
                  buttonCarouselController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                });
              } else {
                Navigator.pushNamed(context, '/login');
              }
              // Navigator.pushNamed(context, '/sign-in');
            },
            child: SvgPicture.asset('assets/arrow_right.svg'),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Column(
        children: [
          Expanded(child: slider(imagesUrl)),
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
            child: footer(),
          ),
        ],
      ),
    );
  }
}
