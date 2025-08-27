// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:chhoto_khabar/core/config/dependency_injection/di_config.dart';
// import 'package:chhoto_khabar/core/config/onboarding/data/datasource/onboard_datasource.dart';
// import 'package:chhoto_khabar/core/config/onboarding/data/repositories/onboarding_repo_impl.dart';
// import 'package:chhoto_khabar/core/config/onboarding/domain/repositories/onboarding_repository.dart';
// import 'package:chhoto_khabar/core/utils/aspect_ratio_helper.dart';
// import 'package:chhoto_khabar/shared/data/local/storage_service.dart';
// import 'package:chhoto_khabar/shared/user/data/datasource/local/user_local_datasource.dart';
// import 'package:chhoto_khabar/shared/user/data/reposiitories/user_repositories_impl.dart';
// import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:go_router/go_router.dart';


// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   final UserRepository userRepo = UserRepositoryImpl(sl<UserLocalDataSource>());
//   final OnboardingRepository onboardingRepo =
//       OnboardingRepositoryImpl(sl<OnboardDatasource>());
//   bool _isNavigating = false;

//   // Flag to track first launch
//   static const String _firstLaunchKey = 'app_first_launch_after_install';

//   @override
//   void initState() {
//     super.initState();
//     // Start auth check immediately but with minimum display time
//     _checkFirstLaunchAndNavigate();
//   }

//   Future<void> _checkFirstLaunchAndNavigate() async {
//     if (_isNavigating) return;
//     _isNavigating = true;

//     debugPrint("Starting splash screen navigation flow");

//     // Start timing - ensure minimum display time
//     final startTime = DateTime.now();

//     // Check if this is first launch after installation
//     // by trying to read a flag that should be cleared on uninstall
//     final StorageService storageService = sl<StorageService>();
//     final isFirstLaunch = !(await storageService.has(_firstLaunchKey));

//     debugPrint("Is first launch after install? $isFirstLaunch");

//     if (isFirstLaunch) {
//       // On first launch after install, clear any potentially persisted data
//       // This handles cases where storage wasn't fully cleared on uninstall
//       await userRepo.deleteUser();
//       await storageService.clear();
//       await storageService.set(_firstLaunchKey, 'launched');

//       // Always show onboarding on fresh install
//       // Wait for minimum display time
//       final elapsedMs = DateTime.now().difference(startTime).inMilliseconds;
//       final minDisplayTimeMs = 2000; // Slightly longer for first launch

//       if (elapsedMs < minDisplayTimeMs) {
//         await Future.delayed(
//             Duration(milliseconds: minDisplayTimeMs - elapsedMs));
//       }

//       if (!mounted) return;

//       // Set onboarding status and go to onboarding
//       await onboardingRepo.setOnboardStatus();
//       debugPrint("Navigating to onboarding after fresh install");
//       GoRouter.of(context).go('/splash-onboard');
//       return;
//     }

//     // Normal flow for subsequent launches
//     // Get user and onboarding status
//     final user = await userRepo.getUser();
//     final isOnBoard = await onboardingRepo.isOnboard();

//     if (!mounted) return;

//     // Calculate elapsed time and delay if needed for smooth transition
//     final elapsedMs = DateTime.now().difference(startTime).inMilliseconds;
//     final minDisplayTimeMs = 1500; // 1.5 seconds minimum display

//     if (elapsedMs < minDisplayTimeMs) {
//       debugPrint(
//           "Waiting additional ${minDisplayTimeMs - elapsedMs}ms for display");
//       await Future.delayed(
//           Duration(milliseconds: minDisplayTimeMs - elapsedMs));
//     }

//     // Navigate based on user state
//     user.fold(
//       (error) {
//         debugPrint("Error fetching user data: ${error.message}");
//         userRepo.deleteUser();
//         debugPrint("Navigating to login due to user data error");
//         GoRouter.of(context).go('/login');
//       },
//       (user) {
//         if (user.id != null && user.id!.isNotEmpty) {
//             debugPrint("User verified, going to home");
//             GoRouter.of(context).go('/home');
//             return;
          

          
//         } else {
//           debugPrint("No user ID found");
//           userRepo.deleteUser();

//           isOnBoard.fold(
//             (error) {
//               debugPrint("Error checking onboard status: ${error.message}");
//               GoRouter.of(context).go('/splash-onboard');
//             },
//             (isOnBoard) async {
//               if (isOnBoard) {
//                 debugPrint("Already onboarded, going to login");
//                 GoRouter.of(context).go('/login');
//               } else {
//                 debugPrint("Setting onboard status and going to onboarding");
//                 await onboardingRepo.setOnboardStatus();
//                 GoRouter.of(context).go('/splash-onboard');
//               }
//             },
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isTab = Responsive.isTablet(context);
//     final primaryColor = Theme.of(context).primaryColor;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           // Background decoration
//           Positioned(
//             top: -100,
//             right: -100,
//             child: Container(
//               width: 300,
//               height: 300,
//               decoration: BoxDecoration(
//                 color: primaryColor.withValues(alpha:0.05),
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: -120,
//             left: -50,
//             child: Container(
//               width: 250,
//               height: 250,
//               decoration: BoxDecoration(
//                 color: primaryColor.withValues(alpha:0.07),
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),

//           // Main content
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Logo with animation
//                 AspectRatio(
//                   aspectRatio: isTab ? 16 : 4,
//                   child: Image.asset(
//                     "assets/images/mainLogo.png",
//                   )
//                       .animate()
//                       .fadeIn(
//                         duration: 600.ms,
//                         curve: Curves.easeOutCubic,
//                       )
//                       .scale(
//                         begin: const Offset(0.9, 0.9),
//                         end: const Offset(1.0, 1.0),
//                         duration: 600.ms,
//                         curve: Curves.easeOutCubic,
//                       ),
//                 ),

//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     for (int i = 0; i < 3; i++)
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 4),
//                         child: Container(
//                           height: 8,
//                           width: 8,
//                           decoration: BoxDecoration(
//                             color: primaryColor,
//                             shape: BoxShape.circle,
//                           ),
//                         )
//                             .animate(
//                               onPlay: (controller) => controller.repeat(),
//                             )
//                             .fadeIn(duration: 300.ms, delay: 300.ms)
//                             .then()
//                             .fadeOut(delay: (i * 200).ms, duration: 600.ms)
//                             .then()
//                             .fadeIn(duration: 400.ms),
//                       ),
//                   ],
//                 ).animate().fadeIn(delay: 300.ms, duration: 400.ms),
//               ],
//             ),
//           ),

//           // Transparent AppBar
//           AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             automaticallyImplyLeading: false,
//           ),
//         ],
//       ),
//     );
//   }
// }
