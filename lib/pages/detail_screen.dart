import 'package:customer/models/store_model.dart';
import 'package:customer/models/user_model.dart';
import 'package:customer/pages/order_screen.dart';
import 'package:customer/providers/auth_provider.dart';
import 'package:customer/providers/review_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  final StoreModel storeModel;
  const DetailScreen(this.storeModel, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ReviewProvider reviewProvider = Provider.of<ReviewProvider>(context);
    reviewProvider.getReviewByStoreId(user.token, widget.storeModel.id);
    Widget detail() {
      return SizedBox(
        width: MediaQuery.of(context).size.width - 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail ${widget.storeModel.name}",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.storeModel.description,
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget reviewItem(review) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(54),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(
                          "http://localhost:3000/${review.user.userPhoto}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      review.user.fullName,
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/ICStar.svg',
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          review.rating.toString(),
                          style: primaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: regular),
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('dd MMMM yyyy').format(review.createdAt),
                      style: primaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: regular),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              review.description,
              style:
                  primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: Column(children: [
                            Container(
                              width: 65,
                              height: 4,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Reviews',
                              style: primaryTextStyle.copyWith(
                                fontSize: 22,
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/ICStar.svg',
                                  width: 28,
                                  height: 28,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  reviewProvider.review.avgReviews.toString(),
                                  style: blackTextStyle.copyWith(
                                    fontWeight: semiBold,
                                    fontSize: 34,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "dari total ",
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: regular,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  reviewProvider.review.detailReviewModel.length
                                      .toString(),
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: semiBold,
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Text(
                                  " reviews",
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: regular,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              thickness: 1,
                              color: Color(0xffF4E2EB),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: reviewProvider
                                    .review.detailReviewModel
                                    .map((e) => reviewItem(e))
                                    .toList(),
                              ),
                            )
                          ]),
                        ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 80,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primaryColor),
                ),
                child: Text(
                  "Reviews",
                  textAlign: TextAlign.center,
                  style: priceTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderScreen(widget.storeModel),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: MediaQuery.of(context).size.width - 80,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Pesan Sekarang",
                  textAlign: TextAlign.center,
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget header() {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          // clipBehavior: Clip.none,
          // alignment: Alignment.center,
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 392,
                      decoration: BoxDecoration(
                        // color: Colors.black.withOpacity(0.2),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2), BlendMode.srcOver),
                          image: NetworkImage(
                            widget.storeModel.storePhoto,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                        left: 20,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset('assets/arrow_left.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 10,
                              blurRadius: 70,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            widget.storeModel.name,
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 28,
                                              fontWeight: semiBold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/ICStar.svg',
                                          width: 12,
                                          height: 12,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SvgPicture.asset(
                                          'assets/ICStar.svg',
                                          width: 12,
                                          height: 12,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SvgPicture.asset(
                                          'assets/ICStar.svg',
                                          width: 12,
                                          height: 12,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SvgPicture.asset(
                                          'assets/ICStar.svg',
                                          width: 12,
                                          height: 12,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SvgPicture.asset(
                                          'assets/ICStar.svg',
                                          width: 12,
                                          height: 12,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "(540 Reviews)",
                                          style: secondaryTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: regular,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/ICDollar.svg',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${widget.storeModel.service[0].price.toString()} per Kg",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: regular,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/ICLocation.svg',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.storeModel.address
                                                .addressDetails,
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: regular,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/ICClock.svg',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "${widget.storeModel.operational.open} AM - ${widget.storeModel.operational.close} PM",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: regular,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      detail(),
                      footer(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: header(),
    );
  }
}
