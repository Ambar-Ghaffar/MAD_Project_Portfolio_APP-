// // ignore_for_file: prefer_const_constructors, deprecated_member_use

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:portfolio_app/inputForm2.dart'; // Import for FilteringTextInputFormatter

// // ignore: use_key_in_widget_constructors, must_be_immutable
// class InputForm extends StatelessWidget {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController projectsController = TextEditingController();
//   //final TextEditingController projectLinkController = TextEditingController();
//   final TextEditingController yearsController = TextEditingController();
//   final TextEditingController companyController = TextEditingController();
//   String email;

//   InputForm({required this.email});

//   Future<void> save(Map<String, dynamic> data) async {
//     try {
//       final CollectionReference bioData =
//           FirebaseFirestore.instance.collection('users');
//       await bioData.doc(email).set(data);
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text(
//           'Welcome to Talent Hub',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0, // Remove the shadow
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 controller: firstNameController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   labelText: 'First Name',
//                   labelStyle: TextStyle(color: Colors.white),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),
//               TextField(
//                 controller: lastNameController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   labelText: 'Last Name',
//                   labelStyle: TextStyle(color: Colors.white),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),
//               TextField(
//                 controller: professionController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   labelText: 'Occupation/Profession',
//                   labelStyle: TextStyle(color: Colors.white),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//               ),
//               TextField(
//                 controller: projectsController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   labelText: 'How many Projects did you do so far?',
//                   labelStyle: TextStyle(color: Colors.white),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                 ],
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: yearsController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   labelText: 'How many years of experience you have?',
//                   labelStyle: TextStyle(color: Colors.white),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                 ],
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: companyController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   labelText: 'In how many companies you have worked so far?',
//                   labelStyle: TextStyle(color: Colors.white),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                 ),
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                 ],
//                 keyboardType: TextInputType.number,
//               ),
//               // TextField(
//               //   controller: projectLinkController,
//               //   style: TextStyle(color: Colors.white),
//               //   decoration: InputDecoration(
//               //     labelText: 'Projects (paste or type links)',
//               //     hintText: 'Enter project links (separated by commas)',
//               //     labelStyle: TextStyle(color: Colors.white),
//               //     focusedBorder: UnderlineInputBorder(
//               //       borderSide: BorderSide(color: Colors.white),
//               //     ),
//               //   ),
//               //   onChanged: (value) {
//               //     // Handle the projects links input
//               //   },
//               // ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Clear all fields
//                       firstNameController.clear();
//                       lastNameController.clear();
//                       professionController.clear();
//                       projectsController.clear();
//                       //projectLinkController.clear();
//                       yearsController.clear();
//                       companyController.clear();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       onPrimary: Colors.black,
//                     ),
//                     child: Text('Cancel'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       final bioData = {
//                         "name": firstNameController.text,
//                         "last": lastNameController.text,
//                         "occupation": professionController.text,
//                         "project-done": projectsController.text,
//                         "year-experience": yearsController.text,
//                         "no-of-companies": companyController.text
//                       };
//                       save(bioData);
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => inputForm2(
//                                     email: email,
//                                   )));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.yellow,
//                       onPrimary: Colors.black,
//                     ),
//                     child: Text('Next'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:portfolio_app/inputForm2.dart';

// class InputForm extends StatelessWidget {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController projectsController = TextEditingController();
//   //final TextEditingController projectLinkController = TextEditingController();
//   final TextEditingController yearsController = TextEditingController();
//   final TextEditingController companyController = TextEditingController();
//   String email;

//   InputForm({required this.email});

//   Future<void> save(Map<String, dynamic> data) async {
//     try {
//       final CollectionReference bioData =
//           FirebaseFirestore.instance.collection('users');
//       await bioData.doc(email).set(data);
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text(
//           'Welcome to Talent Hub',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true, // Center the title
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Center(
//                 child: Image.asset(
//                   'logo.png',
//                   width: MediaQuery.of(context).size.width * 0.4,
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               buildTextField('First Name', firstNameController),
//               buildTextField('Last Name', lastNameController),
//               buildTextField('Occupation/Profession', professionController),
//               buildTextField(
//                   'How many Projects did you do so far?', projectsController,
//                   inputType: TextInputType.number),
//               buildTextField(
//                   'How many years of experience you have?', yearsController,
//                   inputType: TextInputType.number),
//               buildTextField('In how many companies you have worked so far?',
//                   companyController,
//                   inputType: TextInputType.number),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Clear all fields
//                       firstNameController.clear();
//                       lastNameController.clear();
//                       professionController.clear();
//                       projectsController.clear();
//                       yearsController.clear();
//                       companyController.clear();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       onPrimary: Colors.black,
//                     ),
//                     child: Text('Cancel'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       final bioData = {
//                         "name": firstNameController.text,
//                         "last": lastNameController.text,
//                         "occupation": professionController.text,
//                         "project-done": projectsController.text,
//                         "year-experience": yearsController.text,
//                         "no-of-companies": companyController.text
//                       };
//                       save(bioData);
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => inputForm2(
//                                     email: email,
//                                   )));
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.yellow,
//                       onPrimary: Colors.black,
//                     ),
//                     child: Text('Next'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(String label, TextEditingController controller,
//       {TextInputType? inputType}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: TextField(
//         controller: controller,
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: TextStyle(color: Colors.white),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           prefixIcon: Icon(
//             getIconForLabel(label),
//             color: Colors.white,
//           ),
//         ),
//         inputFormatters: [
//           if (inputType == TextInputType.number)
//             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//         ],
//         keyboardType: inputType,
//       ),
//     );
//   }

//   IconData getIconForLabel(String label) {
//     // Map labels to icons based on your preference
//     switch (label.toLowerCase()) {
//       case 'first name':
//         return Icons.person;
//       case 'last name':
//         return Icons.person;
//       case 'occupation/profession':
//         return Icons.work;
//       case 'how many projects did you do so far?':
//         return Icons.folder;
//       case 'how many years of experience you have?':
//         return Icons.access_time;
//       case 'in how many companies you have worked so far?':
//         return Icons.business;
//       default:
//         return Icons.person;
//     }
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:portfolio_app/inputForm2.dart';

// class InputForm extends StatelessWidget {
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController projectsController = TextEditingController();
//   //final TextEditingController projectLinkController = TextEditingController();
//   final TextEditingController yearsController = TextEditingController();
//   final TextEditingController companyController = TextEditingController();
//   String email;

//   InputForm({required this.email});

//   Future<void> save(Map<String, dynamic> data) async {
//     try {
//       final CollectionReference bioData =
//           FirebaseFirestore.instance.collection('users');
//       await bioData.doc(email).set(data);
//     } catch (e) {
//       print(e);
//     }
//   }

//   // ... existing code ...

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text(
//           'Welcome to Talent Hub',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Center(
//               child: Image.asset(
//                 'logo.png',
//                 width: MediaQuery.of(context).size.width * 0.4,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     buildTextField('First Name', firstNameController),
//                     buildTextField('Last Name', lastNameController),
//                     buildTextField(
//                         'Occupation/Profession', professionController),
//                     buildTextField(
//                       'How many Projects did you do so far?',
//                       projectsController,
//                       inputType: TextInputType.number,
//                     ),
//                     buildTextField(
//                       'How many years of experience you have?',
//                       yearsController,
//                       inputType: TextInputType.number,
//                     ),
//                     buildTextField(
//                       'In how many companies you have worked so far?',
//                       companyController,
//                       inputType: TextInputType.number,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Clear all fields
//                       firstNameController.clear();
//                       lastNameController.clear();
//                       professionController.clear();
//                       projectsController.clear();
//                       yearsController.clear();
//                       companyController.clear();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       onPrimary: Colors.black,
//                     ),
//                     child: Text('Cancel'),
//                   ),
//                 ),
//                 SizedBox(width: 20.0),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       final bioData = {
//                         "name": firstNameController.text,
//                         "last": lastNameController.text,
//                         "occupation": professionController.text,
//                         "project-done": projectsController.text,
//                         "year-experience": yearsController.text,
//                         "no-of-companies": companyController.text
//                       };
//                       save(bioData);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => inputForm2(
//                             email: email,
//                           ),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.yellow,
//                       onPrimary: Colors.black,
//                     ),
//                     child: Text('Next'),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildTextField(String label, TextEditingController controller,
//       {TextInputType? inputType}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: TextField(
//         controller: controller,
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: TextStyle(color: Colors.white),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           prefixIcon: Icon(
//             getIconForLabel(label),
//             color: Colors.white,
//           ),
//         ),
//         inputFormatters: [
//           if (inputType == TextInputType.number)
//             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//         ],
//         keyboardType: inputType,
//       ),
//     );
//   }

//   IconData getIconForLabel(String label) {
//     switch (label.toLowerCase()) {
//       case 'first name':
//         return Icons.person;
//       case 'last name':
//         return Icons.person;
//       case 'occupation/profession':
//         return Icons.work;
//       case 'how many projects did you do so far?':
//         return Icons.folder;
//       case 'how many years of experience you have?':
//         return Icons.access_time;
//       case 'in how many companies you have worked so far?':
//         return Icons.business;
//       default:
//         return Icons.person;
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_app/inputForm2.dart';

class InputForm extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController projectsController = TextEditingController();
  //final TextEditingController projectLinkController = TextEditingController();
  final TextEditingController yearsController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  String email;

  InputForm({required this.email});

  Future<void> save(Map<String, dynamic> data) async {
    try {
      final CollectionReference bioData =
          FirebaseFirestore.instance.collection('users');
      await bioData.doc(email).set(data);
    } catch (e) {
      print(e);
    }
  }

  // ... existing code ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Welcome to Talent Hub',
          style: TextStyle(color: Colors.yellow, fontSize: 32),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
                // child: Image.asset(
                //   'logo.png',
                //   width: MediaQuery.of(context).size.width * 0.4,
                // ),
                ),
            SizedBox(height: 20.0),
            buildTextField('First Name', firstNameController),
            buildTextField('Last Name', lastNameController),
            buildTextField('Occupation/Profession', professionController),
            buildTextField(
                'How many Projects did you do so far?', projectsController,
                inputType: TextInputType.number),
            buildTextField(
                'How many years of experience you have?', yearsController,
                inputType: TextInputType.number),
            buildTextField('In how many companies you have worked so far?',
                companyController,
                inputType: TextInputType.number),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Clear all fields
                      firstNameController.clear();
                      lastNameController.clear();
                      professionController.clear();
                      projectsController.clear();
                      yearsController.clear();
                      companyController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    child: Text('Cancel'),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final bioData = {
                        "name": firstNameController.text,
                        "last": lastNameController.text,
                        "occupation": professionController.text,
                        "project-done": projectsController.text,
                        "year-experience": yearsController.text,
                        "no-of-companies": companyController.text
                      };
                      save(bioData);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => inputForm2(
                            email: email,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      onPrimary: Colors.black,
                    ),
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {TextInputType? inputType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          prefixIcon: Icon(
            getIconForLabel(label),
            color: Colors.white,
          ),
        ),
        inputFormatters: [
          if (inputType == TextInputType.number)
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        keyboardType: inputType,
      ),
    );
  }

  IconData getIconForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'first name':
        return Icons.person;
      case 'last name':
        return Icons.person;
      case 'occupation/profession':
        return Icons.work;
      case 'how many projects did you do so far?':
        return Icons.folder;
      case 'how many years of experience you have?':
        return Icons.access_time;
      case 'in how many companies you have worked so far?':
        return Icons.business;
      default:
        return Icons.person;
    }
  }
}
