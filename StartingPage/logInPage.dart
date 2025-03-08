/* Authored by: Patrick Kurt O. Villamer
Company: Lumora
Project: JobQuest
Feature: [STP-002] Log In Page
Description: Log-In Page for our app, 
w/ features in typing email, password, and other log-in methods, and forgot password
*/

//packages needed for this app
import 'package:flutter/material.dart';
import 'package:jobquest/StartingPage/forgetPasswordPage.dart';
import 'package:jobquest/StartingPage/signUpPage.dart';
import 'package:jobquest/features/homePage.dart';
import 'package:jobquest/widget/custome_scaffold.dart'; //a basic scafold used for this design
import 'package:icons_plus/icons_plus.dart'; //for the google and facebook icons

// Define the log In Page page as a StatefulWidget  
// This allows the page to manage dynamic state changes
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

//main widget that has the email, password, other log-in methods, and forgot password
class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true; // Controls password visibility

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Enter Log In Details",
      overlayText: "Welcome back to JobQuest", 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text("Username or Email"),
          const SizedBox(height: 3),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              hintText: "Enter your email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.lightBlue[100],
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          const Text("Password"),
          const SizedBox(height: 3),
          TextFormField(
            obscureText: _isObscure, // Uses _isObscure
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure; // Toggle visibility
                  });
                },
                icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
              ),
              hintText: "Enter password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.lightBlue[100],
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Invalid Password';
              }
              return null;
            },
          ),
          const SizedBox(height: 80),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                minimumSize: const Size(300, 40),
              ),
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => HomePage()), //navigate to home page after log-in button is pressed
                );
              },
              child: const Text(
                "Log In",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Forgetpasswordpage()), //redirect to forgot password page
                        );
              },
              child: const Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: Column(
              children: [
                const Text(
                  "or log in with",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Google login logic
                      },
                      icon: Logo(Logos.google, size: 30),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        // Facebook login logic
                      },
                      icon: Logo(Logos.facebook_logo, size: 30),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => SignUpPage()), // Navigate to InputCodePage
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Sign-up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
