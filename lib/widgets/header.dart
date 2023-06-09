import 'package:customer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatefulWidget {
  final String title;
  const Header({Key? key, required this.title}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
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
              widget.title,
              style: headingTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
