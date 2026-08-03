import 'package:flutter/material.dart';
import 'login_screen.dart';


class SignupScreen extends StatefulWidget {
 const SignupScreen({super.key});


 @override
 State<StatefulWidget> createState() {
   return _SignupScreenState();
 }
}


class _SignupScreenState extends State<SignupScreen> {
 final _signupFormKey = GlobalKey<FormState>();
 final _firstNameController = TextEditingController();
 final _lastNameController = TextEditingController();
 final _emailController = TextEditingController();
 final _passwordController = TextEditingController();
 final _confirmPasswordController = TextEditingController();
 final bool _hidePassword = true;
 final bool _hideConfirmPassword = true;


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Sign Up')),
     body: SafeArea(
       child: SingleChildScrollView(
         padding: EdgeInsets.all(24),
         child: Form(
           key: _signupFormKey,
           child: Column(
                 children: [
                   const SizedBox(height: 16),
                   Image.asset(
                     'assets/images/logo.png',
                     width: 140,
                     height: 140,
                     fit: BoxFit.contain,
                   ),
               TextFormField(
                 controller: _firstNameController,
                 decoration: InputDecoration(
                   labelText: 'FirstName',
                   prefixIcon: Icon(Icons.person_2_outlined),
                   border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Enter first Name';
                   }
                   return null;
                 },
               ),


               SizedBox(height: 25),


               TextFormField(
                 controller: _lastNameController,
                 decoration: InputDecoration(
                   labelText: 'lastName',
                   prefixIcon: Icon(Icons.person_2_outlined),
                   border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Enter last name';
                   }
                   return null;
                 },
               ),


               SizedBox(height: 25),


               TextFormField(
                 controller: _emailController,
                 decoration: InputDecoration(
                   labelText: 'email',
                   prefixIcon: Icon(Icons.email_outlined),
                   border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Enter email';
                   }
                   return null;
                 },
               ),


               SizedBox(height: 25),
               TextFormField(
                 controller: _passwordController,
                 obscureText: _hidePassword,
                 decoration: InputDecoration(
                   labelText: 'Password',
                   prefixIcon: Icon(Icons.lock_outlined),
                   border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Enter password';
                   }
                   return null;
                 },
               ),


               SizedBox(height: 25),


               TextFormField(
                 controller: _confirmPasswordController,
                 obscureText: _hideConfirmPassword,
                 decoration: InputDecoration(
                   labelText: 'confirm Password',
                   prefixIcon: Icon(Icons.lock_outlined),
                   border: OutlineInputBorder(),
                 ),
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Confirm Password';
                   }
                   if (value != _passwordController.text) {
                     return "Passwords do not match";
                   }
                   return null;
                 },
               ),


               SizedBox(height: 25),


               ElevatedButton(
                 onPressed: () {
                   if (_signupFormKey.currentState!.validate()) {
                     //sign up
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => LoginScreen()),
                     );
                   }
                 },
                 style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.deepPurple,
                   minimumSize: const Size(300, 50),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(8),
                   ),
                 ),


                 child: Text("Sign Up", style: TextStyle(color: Colors.white)),
               ),


               SizedBox(height: 16),


               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Already have an account?"),


                   TextButton(
                     onPressed: () {
                       Navigator.pop(
                         context,
                         MaterialPageRoute(
                           builder: (context) => const LoginScreen(),
                         ),
                       );
                     },
                     child: Text("Login"),
                   ),
                 ],
               ),
             ],
           ),
         ),
       ),
     ),
   );
 }


 @override
 void dispose() {
   _firstNameController.dispose();
   _lastNameController.dispose();
   _emailController.dispose();
   _passwordController.dispose();
   _confirmPasswordController.dispose();
   super.dispose();
 }
}




