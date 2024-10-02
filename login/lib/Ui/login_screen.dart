import 'package:firebaseapp/services/login_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = Authentication();
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    auth();
  }

  Future auth() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isloading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final borderRadius = screenHeight * 0.03;
    final buttonHeight = screenHeight * 0.07;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 243, 239),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.04, horizontal: screenWidth * 0.08),
          child: Center(
            child: SingleChildScrollView(
              child: _isloading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Sign in',
                          style: GoogleFonts.dmSans(
                              fontSize: screenWidth * 0.088,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(17, 24, 39, 1)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        ElevatedButton.icon(
                          icon: Image.asset('assets/google_icon.png',
                              height: screenWidth * 0.05,
                              width: screenWidth * 0.05),
                          label: Text(
                            'Continue with Google',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(26, 28, 30, 1),
                                fontSize: 20),
                          ),
                          onPressed: () {
                            _auth.signup(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 240, 243, 239),
                            foregroundColor: Colors.black,
                            side: const BorderSide(color: Colors.grey),
                            minimumSize: Size(double.infinity, buttonHeight),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                  thickness: screenWidth *
                                      0.005), // Adjust thickness as needed
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.01),
                              child: Text('Or login with',
                                  style: GoogleFonts.dmSans(
                                      color: const Color.fromRGBO(
                                          108, 114, 120, 1),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                            ),
                            Expanded(
                              child: Divider(
                                  thickness: screenWidth *
                                      0.005), // Adjust thickness and color as needed
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          'Enter your email and password to log in',
                          style: GoogleFonts.dmSans(
                              fontSize: 16,
                              color: const Color.fromRGBO(17, 24, 39, 1),
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(borderRadius),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(borderRadius),
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: const Color.fromRGBO(26, 28, 30, 0.7),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {},
                              child: Text('Forgot Password ?',
                                  style: GoogleFonts.dmSans(
                                      color:
                                          const Color.fromRGBO(77, 129, 231, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(29, 97, 231, 1),
                            minimumSize: Size(double.infinity, buttonHeight),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  borderRadius), // Make it circular
                            ),
                          ),
                          child: Text(
                            'Log In',
                            style: GoogleFonts.dmSans(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account?",
                                style: GoogleFonts.dmSans(
                                    color:
                                        const Color.fromRGBO(108, 114, 120, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.dmSans(
                                  color: const Color.fromRGBO(77, 129, 231, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
