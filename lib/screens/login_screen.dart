import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // Simulate a login process
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pop(true);
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful')),
            );
          });
          return const Center(child: CircularProgressIndicator());
        },
      );
    }
  }

  // String? _validateUsername(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your username';
  //   }
  //   if (value.length < 3) {
  //     return 'Username must be at least 3 characters long';
  //   }
  //   return null;
  // }

  // String? _validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your password';
  //   }
  //   if (value.length < 6) {
  //     return 'Password must be at least 6 characters long';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/loginscreen_bg.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 70),
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32.0),
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                        style: const TextStyle(
                          color:
                              Colors.white, // Add the desired text color here
                        ),
                        //validator: _validateUsername,
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,

                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        style: const TextStyle(
                          color:
                              Colors.white, // Add the desired text color here
                        ),
                        //validator: _validatePassword,
                      ),
                      const SizedBox(height: 16.0),
                      //TODO add remember me
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () => _submitForm(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.withOpacity(
                              0.7), // Adjust the opacity value as needed
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      const Text(
                        '------------- OR -------------',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40.0),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle continue with Google
                        },
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Image.asset(
                            'assets/images/google.png',
                            height:
                                20.0, // Adjust the height as needed https://flutter.github.io/assets-for-api-docs/assets/material/Colors.lightBlue.png
                          ),
                        ),
                        label: Text(
                          'Continue with Google',
                          style: TextStyle(color: Colors.lightBlue[600]),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white
                              .withOpacity(0.9), // Google button color
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle continue with Email
                        },
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Image.asset(
                            'assets/images/gmail.png',
                            height: 20.0, // Adjust the height as needed
                          ),
                        ),
                        label: Text(
                          'Continue with Email',
                          style: TextStyle(color: Colors.red[300]),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white
                              .withOpacity(0.9), // Email button color
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          // Navigate to the registration screen
                        },
                        child: const Text(
                          'Don\'t have an account? Register',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
