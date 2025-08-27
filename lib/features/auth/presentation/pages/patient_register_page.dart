// import 'package:chhoto_khabar/core/utils/snack_bars.dart';
// import 'package:chhoto_khabar/core/widgets/body_description_text.dart';
// import 'package:chhoto_khabar/core/widgets/input_field.dart';
// import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';

// import 'package:chhoto_khabar/l10n/app_localizations.dart';

// class PatientRegisterPage extends StatefulWidget {
//   const PatientRegisterPage({super.key});
//   @override
//   PatientRegisterPageState createState() => PatientRegisterPageState();
// }

// class PatientRegisterPageState extends State<PatientRegisterPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   Map<String, List<String>> _fieldErrors = {};
//   bool _showError = false;
//   bool _isPasswordVisible = false;

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   String? _validateEmail(String? value) {
//     if (!_showError) return null;

//     if (_fieldErrors["email"] != null) {
//       return _fieldErrors["email"]?.join(', ');
//     }

//     if (value == null || value.isEmpty) {
//       return 'Email is required';
//     }

//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegex.hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }

//     return null;
//   }

//   String? _validatePassword(String? value) {
//     if (!_showError) return null;

//     if (_fieldErrors["password"] != null) {
//       return _fieldErrors["password"]?.join(', ');
//     }

//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }

//     if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }

//     return null;
//   }

//   String? _validateName(String? value, String fieldName, String displayName) {
//     if (!_showError) return null;

//     if (_fieldErrors[fieldName] != null) {
//       return _fieldErrors[fieldName]?.join(', ');
//     }

//     if (value == null || value.isEmpty) {
//       return '$displayName is required';
//     }

//     if (value.length < 2) {
//       return '$displayName must be at least 2 characters';
//     }

//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     final theme = Theme.of(context);
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: theme.colorScheme.surface,
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           state.maybeWhen(
//             success: (message, _) {
//               context.push('/'); 
//               SnackBars.showSuccessSnackBar(message);
//             },
//             validationError: (validationErrors) {
//               _fieldErrors =
//                   validationErrors != null ? validationErrors.errors : {};
//               setState(() {});
//             },
//             failure: (exception) {
//               SnackBars.showErrorSnackBar(exception.message);
//             },
//             orElse: () {},
//           );
//         },
//         child: SafeArea(
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Form(
//                 key: _formKey,
//                 autovalidateMode: AutovalidateMode.disabled,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Back Button
//                     Padding(
//                       padding: const EdgeInsets.only(top: 16.0),
//                       child: IconButton(
//                         onPressed: () => context.go('/login'),
//                         icon: Icon(
//                           Icons.arrow_back_ios_new_rounded,
//                           size: 20,
//                           color: theme.colorScheme.onSurface.withValues(alpha:0.7),
//                         ),
//                         style: IconButton.styleFrom(
//                           backgroundColor: theme.colorScheme.surface,
//                           padding: const EdgeInsets.all(12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             side: BorderSide(
//                               color: theme.colorScheme.outline.withValues(alpha:0.1),
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
//                               color:
//                                   theme.colorScheme.primary.withValues(alpha:0.08),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Image.asset(
//                               'assets/images/patient/sa.png',
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                           const SizedBox(height: 28),
//                           Text(
//                             'Create Your Account',
//                             style: theme.textTheme.headlineSmall?.copyWith(
//                               fontWeight: FontWeight.w700,
//                               color: theme.colorScheme.onSurface,
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           SizedBox(
//                             width: size.width * 0.8,
//                             child: Text(
//                               'Join our platform and start connecting with healthcare professionals',
//                               textAlign: TextAlign.center,
//                               style: theme.textTheme.bodySmall?.copyWith(
//                                 color: theme.colorScheme.onSurface
//                                     .withValues(alpha:0.6),
//                                 fontWeight: FontWeight.w400,
//                                 height: 1.5,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 32),

//                     // First Name field
//                     BodyDescriptionText(
//                       text: 'First Name',
//                       fontWeight: FontWeight.w600,
//                     ),
//                     const SizedBox(height: 12),
//                     Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: theme.colorScheme.primary.withValues(alpha:0.05),
//                             blurRadius: 20,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: InputField(
//                         controller: _firstNameController,
//                         hintText: 'Enter your first name',
//                         isPassword: false,
//                         keyboardType: TextInputType.name,
//                         prefixIcon: Icon(
//                           Icons.person_outline_rounded,
//                           color: theme.colorScheme.primary.withValues(alpha:0.7),
//                           size: 20,
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             _fieldErrors.remove("firstName");
//                             _showError = false;
//                           });
//                           if (_formKey.currentState != null) {
//                             _formKey.currentState!.validate();
//                           }
//                         },
//                         inputFormatters: [
//                           FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
//                         ],
//                         validator: (value) => _validateName(value, "firstName", "First name"),
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     // Last Name field
//                     BodyDescriptionText(
//                       text: 'Last Name',
//                       fontWeight: FontWeight.w600,
//                     ),
//                     const SizedBox(height: 12),
//                     Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: theme.colorScheme.primary.withValues(alpha:0.05),
//                             blurRadius: 20,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: InputField(
//                         controller: _lastNameController,
//                         hintText: 'Enter your last name',
//                         isPassword: false,
//                         keyboardType: TextInputType.name,
//                         prefixIcon: Icon(
//                           Icons.person_outline_rounded,
//                           color: theme.colorScheme.primary.withValues(alpha:0.7),
//                           size: 20,
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             _fieldErrors.remove("lastName");
//                             _showError = false;
//                           });
//                           if (_formKey.currentState != null) {
//                             _formKey.currentState!.validate();
//                           }
//                         },
//                         inputFormatters: [
//                           FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
//                         ],
//                         validator: (value) => _validateName(value, "lastName", "Last name"),
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     // Email field
//                     BodyDescriptionText(
//                       text: 'Email Address',
//                       fontWeight: FontWeight.w600,
//                     ),
//                     const SizedBox(height: 12),
//                     Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: theme.colorScheme.primary.withValues(alpha:0.05),
//                             blurRadius: 20,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: InputField(
//                         controller: _emailController,
//                         hintText: 'Enter your email address',
//                         isPassword: false,
//                         keyboardType: TextInputType.emailAddress,
//                         prefixIcon: Icon(
//                           Icons.email_outlined,
//                           color: theme.colorScheme.primary.withValues(alpha:0.7),
//                           size: 20,
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             _fieldErrors.remove("email");
//                             _showError = false;
//                           });
//                           if (_formKey.currentState != null) {
//                             _formKey.currentState!.validate();
//                           }
//                         },
//                         validator: _validateEmail,
//                       ),
//                     ),

//                     const SizedBox(height: 20),

//                     // Password field
//                     BodyDescriptionText(
//                       text: 'Password',
//                       fontWeight: FontWeight.w600,
//                     ),
//                     const SizedBox(height: 12),
//                     Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: theme.colorScheme.primary.withValues(alpha:0.05),
//                             blurRadius: 20,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: InputField(
//                         controller: _passwordController,
//                         hintText: 'Create a strong password',
//                         isPassword: true,
//                         isPasswordVisible: _isPasswordVisible,
//                         onTogglePasswordVisibility: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                         keyboardType: TextInputType.visiblePassword,
//                         prefixIcon: Icon(
//                           Icons.lock_outline_rounded,
//                           color: theme.colorScheme.primary.withValues(alpha:0.7),
//                           size: 20,
//                         ),
//                         onChanged: (value) {
//                           setState(() {
//                             _fieldErrors.remove("password");
//                             _showError = false;
//                           });
//                           if (_formKey.currentState != null) {
//                             _formKey.currentState!.validate();
//                           }
//                         },
//                         validator: _validatePassword,
//                       ),
//                     ),

//                     const SizedBox(height: 32),

//                     // Register button
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
//                                     FocusScope.of(context).unfocus();

//                                     setState(() {
//                                       _showError = true;
//                                     });

//                                     if (_formKey.currentState!.validate()) {
//                                       context.read<AuthBloc>().add(
//                                             AuthEvent.register(
//                                               firstName: _firstNameController.text,
//                                               lastName: _lastNameController.text,
//                                               email: _emailController.text,
//                                               password: _passwordController.text,
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
//                                       const Icon(Icons.person_add_rounded,
//                                           color: Colors.white, size: 18),
//                                       const SizedBox(width: 10),
//                                       const Text('Create Account'),
//                                     ],
//                                   ),
//                           ),
//                         );
//                       },
//                     ),

//                     const SizedBox(height: 24),

//                     // Already have an account
//                     Center(
//                       child: TextButton(
//                         onPressed: () => context.push('/login'),
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: 'Already have an account? ',
//                                 style: theme.textTheme.bodyMedium?.copyWith(
//                                   color: theme.colorScheme.onSurface
//                                       .withValues(alpha:0.7),
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: 'Log In',
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
                    
//                     const SizedBox(height: 24),
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