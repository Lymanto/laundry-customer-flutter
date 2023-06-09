import 'package:customer/models/store_model.dart';
import 'package:customer/models/user_model.dart';
import 'package:customer/pages/promo_screen.dart';
import 'package:customer/providers/auth_provider.dart';
import 'package:customer/providers/checkout_provider.dart';
import 'package:customer/theme.dart';
import 'package:customer/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderDetail extends StatefulWidget {
  StoreModel storeModel;
  String jam;
  String tanggal;
  String berat;
  OrderDetail(this.storeModel, this.jam, this.tanggal, this.berat, {super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  String? _payment;
  int maxPieces = 0;
  int numberOfPieces = 0;
  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const PromoScreen()),
    );
    setState(() {
      numberOfPieces = result['numberOfPieces'];

      maxPieces = result['maxPieces'];
    });
  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    String pickUp = "${widget.tanggal} ${widget.jam}:00";
    int grandTotal =
        widget.storeModel.service[0].price * int.parse(widget.berat) +
            3000 -
            maxPieces;
    handleCheckout() async {
      if (await checkoutProvider.checkout(
          _payment,
          pickUp,
          widget.storeModel.id,
          user.idUser,
          grandTotal,
          int.parse(widget.berat),
          widget.storeModel.service[0].price * int.parse(widget.berat),
          user.token,
          maxPieces)) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/success", (route) => false);
      }
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
      );
    }

    Widget location() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alamat Pengambilan",
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

    Widget btnKonfirmasi() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: GestureDetector(
          onTap: handleCheckout,
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Center(
                child: Text(
                  "Konfirmasi Pembayaran",
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget detailPesanan() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 4,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Tanggal Ambil :",
                          style: primaryTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          DateFormat("E, dd MMM yyyy")
                              .format(DateTime.parse(widget.tanggal)),
                          style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Jam Ambil :",
                          style: primaryTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.jam,
                          style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          "Berat Cucian :",
                          style: primaryTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${widget.berat} Kg",
                          style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xffBEA1B6),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, right: 16, left: 16, bottom: 16),
                child: Text(
                  "*Pastikan kamu ada dirumah ketika sudah mendekati waktu yang telah kamu pilih, terima kasih!",
                  style: primaryTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: medium,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget btnPromo() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: GestureDetector(
          onTap: () {
            _navigateAndDisplaySelection(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/ICDiscount.svg',
                        width: 36,
                        height: 36,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Pasang promo dulu, yul!",
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/arrow_right_white.svg'),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget rincianTransaksi() {
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
                  "Laundry ${widget.berat} Kg",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  "Rp. ${widget.storeModel.service[0].price * int.parse(widget.berat)}",
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
                  "Rp. 3.000",
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
                  "-Rp. $maxPieces",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                )
              ],
            ),
            // const SizedBox(
            //   height: 4,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Potongan Ongkir",
            //       style: primaryTextStyle.copyWith(
            //         fontSize: 14,
            //         fontWeight: semiBold,
            //       ),
            //     ),
            //     Text(
            //       "-Rp. 5.000",
            //       style: primaryTextStyle.copyWith(
            //         fontSize: 14,
            //         fontWeight: semiBold,
            //       ),
            //     )
            //   ],
            // ),
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
                  "Rp. $grandTotal",
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

    Widget metodePembayaran() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Metode Pembayaran",
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
                Row(
                  children: [
                    Image.asset(
                      "assets/gopay.png",
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Gopay",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                Radio<String>(
                  value: 'gopay',
                  groupValue: _payment,
                  onChanged: (String? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                )
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffE1E1E1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/dana.png",
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Dana",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                Radio<String>(
                  value: "dana",
                  groupValue: _payment,
                  onChanged: (String? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          const Header(title: "Detail Pesanan"),
          const SizedBox(
            height: 24,
          ),
          location(),
          const SizedBox(
            height: 24,
          ),
          detailPesanan(),
          const SizedBox(
            height: 24,
          ),
          btnPromo(),
          const SizedBox(
            height: 24,
          ),
          rincianTransaksi(),
          const SizedBox(
            height: 24,
          ),
          metodePembayaran(),
          const SizedBox(
            height: 24,
          ),
          btnKonfirmasi(),
        ],
      ),
    );
    ;
  }
}
