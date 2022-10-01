import 'package:appsize/appsize.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weappear_ui/weappear_ui.dart';

class PageOnboarding extends StatefulWidget {
  const PageOnboarding({super.key});

  @override
  State<PageOnboarding> createState() => _PageOnboardingState();
}

class _PageOnboardingState extends State<PageOnboarding> {
  int index = 0;

  final PageController _pageController = PageController();

  final map = <int, String>{
    0: '¡Contabilizá tus horas trabajadas en proyectos individuales o grupales!',
    1: '¡Crea un proyecto e invitá a otros a participar!',
    2: 'Unite a un proyecto ya armado y conectate con los participantes',
  };

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        index = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children:
                Iterable<int>.generate(3).map(OnboardingImage.new).toList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 68.sp, horizontal: 38.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DotsIndicator(
                  dotsCount: 3,
                  position: index.toDouble(),
                  decorator: DotsDecorator(
                    size: Size.square(11.sp),
                    activeColor: const Color(0xff303030),
                    activeSize: Size.square(11.sp),
                    color: const Color(0xff9F9F9F),
                    spacing: EdgeInsets.all(2.5.sp),
                  ),
                ),
                SizedBox(
                  height: 50.sp,
                ),
                SizedBox(
                  width: 262.sp,
                  height: 57.sp,
                  child: Text(
                    map[index]!,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 110.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WeappearMaterialButton(
                      height: 44.sp,
                      minWidth: 149.sp,
                      elevation: 0,
                      color: Colors.white,
                      fontColor: WeappearColors.blueActivated,
                      onPressed: () {
                        _pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.ease,
                        );
                      },
                      title: 'Omitir',
                    ),
                    WeappearMaterialButton(
                      height: 44.sp,
                      minWidth: 149.sp,
                      elevation: 0,
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.ease,
                        );
                      },
                      title: 'Siguiente',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingImage extends StatelessWidget {
  const OnboardingImage(
    this.index, {
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 130.sp),
      height: 298.sp,
      width: 338.sp,
      child: SvgPicture.asset(
        'assets/images/onboarding_$index.svg',
      ),
    );
  }
}
