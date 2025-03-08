/* Authored by: Patrick Kurt O. Villamer
Company: Lumora
Project: JobQuest
Feature: [STP-004] Forgot Password verification page
Description: The forgot password verification page, that allows users to enter code that was send to their email
*/


//packages needed for this part
import 'package:flutter/material.dart';
import 'package:jobquest/widget/custome_scaffold.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// Define the Forgot Password verification page as a StatefulWidget  
// This allows the page to manage dynamic state changes
class InputCodePage extends StatefulWidget {
  @override
  _InputCodePageState createState() => _InputCodePageState();
}

//structure and logic of the forgot password verification page, with the code and verify code
//resend code is still not done
class _InputCodePageState extends State<InputCodePage> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "",
      overlayText: "Forgot Password",
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            "Enter the 6-Digit Code Sent to Your Email",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          // OTP Input Field and make it a PinCodeTextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PinCodeTextField(
              appContext: context, 
              length: 6,
              obscureText: false,
              keyboardType: TextInputType.number,
              controller: otpController,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline, 
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.transparent,
                inactiveFillColor: Colors.transparent,
                selectedFillColor: Colors.transparent,
                activeColor: Colors.blue, 
                inactiveColor: Colors.grey, 
                selectedColor: Colors.blueAccent, 
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: false, 
              onCompleted: (value) {
                print("Entered Code: $value");
              },
              onChanged: (value) {
                print("Current Value: $value");
              },
            ),
          ),

          const SizedBox(height: 30),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              minimumSize: const Size(300, 40),
            ),
            onPressed: () {
              print("OTP Submitted: ${otpController.text}");
              // TODO: Implement verification logic
            },
            child: const Text(
              "Verify Code",
              style: TextStyle(color: Colors.black),
            ),
          ),

          const SizedBox(height: 10),

          TextButton(
            onPressed: () {
              print("Resend Code Pressed");
            },
            child: const Text(
              "Resend Code",
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
