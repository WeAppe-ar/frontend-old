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
  final PageController _pageController = PageController();
  int index = 0;
  final Map<int, String> map = {
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
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 130.sp,
                  ),
                  SizedBox(
                    height: 294.sp,
                    width: 337.sp,
                    child: SvgPicture.asset(
                      'assets/images/onboarding_1.svg',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 130.sp,
                  ),
                  SizedBox(
                    height: 295.sp,
                    width: 352.sp,
                    child: SvgPicture.asset(
                      'assets/images/onboarding_2.svg',
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 130.sp,
                  ),
                  SizedBox(
                    height: 298.sp,
                    width: 338.sp,
                    child: SvgPicture.asset(
                      'assets/images/onboarding_3.svg',
                    ),
                  ),
                ],
              ),
            ],
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
