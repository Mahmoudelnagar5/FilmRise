import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marqueer/marqueer.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/custom_marquee_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff130F40),
              Color(0xff000000),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              // List of movies in marquee style
              CustomMarqueeWidget(
                direction: MarqueerDirection.rtl,
              ),

              CustomMarqueeWidget(
                direction: MarqueerDirection.ltr,
              ),

              CustomMarqueeWidget(
                direction: MarqueerDirection.rtl,
              ),
              FadeInLeft(
                duration: const Duration(milliseconds: 1500),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.amiri(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: Text(
                    "Watch everything you want\nfor free",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.amiri(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.homeView);
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Watch now",
                          textAlign: TextAlign.center,
                          style: AppStyles.styleMedium16.copyWith(
                              // color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                      width: size.width * 0.6,
                      child: Image.asset(
                        'assets/images/glowing_button.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
