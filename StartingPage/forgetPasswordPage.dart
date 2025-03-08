/* Authored by: Patrick Kurt O. Villamer
Company: Lumora
Project: JobQuest
Feature: [STP-003] Forgot Password Page
Description: The forgot password page, that allows users to send code to change their password
*/

//packages needed for this part
import 'package:flutter/material.dart';
import 'package:jobquest/StartingPage/inputCode.dart';
import 'package:jobquest/widget/custome_scaffold.dart'; 
import 'package:icons_plus/icons_plus.dart';

// Define the Forgot Password page as a StatefulWidget  
// This allows the page to manage dynamic state changes
class Forgetpasswordpage extends StatefulWidget {
  @override
  _Forgotpasswordpage createState() => _Forgotpasswordpage();
}

//structure and logic of the forgot password page, with the email and send code
//send code is still not done, but the button is already there
class _Forgotpasswordpage extends State<Forgetpasswordpage> {

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Enter Email",
      overlayText: "Forgot Password", 
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
          Center(
            child: Text(
              "A verification code will be sent to your email",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,),
              )
          ),
          const SizedBox(height: 80),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                minimumSize: const Size(300, 40),
              ),
              onPressed: () {
                Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => InputCodePage()), // Navigate to InputCodePage
                );
              },
              child: const Text(
                "Send Code",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                    // Navigate to Sign-up Page
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
