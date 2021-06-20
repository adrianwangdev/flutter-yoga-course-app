import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/constants.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final Function press;
  const CategoryCard({
    Key? key,
    required this.title,
    required this.image,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 16),
            blurRadius: 16,
            spreadRadius: -4,
            color: shadowColor,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => press(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Spacer(),
                SvgPicture.asset(image),
                Spacer(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
