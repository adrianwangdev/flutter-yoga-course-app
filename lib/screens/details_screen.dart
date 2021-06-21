import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_yoga_course_app/widgets/bottom_navbar.dart';
import 'package:flutter_yoga_course_app/widgets/search_bar.dart';
import '/constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: blueLightColor,
              image: DecorationImage(
                alignment: Alignment.centerRight,
                image: AssetImage('assets/images/meditation_bg.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * .05),
                    Text(
                      'Meditaion',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 4),
                      child: Text(
                        '3-10 Min Course',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .6,
                      child: Text(
                        'Live happier and healthier by learning the fundmentals of meditation and mindfulness',
                        style: TextStyle(height: 1.4),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: SearchBar(),
                    ),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        SessionCard(
                          sessionNumber: 1,
                          isDone: true,
                          press: () {},
                        ),
                        SessionCard(sessionNumber: 2, press: () {}),
                        SessionCard(sessionNumber: 3, press: () {}),
                        SessionCard(sessionNumber: 4, press: () {}),
                        SessionCard(sessionNumber: 5, press: () {}),
                        SessionCard(sessionNumber: 6, press: () {}),
                      ],
                    ),
                    SizedBox(height: 32),
                    Text(
                      'Meditation',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 12),
                            blurRadius: 16,
                            spreadRadius: -4,
                            color: shadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/icons/Meditation_women_small.svg'),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Basic 2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(180, 0, 0, 0),
                                  ),
                                ),
                                Text(
                                  'Start your deepen you practice',
                                  style: TextStyle(
                                    color: Color.fromARGB(180, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: SvgPicture.asset('assets/icons/Lock.svg'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNumber;
  final bool isDone;
  final Function press;
  const SessionCard({
    Key? key,
    required this.sessionNumber,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        width: (constraint.maxWidth / 2) - 8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 12),
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
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: isDone ? Colors.white : blueColor,
                      shape: BoxShape.circle,
                      border: isDone ? Border.all(color: blueColor) : null,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: isDone ? blueColor : Colors.white,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Session ${sessionNumber.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
