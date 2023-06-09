import 'package:customer/models/user_model.dart';
import 'package:customer/providers/auth_provider.dart';
import 'package:customer/providers/promo_provider.dart';
import 'package:customer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({super.key});

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    PromoProvider promoProvider = Provider.of<PromoProvider>(context);
    promoProvider.getPromo(user.token);
    Widget promoBox(promo) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: backgroundColor2,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, bottom: 8, left: 16, right: 16),
                child: Text(
                  promo.promoName,
                  style: headingTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xffB0C0FF),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 16, left: 16, right: 16),
                child: Text(
                  promo.description,
                  style: headingTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xffB0C0FF),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 16, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quota : ${promo.availableQuota}",
                      style: headingTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: medium,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context, {
                        'numberOfPieces': promo.numberOfPieces,
                        'maxPieces': promo.maxPieces,
                      }),
                      child: Container(
                        width: 68,
                        height: 22,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            "Pakai",
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget header(title) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context, {
                'numberOfPieces': 0,
                'maxPieces': 0,
              }),
              child: Container(
                width: 53,
                height: 53,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: SvgPicture.asset('assets/arrow_left.svg'),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                title,
                style: headingTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header("Promo buat Kamu"),
          const SizedBox(
            height: 24,
          ),
          Column(
            children:
                promoProvider.promo.map((promo) => promoBox(promo)).toList(),
          ),
        ],
      ),
    );
  }
}
