import 'package:flutter/material.dart';
import 'signup_screen.dart';


class LoginScreen extends StatefulWidget {
 const LoginScreen({super.key});


 @override
 State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 final TextEditingController _emailController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();


 String _successMessage = '';


 bool _hideEmail = true;
 bool _hidePassword = true;


 @override
 void dispose() {
   _emailController.dispose();
   _passwordController.dispose();
   super.dispose();
 }


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 24.0),
         child: Center(
           child: SingleChildScrollView(
             child: Form(
               key: _formKey,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const SizedBox(height: 16),
                   Image.asset(
                     'assets/images/logo.png',
                     width: 140,
                     height: 140,
                     fit: BoxFit.contain,
                   ),
                   const SizedBox(height: 24),
                   const Text(
                     'Welcome Back',
                     style: TextStyle(
                       fontSize: 28,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   const SizedBox(height: 8),
                   const Text(
                     'Please Login to Continue',
                     style: TextStyle(color: Colors.grey),
                   ),
                   const SizedBox(height: 40),


                   if (_successMessage.isNotEmpty) ...[
                     Text(
                       _successMessage,
                       style: const TextStyle(
                         color: Colors.green,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     const SizedBox(height: 24),
                   ],


                   TextFormField(
                     controller: _emailController,
                     keyboardType: TextInputType.emailAddress,
                     obscureText: _hideEmail, // Controlled by toggle state
                     decoration: InputDecoration(
                       labelText: 'E-mail',
                       border: const OutlineInputBorder(),
                       prefixIcon: const Icon(Icons.email),
                       suffixIcon: IconButton(
                         icon: Icon(
                           _hideEmail
                               ? Icons.visibility_off
                               : Icons.visibility,
                         ),
                         onPressed: () {
                           setState(() {
                             _hideEmail =
                                 !_hideEmail; // Flips state and redraws UI
                           });
                         },
                       ),
                     ),
                     validator: (value) {
                       if (value == null || value.trim().isEmpty) {
                         return 'please enter your E-mail';
                       }
                       if (!value.contains('@') || !value.contains('.')) {
                         return 'please enter your email address e.g johndoe@gmail.com)';
                       }
                       return null;
                     },
                   ),
                   const SizedBox(height: 20),
                   TextFormField(
                     controller: _passwordController,
                     obscureText: _hidePassword, // Controlled by toggle state
                     decoration: InputDecoration(
                       labelText: 'password',
                       border: const OutlineInputBorder(),
                       prefixIcon: const Icon(Icons.lock),
                       suffixIcon: IconButton(
                         icon: Icon(
                           _hidePassword
                               ? Icons.visibility_off
                               : Icons.visibility,
                         ),
                         onPressed: () {
                           setState(() {
                             _hidePassword =
                                 !_hidePassword; // Flips state and redraws UI
                           });
                         },
                       ),
                     ),
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return 'please enter your password';
                       }
                       if (value.length < 6) {
                         return 'password must be >= 6 characters';
                       }
                       return null;
                     },
                   ),
                   const SizedBox(height: 32),
                   SizedBox(
                     width: double.infinity,
                     height: 50,
                     child: ElevatedButton(
                       onPressed: () {
                         if (_formKey.currentState!.validate()) {
                           setState(() {
                             _successMessage = 'Login Successful';
                           });
                         } else {
                           setState(() {
                             _successMessage = '';
                           });
                         }
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.deepPurple,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(8),
                         ),
                       ),
                       child: const Text(
                         'Login',
                         style: TextStyle(fontSize: 16, color: Colors.white),
                       ),
                     ),
                   ),
                   const SizedBox(height: 16),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Not yet Registered?"),
                       TextButton(
                         onPressed: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => SignupScreen(),
                             ),
                           );
                         },
                         child: Text("SignUp"),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),
       ),
     ),
   );
 }
}





