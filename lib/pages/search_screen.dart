import 'package:customer/models/user_model.dart';
import 'package:customer/pages/detail_screen.dart';
import 'package:customer/providers/auth_provider.dart';
import 'package:customer/providers/store_provide.dart';
import 'package:customer/theme.dart';
import 'package:customer/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  final String category;
  const SearchScreen(this.category, {super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    StoreProvider storeProvider = Provider.of<StoreProvider>(context);
    storeProvider.getStoreByService(user.token, widget.category);
    Widget boxStore(store) {
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(store),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: defaultMargin, right: defaultMargin, bottom: 12),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 75,
                        height: 82,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(store.storePhoto),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 76,
                        left: 20,
                        child: Align(
                          child: Container(
                            width: 36,
                            height: 12,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Center(
                              child: Text(
                                "0.5 Km",
                                style: whiteTextStyle.copyWith(
                                  fontSize: 8,
                                  fontWeight: regular,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.name,
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/ICStar.svg",
                            width: 8,
                            height: 8,
                          ),
                          SvgPicture.asset(
                            "assets/ICStar.svg",
                            width: 8,
                            height: 8,
                          ),
                          SvgPicture.asset(
                            "assets/ICStar.svg",
                            width: 8,
                            height: 8,
                          ),
                          SvgPicture.asset(
                            "assets/ICStar.svg",
                            width: 8,
                            height: 8,
                          ),
                          SvgPicture.asset(
                            "assets/ICStar.svg",
                            width: 8,
                            height: 8,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "(213)",
                            style: secondaryTextStyle.copyWith(
                              fontSize: 8,
                              fontWeight: regular,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/ICDollar.svg",
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Rp. ${store.service[0].price} per Kg",
                            style: primaryTextStyle.copyWith(
                              fontSize: 8,
                              fontWeight: regular,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/ICLocation.svg",
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            store.address.addressDetails,
                            style: primaryTextStyle.copyWith(
                              fontSize: 8,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget box() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor2,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 75,
                      height: 82,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage("assets/dummy1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 76,
                      left: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text(
                            "0.5 Km",
                            style: whiteTextStyle.copyWith(
                              fontSize: 8,
                              fontWeight: regular,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "OnClean Laundry",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/ICStar.svg",
                          width: 8,
                          height: 8,
                        ),
                        SvgPicture.asset(
                          "assets/ICStar.svg",
                          width: 8,
                          height: 8,
                        ),
                        SvgPicture.asset(
                          "assets/ICStar.svg",
                          width: 8,
                          height: 8,
                        ),
                        SvgPicture.asset(
                          "assets/ICStar.svg",
                          width: 8,
                          height: 8,
                        ),
                        SvgPicture.asset(
                          "assets/ICStar.svg",
                          width: 8,
                          height: 8,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "(213)",
                          style: secondaryTextStyle.copyWith(
                            fontSize: 8,
                            fontWeight: regular,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/ICDollar.svg",
                          width: 14,
                          height: 14,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "Rp. 10.000 per Kg",
                          style: primaryTextStyle.copyWith(
                            fontSize: 8,
                            fontWeight: regular,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/ICLocation.svg",
                          width: 14,
                          height: 14,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Jl. Cikutra No. 123",
                          style: primaryTextStyle.copyWith(
                            fontSize: 8,
                            fontWeight: regular,
                          ),
                        ),
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

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(title: "Hasil Pencarian"),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: Column(
                children: storeProvider.store
                    .map(
                      (store) => boxStore(store),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
