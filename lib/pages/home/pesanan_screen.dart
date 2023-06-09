import 'package:customer/models/user_model.dart';
import 'package:customer/pages/detail_history_screen.dart';
import 'package:customer/providers/auth_provider.dart';
import 'package:customer/providers/history_provider.dart';
import 'package:customer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({super.key});

  @override
  State<PesananScreen> createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    HistoryProvider historyProvider = Provider.of<HistoryProvider>(context);
    historyProvider.getHistoryById(
      user.token,
      user.idUser,
    );
    String capitalize(String str) => str[0].toUpperCase() + str.substring(1);
    Widget header() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          "Daftar Pesanan",
          style: headingTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget search() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF9F9F9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: borderColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 8,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/ICSearch.svg",
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: "Nama Toko Laundry",
                            hintStyle: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              "assets/ICFilter.svg",
            ),
          ],
        ),
      );
    }

    Widget historyBox(history) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailHistoryScreen(
                  history,
                );
              },
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: const Color(0xffF4E2EB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/history_done.svg"),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                history.storeModel.name,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semiBold,
                                ),
                              ),
                              Text(
                                DateFormat('EEEE, dd MMM yyyy / hh:mm')
                                    .format(history.pickUp),
                                style: primaryTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: medium,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff913175),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1, horizontal: 4),
                          child: Text(
                            capitalize(history.status.last),
                            style: whiteTextStyle.copyWith(
                              fontSize: 8,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: history.status
                        .map<Widget>(
                          (status) => Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: status == history.status.last
                                        ? fourthColor
                                        : thirdColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Text(
                                      (history.status.indexOf(status) + 1)
                                          .toString(),
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 8,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  capitalize(status),
                                  style: status == history.status.last
                                      ? fourthTextStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: semiBold,
                                        )
                                      : primaryTextStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: semiBold,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(),
        const SizedBox(
          height: 30,
        ),
        search(),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: historyProvider.history
                .map((history) => historyBox(history))
                .toList(),
          ),
        ),
      ],
    );
  }
}
