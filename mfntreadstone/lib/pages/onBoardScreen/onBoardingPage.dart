import 'package:flutter/material.dart';
import 'package:mfntreadstone/pages/authentication/homePage.dart';
import 'package:mfntreadstone/pages/groups/create_join_menu.dart';
import 'package:mfntreadstone/pages/onBoardScreen/introPages/introPage1.dart';
import 'package:mfntreadstone/pages/onBoardScreen/introPages/introPage2.dart';
import 'package:mfntreadstone/pages/onBoardScreen/introPages/introPage3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingpage extends StatefulWidget {
  const Onboardingpage({super.key});

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {

  final PageController _controller = PageController();

  // keep track which page we are in
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              Intropage1(),
              Intropage2(),
              Intropage3(),
            ],
          ),

          //dot indicators
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text('skip'),
                  ),

                //Dot Indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                //next or Done
                onLastPage
                ?GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) {
                          return CreateJoinMenu();
                        },
                      ),
                    );
                  },

                  child: const Text('done'),
                  )
                  :GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  },

                  child: const Text('next'),
                  ),
              ],
            ))
        ],
      )
    );
  }
}