import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  bool moveUp = false;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    // Delay for 2 seconds before moving image and making container visible
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        moveUp = true;
        isVisible = true; // Make the container visible
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          // Logo animation at the top
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            top: moveUp ? 100 : MediaQuery.of(context).size.height / 2 - 110,
            child: Center(
              child: Image.asset('assets/images/patient/sa.png', width: 120),
            ),
          ),

          // Content animation in the middle

          //sizedbox le warp garda ni options chai hai
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: moveUp ? MediaQuery.of(context).size.height / 4 - 10 : -20,
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: isVisible ? 1.0 : 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        'Welcome Back',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Create your profile and start connecting with patients today',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      const SizedBox(height: 20),
                      SvgPicture.asset(
                        'assets/images/patient/onbording1.svg',
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Button at the bottom
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: moveUp ? 30 : -100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SafeArea(
                child: ElevatedButton(
                  onPressed: () => context.go('/onboarding'),
                  child: const Text('Get Started'),
                ),
              ),
            ),
          ),
        ]));
  }
}
