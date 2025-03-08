/* Authored by: Patrick Kurt O. Villamer
Company: Lumora
Project: JobQuest
Feature: [STP-005] Sign Up page
Description: The sign-in page, that allows users to create an account
*/

//packages needed for this part
import 'package:flutter/material.dart';
import 'package:jobquest/StartingPage/logInPage.dart';
import 'package:jobquest/widget/custome_scaffold.dart';

// Define the Sign Up Page page as a StatefulWidget
// This allows the page to manage dynamic state changes
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

//main widget that has the personal details of the user
class _SignUpPageState extends State<SignUpPage> {
  int _currentStep = 0; // Track the current step
  List<String> selectedStatuses = []; // Track selected statuses

  // Function to move to the next step
  void nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    }
  }

  // Function to move to the previous step
  void previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  // Function to toggle the status
  void toggleStatus(String status) {
    setState(() {
      if (selectedStatuses.contains(status)) {
        selectedStatuses.remove(status);
      } else {
        selectedStatuses.add(status);
      }
    });
  }

  // Build the widget
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Personal Details",
      overlayText: "Create An Account",
      child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Padding( 
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    width: 80,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _currentStep == index ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            if (_currentStep == 0)
              StepOne(
                selectedStatuses: selectedStatuses,
                onStatusChanged: toggleStatus,
              ),
            if (_currentStep == 1) StepTwo(),
            if (_currentStep == 2) StepThree(),
            const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentStep > 0)
                TextButton(
                  onPressed: previousStep,
                  child: const Text("Back"),
                ),
              if (_currentStep < 2) // Hide the Next button on the last step
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    minimumSize: const Size(120, 40),
                  ),
                  onPressed: nextStep,
                  child: const Text("Next", style: TextStyle(color: Colors.white)),
                ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}

// Define the StepOne widget as a StatelessWidget
// This widget displays the first step of the sign-up process
class StepOne extends StatelessWidget {
  final List<String> selectedStatuses; // Track selected statuses
  final Function(String) onStatusChanged; // Callback function

  StepOne({required this.selectedStatuses, required this.onStatusChanged}); // Constructor

  final List<String> statuses = [ // List of example statuses
    "Fresh Graduate",
    "College Student",
    "Intern",
    "Part-Timer",
    "Employed",
    "Freelancer",
    "Professional",
    "Employer",
    "Recruiter"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Select Your Status",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children: statuses.map((status) {
            bool isSelected = selectedStatuses.contains(status);
            return GestureDetector(
              onTap: () => onStatusChanged(status),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.withOpacity(0.7) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    if (isSelected) Icon(Icons.check, color: Colors.white),
                  ],
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

// Define the StepTwo widget as a StatefulWidget
// This widget displays the second step of the sign-up process
class StepTwo extends StatefulWidget {
  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  bool _isObscure = true;
  bool _isObscure2 = true;
  String? selectedGender;
  DateTime? selectedDate;

  // Function to select a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    // Update the selected date
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Full Name"),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            hintText: "Enter you Full Name",
            filled: true,
            fillColor: Colors.lightBlue[100],
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your full name';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),

        const Text("Gender"),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>( // Use DropdownButtonFormField
          value: selectedGender,
          onChanged: (newValue) {
            setState(() {
              selectedGender = newValue;
            });
          },
          items: ["Male", "Woman"].map((String gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            hintText: "Please select",
            filled: true,
            fillColor: Colors.lightBlue[100],
          ),
        ),
        const SizedBox(height: 20),

        const Text("Email"),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            hintText: "Enter your email",
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

        const Text("Contact Number"),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            hintText: "Enter your Contact Number",
            filled: true,
            fillColor: Colors.lightBlue[100],
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid number';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),

        const Text("Date Of Birth"),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
            child: TextFormField(
              controller: TextEditingController(
                text: selectedDate != null
                    ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                    : '',
              ),
              decoration: InputDecoration(
                hintText: "Select your date of birth",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.lightBlue[100],
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),

        const Text("Address"),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.streetAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            hintText: "Enter your Address",
            filled: true,
            fillColor: Colors.lightBlue[100],
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Address';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),

        const Text("Password"),
        const SizedBox(height: 3),
        TextFormField(
          obscureText: _isObscure,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
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
        const SizedBox(height: 20),

        const Text("Confirm Password"),
        const SizedBox(height: 3),
        TextFormField(
          obscureText: _isObscure2,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscure2 = !_isObscure2;
                });
              },
              icon: Icon(_isObscure2 ? Icons.visibility_off : Icons.visibility),
            ),
            hintText: "Confirm password",
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
      ],
    );
  }
}

// Define the StepThree widget as a StatefulWidget
// This widget displays the third step of the sign-up process
class StepThree extends StatefulWidget {
  @override
  _StepThreeState createState() => _StepThreeState();
}

//main widget that has the upload documents of the user
class _StepThreeState extends State<StepThree> {
  String? validIdFile;
  String? resumeFile;
  bool isAgreed = false;
  bool isTermsAgreed = false;
  bool isPrivacyAgreed = false;

  // Function to pick a file
  void pickFile(bool isValidId) {
    setState(() {
      if (isValidId) {
        validIdFile = "Valid_ID.pdf"; // Simulated file name
      } else {
        resumeFile = "Resume.pdf"; // Simulated file name
      }
    });
  }

  // Function to take a picture
  void takePicture(bool isValidId) {
    setState(() {
      if (isValidId) {
        validIdFile = "ID_Picture.jpg"; 
      } else {
        resumeFile = "Resume_Picture.jpg"; 
      }
    });
  }

  // Function to build the upload box
  Widget buildUploadBox(String title, String? fileName, VoidCallback onUpload, VoidCallback onTakePicture) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.lightBlue[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey),
            ),
            child: Text(
              fileName ?? "No file selected",
              style: TextStyle(color: fileName != null ? Colors.black : Colors.grey),
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: onUpload,
                icon: const Icon(Icons.upload_file),
                label: const Text("Upload"),
              ),
              ElevatedButton.icon(
                onPressed: onTakePicture,
                icon: const Icon(Icons.camera_alt),
                label: const Text("Take Picture"),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Upload Documents",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        buildUploadBox(
          "Valid ID",
          validIdFile,
          () => pickFile(true),
          () => takePicture(true),
        ),

        buildUploadBox(
          "Resume",
          resumeFile,
          () => pickFile(false),
          () => takePicture(false),
        ),

        const SizedBox(height: 20),

      Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10), // Space above button
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "By continuing, you agree to \n",
                style: const TextStyle(fontSize: 12, color: Colors.black),
                children: [
                  TextSpan(
                    text: "Terms of Use",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Make it blue
                    ),
                  ),
                  const TextSpan(text: " and "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Make it blue
                    ),
                  ),
                  const TextSpan(text: "."),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              minimumSize: const Size(120, 40),
            ),
            onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => LoginPage()), //navigate to home page after log-in button is pressed
                );
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      )
      ],
    );
  }
}