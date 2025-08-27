// import 'package:chhoto_khabar/core/utils/snack_bars.dart';
// import 'package:chhoto_khabar/core/widgets/body_description_text.dart';
// import 'package:chhoto_khabar/core/widgets/input_field.dart';
// import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
// import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';


// class PatientForgotPasswordPage extends StatefulWidget {
//   const PatientForgotPasswordPage({super.key,this.email});

//   final String? email;

//   @override
//   State<PatientForgotPasswordPage> createState() =>
//       _PatientForgotPasswordPageState();
// }

// class _PatientForgotPasswordPageState extends State<PatientForgotPasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _mobileController = TextEditingController();

//   @override
//   void dispose() {
//     _mobileController.dispose();
//     super.dispose();
//   }
//   @override
//   void initState() {
//     super.initState();
//     _mobileController.text = widget.email ?? '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final theme = Theme.of(context);

//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         state.maybeWhen(
//           orElse: () {},
//           failure: (exception) =>
//               SnackBars.showErrorSnackBar(exception.message),
//           otpForgotResendSuccess: (message) {
//             SnackBars.showSuccessSnackBar(message);
//             context.push(
//               '/patient-new-password',
//               extra: {
//                 'phone': _mobileController.text,
//               },
//             );
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
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Back button
//                     Padding(
//                       padding: const EdgeInsets.only(top: 4.0),
//                       child: IconButton(
//                         onPressed: () => context.pop(),
//                         icon: Icon(
//                           Icons.arrow_back_ios_new_rounded,
//                           size: 18,
//                           color: theme.colorScheme.onSurface
//                               .withValues(alpha: 0.7),
//                         ),
//                         style: IconButton.styleFrom(
//                           backgroundColor: theme.colorScheme.surface,
//                           padding: const EdgeInsets.all(12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             side: BorderSide(
//                               color: theme.colorScheme.outline
//                                   .withValues(alpha: 0.1),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),

//                     // Header section
//                     Center(
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 80,
//                             width: 80,
//                             padding: const EdgeInsets.all(20),
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [
//                                   theme.colorScheme.primary
//                                       .withValues(alpha: 0.1),
//                                   theme.colorScheme.primary
//                                       .withValues(alpha: 0.05),
//                                 ],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                               borderRadius: BorderRadius.circular(24),
//                               border: Border.all(
//                                 color: theme.colorScheme.primary
//                                     .withValues(alpha: 0.1),
//                                 width: 1,
//                               ),
//                             ),
//                             child: Icon(
//                               Iconsax.key,
//                               size: 30,
//                               color: theme.colorScheme.primary,
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           Text(
//                             'Forgot Password?',
//                             style: theme.textTheme.headlineSmall?.copyWith(
//                               fontWeight: FontWeight.w700,
//                               color: theme.colorScheme.onSurface,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 16),

//                     // Info card
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: Colors.blue.shade50,
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: Colors.blue.shade200,
//                           width: 1,
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.info_outline_rounded,
//                             size: 20,
//                             color: Colors.blue.shade600,
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: Text(
//                               'We\'ll send a verification code to your phone number',
//                               style: theme.textTheme.bodySmall?.copyWith(
//                                 color: Colors.blue.shade700,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 12),

//                     // Phone number field
//                     BodyDescriptionText(
//                       text: 'Phone Number',
//                       fontWeight: FontWeight.w600,
//                       color: theme.colorScheme.onSurface,
//                     ),

//                     const SizedBox(height: 14),
//                     Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: theme.colorScheme.primary
//                                 .withValues(alpha: 0.05),
//                             blurRadius: 20,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: InputField(
//                         controller: _mobileController,
//                         hintText: 'Enter your phone number',
//                         isPassword: false,
//                         prefixText: '+977-',
//                         prefixIcon: Icon(
//                           Icons.phone_android_rounded,
//                           color:
//                               theme.colorScheme.primary.withValues(alpha: 0.7),
//                           size: 20,
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Phone number is required';
//                           }
//                           if (value.length < 10) {
//                             return 'Phone number must be at least 10 digits';
//                           }
//                           if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
//                             return 'Please enter a valid phone number';
//                           }
//                           return null;
//                         },
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                           LengthLimitingTextInputFormatter(10),
//                         ],
//                         keyboardType: TextInputType.phone,
//                       ),
//                     ),

//                     const SizedBox(height: 22),

//                     // Send code button
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
//                                     if (_formKey.currentState!.validate()) {
//                                       context.read<AuthBloc>().add(
//                                             AuthEvent.forgotPassword(
//                                               phone: _mobileController.text,
//                                             ),
//                                           );
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
//                                       Icon(
//                                         Iconsax.sms,
//                                         size: 18,
//                                         color: theme.colorScheme.onPrimary,
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                         'Send Verification Code',
//                                       ),
//                                     ],
//                                   ),
//                           ),
//                         );
//                       },
//                     ),

//                     const SizedBox(height: 24),

//                     // Back to login link
//                     Center(
//                       child: TextButton(
//                         onPressed: () => context.go('/login'),
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'Remember your password? ',
//                                 style: theme.textTheme.bodyMedium?.copyWith(
//                                   color: theme.colorScheme.onSurface
//                                       .withValues(alpha: 0.7),
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'Sign In',
//                                 style: theme.textTheme.bodyMedium?.copyWith(
//                                   color: theme.colorScheme.primary,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

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
// }
