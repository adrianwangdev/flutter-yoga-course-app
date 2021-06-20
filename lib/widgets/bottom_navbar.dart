import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/constants.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      height: 72,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavItem(
            title: 'Today',
            icon: 'assets/icons/calendar.svg',
            press: () {},
          ),
          BottomNavItem(
            title: 'Exercises',
            icon: 'assets/icons/gym.svg',
            isActive: true,
            press: () {},
          ),
          BottomNavItem(
            title: 'Settings',
            icon: 'assets/icons/Settings.svg',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function press;
  final bool isActive;
  const BottomNavItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            icon,
            color: isActive ? activeIconColor : textColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? activeIconColor : textColor),
          ),
        ],
      ),
    );
  }
}
