import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.black26,
          ),
          border: InputBorder.none,
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
