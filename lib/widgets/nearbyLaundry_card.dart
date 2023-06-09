import 'package:customer/models/address_model.dart';
import 'package:customer/models/store_model.dart';
import 'package:customer/pages/detail_screen.dart';
import 'package:customer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NearbyLaundryCard extends StatelessWidget {
  final StoreModel storeModel;

  const NearbyLaundryCard(this.storeModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(storeModel),
        ),
      ),
      child: Container(
        width: 174,
        margin: const EdgeInsets.only(
          right: 12,
        ),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 6,
            left: 6,
            right: 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 162,
                height: 162,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(storeModel.storePhoto),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                storeModel.name,
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/ICStar.svg',
                    width: 8,
                  ),
                  SvgPicture.asset(
                    'assets/ICStar.svg',
                    width: 8,
                  ),
                  SvgPicture.asset(
                    'assets/ICStar.svg',
                    width: 8,
                  ),
                  SvgPicture.asset(
                    'assets/ICStar.svg',
                    width: 8,
                  ),
                  SvgPicture.asset(
                    'assets/ICStar.svg',
                    width: 8,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    '4.9',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 8,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/ICLocation.svg',
                    width: 8,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                    child: Text(
                      storeModel.address.addressDetails,
                      style: secondaryTextStyle.copyWith(
                        fontSize: 8,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
