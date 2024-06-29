import 'package:allservice/res/constants/constants.dart';
import 'package:allservice/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final bool isLast;

  const OnboardingPageWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.isLast
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 300,
            child: SvgPicture.asset(
              imageUrl,
              alignment: AlignmentDirectional.center,
            ),
          ),
          const SizedBox(height: 80),
          Text(
            title,
            style: onboardingTitleTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            subtitle,
            style: onboardingSubtitleTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          if (isLast)
            ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).replace(const AuthorizationRoute());
              },
              style: const ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size.fromWidth(165))
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Начать'),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_ios, size: 18)
                ],
              )
            )
        ],
      ),
    );
  }
}