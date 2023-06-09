import 'package:customer/models/history_model.dart';
import 'package:customer/theme.dart';
import 'package:customer/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DetailHistoryScreen extends StatefulWidget {
  final HistoryModel historyModel;
  const DetailHistoryScreen(this.historyModel, {super.key});

  @override
  State<DetailHistoryScreen> createState() => _DetailHistoryScreenState();
}

class _DetailHistoryScreenState extends State<DetailHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    String capitalize(String str) => str[0].toUpperCase() + str.substring(1);
    Widget historyBox(history) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nomor Transaksi: ",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: medium,
                                  ),
                                ),
                                Text(
                                  history.id,
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ],
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
      );
    }

    Widget status(history) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Perkiraan Selesai',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(
              DateFormat('EEEE, dd MMM yyyy').format(history.pickUp
                  .add(Duration(days: history.storeModel.service[0].estimate))),
              style: headingTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      );
    }

    Widget locationBox() {
      return Container(
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
                  Text(
                    "Jalan Ayani No 93, Pontianak",
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget location() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alamat",
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            locationBox(),
          ],
        ),
      );
    }

    Widget rincianTransaksi(history) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rincian Transaksi",
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
                Text(
                  "Laundry ${history.detailTransaksi.weight} Kg",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "Rp. ${history.detailTransaksi.subtotal}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ongkir",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "Rp ${history.detailTransaksi.shippingFee}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Potongan Promo Toko",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "-Rp. ${history.detailTransaksi.discountPiece}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Potongan Ongkir",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "-Rp. ${history.detailTransaksi.discountShippingFee}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffBEA1B6),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Bayar",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "Rp. ${history.detailTransaksi.grandTotal}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget buttonBantuan() {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor, width: 1.5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                'Bantuan',
                style: headingTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonDownload() {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: primaryColor, width: 1.5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                'Download',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget buttonGroup() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(children: [
            buttonBantuan(),
            const SizedBox(
              width: 16,
            ),
            buttonDownload(),
          ]),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Header(title: widget.historyModel.storeModel.name),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    historyBox(widget.historyModel),
                    const SizedBox(
                      height: 24,
                    ),
                    status(widget.historyModel),
                    const SizedBox(
                      height: 24,
                    ),
                    location(),
                    const SizedBox(
                      height: 24,
                    ),
                    rincianTransaksi(widget.historyModel),
                  ],
                ),
              ),
              buttonGroup(),
            ],
          ),
        ));
  }
}
