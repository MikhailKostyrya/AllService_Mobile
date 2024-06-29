import 'package:allservice/features/onboarding/ui/widgets/onboarding_page_widget.dart';
import 'package:allservice/res/constants/constants.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView(
            controller: _pageController,
            children: const [
              OnboardingPageWidget(
                title: 'Удобство записи', 
                subtitle: 'Упростите свою жизнь,\nзаписавшись на услуги\nиз любого места', 
                imageUrl: 'assets/images/onboarding/onboarding1.svg', 
                isLast: false
              ),
              OnboardingPageWidget(
                title: 'Управление\n записями на ходу', 
                subtitle: 'Теперь запись на услуги\nзанимает всего несколько\nнажатий', 
                imageUrl: 'assets/images/onboarding/onboarding2.svg', 
                isLast: false
              ),
              OnboardingPageWidget(
                title: 'Оставайтесь в курсе', 
                subtitle: 'Следите за статусом ваших\nзаписей в режиме реального\nвремени', 
                imageUrl: 'assets/images/onboarding/onboarding3.svg', 
                isLast: true
              ),
            ],
          ),
          Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: kPrimaryColor,
                    dotColor: Colors.black,
                    dotHeight: 4,
                    dotWidth: 16,
                    spacing: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}