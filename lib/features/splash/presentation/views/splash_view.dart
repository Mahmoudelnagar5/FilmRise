import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/FilmRise.gif'),
        ),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 6),
      () {
        GoRouter.of(context).push(AppRouter.onboardingView);
      },
    );
  }
}
