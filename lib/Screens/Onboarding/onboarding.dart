import 'package:adhd/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  final List<OnBoardModel> onBoardData = [
    const OnBoardModel(
      title: "about this app",
      description: "",
      imgUrl: "assets/images/ADHD-en-voeding-v4 1.png",
    ),
    const OnBoardModel(
      title: "about this app",
      description: "",
      imgUrl:
          'assets/images/bigstock-little-child-boy-drawing-by-pe-85373729 1onboarding.png',
    ),
    const OnBoardModel(
      title: "about this app",
      description: "",
      imgUrl: 'assets/images/TM-Blog-ADHD 1.png',
    ),
  ];
    void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: OnBoard(
        titleStyles: TextStyle(fontFamily: Constants.FONT_FAMILY_NAME) ,
        onBoardData: onBoardData,

        pageController: _pageController,
        // pageIndicatorStyle: PageIndicatorStyle(
        //   activeColor: Constants.MAIN_COLOR,
        //   inactiveColor: Constants.MAIN_COLOR,
        //   // width: 150,

        // ),
           pageIndicatorStyle:  PageIndicatorStyle(
          width: 150,
          inactiveColor: Constants.MAIN_COLOR,
          activeColor: Constants.MAIN_COLOR,
          inactiveSize: const Size(8, 8),
          activeSize: const Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        // onSkip: () {
        //   print('skipped');
        // },
        skipButton: SizedBox(height: 0,width: 0,),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Constants.MAIN_COLOR,
                ),
                child: Text(
                  state.isLastPage ? "Done" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
