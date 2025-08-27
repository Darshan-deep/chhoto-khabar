// import 'dart:async';
// import 'package:chhoto_khabar/core/utils/snack_bars.dart';
// import 'package:chhoto_khabar/core/widgets/body_description_text.dart';
// import 'package:chhoto_khabar/core/widgets/input_field.dart';
// import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';

// import 'package:pinput/pinput.dart';
// import 'package:chhoto_khabar/l10n/app_localizations.dart';

// class PatientOtpScreen extends StatefulWidget {
//   const PatientOtpScreen({
//     super.key,

//     required this.nextRoute,
//   });


//   final String nextRoute;

//   @override
//   State<PatientOtpScreen> createState() => _PatientOtpScreenState();
// }

// class _PatientOtpScreenState extends State<PatientOtpScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _otpController = TextEditingController();
//     final _emailController = TextEditingController();

//   // Timer related variables
//   bool _isResendEnabled = false;
//   int _remainingSeconds = 60;
//   Timer? _resendTimer;

//   // Add these variables at the top of your state class
//   int _resendAttempts = 0;
//   static const int maxResendAttempts = 3;

//   @override
//   void initState() {
//     super.initState();
//     // Start timer as soon as page loads
//     _startResendTimer();
//   }

//   String? _validateOtp(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter the OTP';
//     }

//     if (value.length != 6) {
//       return 'OTP must be 6 digits';
//     }

//     return null;
//   }

//   // Start resend timer method
//   void _startResendTimer() {
//     if (_resendAttempts >= maxResendAttempts) {
//       SnackBars.showErrorSnackBar('Maximum resend attempts reached');
//       context.go('/register');
//       return;
//     }

//     setState(() {
//       _isResendEnabled = false;
//       _remainingSeconds = 60;
//       _resendAttempts++;
//     });

//     _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_remainingSeconds > 0) {
//           _remainingSeconds--;
//         } else {
//           _isResendEnabled = true;
//           timer.cancel();
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     final theme = Theme.of(context);
//     final size = MediaQuery.of(context).size;

//     // Create a beautiful pin theme
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: TextStyle(
//         fontSize: 22,
//         fontWeight: FontWeight.w600,
//         color: theme.colorScheme.onSurface,
//       ),
//       decoration: BoxDecoration(
//         color: theme.colorScheme.surface,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: theme.colorScheme.outline.withValues(alpha: .7),
//           width: 1,
//         ),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration!.copyWith(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: theme.colorScheme.primary,
//           width: 2,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: theme.colorScheme.primary.withValues(alpha: .1),
//             blurRadius: 8,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration!.copyWith(
//         color: theme.colorScheme.primary.withValues(alpha: .1),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: theme.colorScheme.primary.withValues(alpha: .5),
//           width: 1,
//         ),
//       ),
//     );

//     // Format phone number for display


//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         state.maybeWhen(
//           orElse: () {},
//           loading: () {},
//           otpVerifyFailed: (message) {
//             SnackBars.showErrorSnackBar(message);
//           },
//           otpVerified: (message, isSetup) {
//             SnackBars.showSuccessSnackBar(message);

//             if (!isSetup) {
//               context.go('/patient-personal-info');
//             } else {
//               context.go(widget.nextRoute);
//             }
//           },
//         );
//       },
//       child: Scaffold(
//         backgroundColor: theme.colorScheme.surface,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Back button
//                     Padding(
//                       padding: const EdgeInsets.only(top: 16.0),
//                       child: IconButton(
//                         onPressed: () => context.go('/login'),
//                         icon: Icon(
//                           Icons.arrow_back_ios_new_rounded,
//                           size: 20,
//                           color:
//                               theme.colorScheme.onSurface.withValues(alpha: .7),
//                         ),
//                         style: IconButton.styleFrom(
//                           backgroundColor: theme.colorScheme.surface,
//                           padding: const EdgeInsets.all(12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             side: BorderSide(
//                               color: theme.colorScheme.outline
//                                   .withValues(alpha: .1),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     // Logo and title
//                     Center(
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 24),
//                           Container(
//                             height: 80,
//                             width: 80,
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: theme.colorScheme.primary
//                                   .withValues(alpha: .08),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Image.asset(
//                               'assets/images/patient/sa.png',
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                           const SizedBox(height: 28),
//                           Text(
//                             'Verification Code',
//                             style: theme.textTheme.headlineSmall?.copyWith(
//                               fontWeight: FontWeight.w700,
//                               color: theme.colorScheme.onSurface,
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           SizedBox(
//                             width: size.width * 0.8,
//                             child: Text(
//                               'Weve sent a verification code to',
//                               textAlign: TextAlign.center,
//                               style: theme.textTheme.bodyMedium?.copyWith(
//                                 color: theme.colorScheme.onSurface
//                                     .withValues(alpha: .6),
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 8),
                        
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 28),
                    
//                     const SizedBox(height: 28),
//                     BodyDescriptionText(
//                       text: 'Email',
//                       fontWeight: FontWeight.w600,
//                     ),
//                     const SizedBox(height: 12),
//                     InputField(
//                       controller: _emailController,
//                       hintText: 'Enter your email',
//                       prefixIcon: Icon(
//                         Icons.email_outlined,
//                         color: theme.colorScheme.primary.withAlpha(180),
//                         size: 20,
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Email is required';
//                         }
//                         if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$')
//                             .hasMatch(value)) {
//                           return 'Enter a valid email';
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                     ),

//                     const SizedBox(height: 20),

//                     // OTP field
//                     Center(
                      
//                       child: Pinput(
//                         controller: _otpController,
//                         length: 6,
//                         validator: _validateOtp,
//                         defaultPinTheme: defaultPinTheme,
//                         focusedPinTheme: focusedPinTheme,
//                         submittedPinTheme: submittedPinTheme,
//                         pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                         showCursor: true,
//                         cursor: Container(
//                           height: 24,
//                           width: 1,
//                           margin: const EdgeInsets.only(top: 12),
//                           color: theme.colorScheme.primary,
//                         ),
//                         onCompleted: (pin) {
//                           if (_formKey.currentState!.validate()) {
//                             context.read<AuthBloc>().add(VerifyOtpEvent(
//                                   otp: pin,
//                                   email: _emailController.text,
//                                   isForgot: false,
//                                 ));
//                           }
//                         },
//                         autofillHints: const [
//                           AutofillHints.oneTimeCode,
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 8),

//                     // Error message
//                     Center(
//                       child: BlocBuilder<AuthBloc, AuthState>(
//                         builder: (context, state) {
//                           return state.maybeWhen(
//                             otpVerifyFailed: (message) => Padding(
//                               padding: const EdgeInsets.only(top: 8.0),
//                               child: Text(
//                                 message,
//                                 style: TextStyle(
//                                   color: theme.colorScheme.error,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ),
//                             orElse: () => const SizedBox(),
//                           );
//                         },
//                       ),
//                     ),

//                     const SizedBox(height: 32),

//                     // Verify button
//                     BlocBuilder<AuthBloc, AuthState>(
//                       builder: (context, state) {
//                         final isLoading = state.maybeWhen(
//                           loading: () => true,
//                           orElse: () => false,
//                         );

//                         return SizedBox(
//                           width: double.infinity,
//                           height: 55,
//                           child: ElevatedButton(
//                             onPressed: isLoading
//                                 ? null
//                                 : () {
//                                     if (_formKey.currentState!.validate() &&
//                                         _otpController.text.length == 6) {
//                                       context
//                                           .read<AuthBloc>()
//                                           .add(VerifyOtpEvent(
//                                             otp: _otpController.text,
//                                             email: _emailController.text,
//                                             isLogin: widget.nextRoute ==
//                                                 '/login',
//                                           ));
//                                     } else {
//                                       SnackBars.showErrorSnackBar(
//                                           'Please enter a valid 6-digit OTP');
//                                     }
//                                   },
//                             child: isLoading
//                                 ? SizedBox(
//                                     height: 24,
//                                     width: 24,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2.5,
//                                       color: theme.colorScheme.onPrimary,
//                                     ),
//                                   )
//                                 : Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const Icon(Iconsax.code,
//                                           color: Colors.white, size: 18),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                         l10n.verifyCode,
//                                       ),
//                                     ],
//                                   ),
//                           ),
//                         );
//                       },
//                     ),

//                     const SizedBox(height: 24),

//                     // Center(
//                     //   child: Column(
//                     //     children: [
//                     //       Text(
//                     //         'Didnt receive the code?',
//                     //         style: theme.textTheme.bodyMedium?.copyWith(
//                     //           color: theme.colorScheme.onSurface
//                     //               .withValues(alpha: .6),
//                     //         ),
//                     //       ),
//                     //       const SizedBox(height: 8),
//                     //       TextButton(
//                     //         onPressed: _isResendEnabled &&
//                     //                 _resendAttempts < maxResendAttempts
//                     //             ? () {
//                     //                 widget.nextRoute == "/patient-home"
//                     //                     ? context
//                     //                         .read<AuthBloc>()
//                     //                         .add(ResendOtpEvent(
//                     //                           phone: widget.mobileNumber,
//                     //                           isForgot: false,
//                     //                         ))
//                     //                     : context.read<AuthBloc>().add(
//                     //                         RegisterEvent(
//                     //                             phoneNumber:
//                     //                                 widget.mobileNumber));
//                     //                 _startResendTimer();
//                     //               }
//                     //             : null,
//                     //         child: Row(
//                     //           mainAxisSize: MainAxisSize.min,
//                     //           children: [
//                     //             Icon(
//                     //               Icons.refresh_rounded,
//                     //               size: 16,
//                     //               color: _isResendEnabled
//                     //                   ? theme.colorScheme.primary
//                     //                   : theme.colorScheme.onSurface
//                     //                       .withValues(alpha: .4),
//                     //             ),
//                     //             const SizedBox(width: 6),
//                     //             Text(
//                     //               _isResendEnabled
//                     //                   ? "Resend Code"
//                     //                   : "Resend in ${_remainingSeconds}s",
//                     //               style: theme.textTheme.bodyMedium?.copyWith(
//                     //                 fontWeight: FontWeight.w600,
//                     //                 color: _isResendEnabled
//                     //                     ? theme.colorScheme.primary
//                     //                     : theme.colorScheme.onSurface
//                     //                         .withValues(alpha: .4),
//                     //               ),
//                     //             ),
//                     //           ],
//                     //         ),
//                     //       ),
//                     //       if (_resendAttempts > 0)
//                     //         Padding(
//                     //           padding: const EdgeInsets.only(top: 4.0),
//                     //           child: Text(
//                     //             "$_resendAttempts of $maxResendAttempts attempts used",
//                     //             style: theme.textTheme.bodySmall?.copyWith(
//                     //               color: _resendAttempts >= maxResendAttempts
//                     //                   ? theme.colorScheme.error
//                     //                   : theme.colorScheme.onSurface
//                     //                       .withValues(alpha: .5),
//                     //               fontSize: 12,
//                     //             ),
//                     //           ),
//                     //         ),
//                     //     ],
//                     //   ),
//                     // ),

//                     const SizedBox(height: 32),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _otpController.dispose();
//     _resendTimer?.cancel();
//     super.dispose();
//   }
// }
