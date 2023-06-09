import 'package:customer/models/store_model.dart';
import 'package:customer/pages/order_detail_screen.dart';
import 'package:customer/theme.dart';
import 'package:customer/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatefulWidget {
  final StoreModel storeModel;

  const OrderScreen(this.storeModel, {super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController _controllerBerat = TextEditingController();
  int indexTanggal = -1;
  List listJam = [
    "07:30",
    "08:00",
    "08:30",
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
    "13:00",
    "13:30",
    "14:00",
    "14:30",
    "15:00",
    "15:30",
    "16:00",
    "16:30",
    "17:00",
    "17:30",
  ];
  int indexJam = -1;
  late String tanggal;
  late String jam;
  @override
  void initState() {
    _controllerBerat.text = "1";

    super.initState();
  }

  @override
  void dispose() {
    _controllerBerat.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    Widget tanggalBox(value, index) {
      return GestureDetector(
        onTap: () => setState(() {
          indexTanggal = index;
          tanggal = DateFormat("yyyy-MM-dd").format(value);
        }),
        child: Container(
          width: 72,
          height: 52,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: index == indexTanggal ? primaryColor : secondaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat("dd MMM").format(value),
                style: index == indexTanggal
                    ? whiteTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: medium,
                      )
                    : primaryTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: medium,
                      ),
              ),
              Text(
                DateFormat("dd MMM").format(DateTime.now()) ==
                        DateFormat("dd MMM").format(value)
                    ? "Hari Ini"
                    : DateFormat("E").format(value),
                style: index == indexTanggal
                    ? whiteTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      )
                    : primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
              ),
            ],
          ),
        ),
      );
    }

    Widget tanggalAmbil() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              "Tanggal Ambil",
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(left: defaultMargin),
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  tanggalBox(DateTime.now().add(Duration(days: index)), index),
            ),
          )
        ],
      );
    }

    Widget jamAmbilBox(value, index) {
      return Container(
          width: 64,
          height: 25,
          decoration: BoxDecoration(
            color: index == indexJam ? primaryColor : secondaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              value,
              style: index == indexJam
                  ? whiteTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: medium,
                    )
                  : primaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: medium,
                    ),
            ),
          ));
    }

    Widget jamAmbil() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jam Ambil",
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: listJam
                  .map(
                    (e) => GestureDetector(
                      onTap: () => setState(() {
                        indexJam = listJam.indexOf(e);
                        jam = "$e";
                      }),
                      child: jamAmbilBox(e, listJam.indexOf(e)),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      );
    }

    Widget inputBeratCuci() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        width: 52,
        height: 34,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: TextField(
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            readOnly: true,
            controller: _controllerBerat,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff913175),
            ),
          ),
        ),
      );
    }

    Widget beratCuci() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Berat Cucian (Kg)",
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    if (int.parse(_controllerBerat.text) > 1) {
                      _controllerBerat.text =
                          (int.parse(_controllerBerat.text) - 1).toString();
                    }
                  }),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: whiteTextColor,
                      image: const DecorationImage(
                        image: AssetImage('assets/minus-btn.png'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                inputBeratCuci(),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    _controllerBerat.text =
                        (int.parse(_controllerBerat.text) + 1).toString();
                  }),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: whiteTextColor,
                      image: const DecorationImage(
                        image: AssetImage('assets/plus-btn.png'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Harga @Rp. ${widget.storeModel.service[0].price}",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget syaratKetentuan() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Syarat & Ketentuan",
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 16,
                  child: Text(
                    "1.",
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    "Berat laundry akan dihitung menggunakan timbangan digital yang terpasang di mesin cuci. Jika berat laundry melebihi batas yang ditentukan, maka laundry tidak akan dicuci.",
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 16,
                  child: Text(
                    "2.",
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    "Tempat laundry tidak bertanggung jawab atas kerusakan pada pakaian akibat faktor yang tidak terduga seperti kehilangan warna atau ukuran, bahan yang rusak, atau kesalahan penanganan oleh pelanggan.",
                    style: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget btnSelanjutnya() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetail(
                  widget.storeModel, jam, tanggal, _controllerBerat.text),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Center(
                child: Text(
                  "Lanjutkan",
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

    return Scaffold(
      body: ListView(
        children: [
          const Header(title: "Pesanan"),
          const SizedBox(
            height: 24,
          ),
          location(),
          const SizedBox(
            height: 24,
          ),
          tanggalAmbil(),
          const SizedBox(
            height: 24,
          ),
          jamAmbil(),
          const SizedBox(
            height: 24,
          ),
          beratCuci(),
          const SizedBox(
            height: 24,
          ),
          syaratKetentuan(),
          const SizedBox(
            height: 24,
          ),
          btnSelanjutnya(),
        ],
      ),
    );
  }
}
