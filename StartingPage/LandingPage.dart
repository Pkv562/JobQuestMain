/* Authored by: Patrick Kurt O. Villamer
Company: Lumora
Project: JobQuest
Feature: [STP-001] Landing Page
Description: Landing Page for our app, with option w/ log-in or sign-up for new users
*/

//Packages needed for this app
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobquest/StartingPage/logInPage.dart';
import 'package:jobquest/StartingPage/signUpPage.dart';

//just a basic landing page w/ background with two buttons for log-in and sign-up
class Landingpage extends StatelessWidget {
  const Landingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/blue_background.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg', 
                    width: 150,
                    height: 150,
                  ),
                  const Text(
                    "JobQuest",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Welcome! Log In to your account or \n Sign Up to create a new account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white, 
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.white,
                      backgroundColor: Colors.blue,
                      // onSurface: Colors.grey,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(150, 40),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                    },
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                  ),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.white,
                      backgroundColor: Colors.white,
                      // onSurface: Colors.grey,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: const Size(150, 40),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                    },
                  child: Text (
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
