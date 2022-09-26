import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class PageOnboarding extends StatefulWidget {
  const PageOnboarding({super.key});

  @override
  State<PageOnboarding> createState() => _PageOnboardingState();
}

class _PageOnboardingState extends State<PageOnboarding> {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      contentMargin: EdgeInsets.zero,
      bodyPadding: EdgeInsets.fromLTRB(65, 50, 65, 0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    );

    return IntroductionScreen(
      isTopSafeArea: true,
      showNextButton: false,
      showDoneButton: false,
      showSkipButton: false,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: '',
          bodyWidget: const Text(
            '¡Contabilizá tus horas trabajadas en proyectos individuales o grupales!',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          image: SvgPicture.asset(
            'assets/images/onboarding_1.svg',
            height: 300.sp,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: '',
          bodyWidget: const Text(
            '¡Crea un proyecto e invitá a otros a participar!',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          image: SvgPicture.asset(
            'assets/images/onboarding_2.svg',
            height: 300.sp,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: '',
          bodyWidget: const Text(
            'Unite a un proyecto ya armado y conectate con los participantes',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          image: SvgPicture.asset(
            'assets/images/onboarding_3.svg',
            height: 300.sp,
          ),
          decoration: pageDecoration,
        ),
      ],
      dotsDecorator: DotsDecorator(
        size: Size.square(11.sp),
        activeColor: const Color(0xff303030),
        activeSize: Size.square(11.sp),
        color: const Color(0xff9F9F9F),
        spacing: EdgeInsets.all(2.5.sp),
      ),
      controlsPosition: Position(
        left: 0,
        right: 0,
        bottom: 345.sp,
      ),
    );
  }
}
