import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: 'Title of first page',
            body:
                'Here you can write the description of the page, to explain something...',
            image: Center(child: Image.asset('image/first.png', height: 175.0)),
            decoration: getPageDecoration()),
        PageViewModel(
            title: 'Title of second page',
            body:
                'Here you can write the description of the page, to explain something...',
            image:
                Center(child: Image.asset('image/second.png', height: 175.0)),
            decoration: getPageDecoration()),
        PageViewModel(
            title: 'Title of third page',
            body:
                'Here you can write the description of the page, to explain something...',
            image: Center(child: Image.asset('image/third.png', height: 175.0)),
            decoration: getPageDecoration()),
      ],
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () {
        Navigator.of(context).pop();
      },
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator:
        DotsDecorator(
          color: Colors.black26, 
          activeSize: const Size(22, 10),
          activeColor: Colors.black,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        curve: Curves.bounceOut,
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 20),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );
  }
}
