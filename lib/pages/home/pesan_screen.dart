import 'package:flutter/material.dart';

import '../../theme.dart';

class PesanScreen extends StatefulWidget {
  const PesanScreen({super.key});

  @override
  State<PesanScreen> createState() => _PesanScreenState();
}

class _PesanScreenState extends State<PesanScreen> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          "Pesan",
          style: headingTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget chatItem() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/profile.png",
              width: 40,
              height: 40,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Budi Anto",
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                      Text(
                        "01/03/2023",
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Kamu punya pesan",
                          style: primaryTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: fourthColor,
                        ),
                        child: Center(
                          child: Text(
                            '2',
                            style: whiteTextStyle.copyWith(
                              fontSize: 8,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Color(0xffFBEEF5),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget chatList() {
      return ListView(
        shrinkWrap: true,
        children: [
          chatItem(),
          chatItem(),
          chatItem(),
          chatItem(),
          chatItem(),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(),
        const SizedBox(
          height: 9,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: chatList(),
        )),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
