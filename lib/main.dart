import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_yoga_course_app/screens/details_screen.dart';
import '/constants.dart';
import 'widgets/bottom_navbar.dart';
import 'widgets/category_card.dart';
import 'widgets/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: backgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEBB),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  ),
                  Text(
                    'Good Morning \nShishir',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      // fontFamily: 'Cairo',
                    ),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        CategoryCard(
                          title: 'Diet Recommendation',
                          image: 'assets/icons/Hamburger.svg',
                          press: () {},
                        ),
                        CategoryCard(
                          title: 'Kegel Exercises',
                          image: 'assets/icons/Excrecises.svg',
                          press: () {},
                        ),
                        CategoryCard(
                          title: 'Meditation',
                          image: 'assets/icons/Meditation.svg',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: 'Yoga',
                          image: 'assets/icons/yoga.svg',
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
