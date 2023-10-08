// import 'package:flutter/material.dart';
// import 'package:portfolio_app/about.dart';
// import 'dart:io';
// //import 'package:portfolio_app/utils.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class inputForm2 extends StatefulWidget {
//   String email;

//   inputForm2({required this.email});
//   @override
//   _InputFormState createState() => _InputFormState(email: email);
// }

// class _InputFormState extends State<inputForm2> {
//   String email;
//   String? imageUrl;
//   bool react = true;
//   bool javascript = true;
//   bool python = true;
//   bool typescript = true;
//   bool html = true;
//   bool java = true;
//   bool css = true;
//   bool isloading = false;
//   //var skills = Map<String, String>();
//   _InputFormState({required this.email});

//   XFile? image;

//   final ImagePicker picker = ImagePicker();

//   final _firebaseStorage = FirebaseStorage.instance;
//   //we can upload image from camera or from gallery based on parameter
//   Future getImage(ImageSource media) async {
//     try {
//       var img = await picker.pickImage(source: media);
//       final path = '${img!.name}';
//       String fileName =
//           DateTime.now().millisecondsSinceEpoch.toString() + "-" + path;
//       File imageFile = File(img.path);
//       setState(() {
//         isloading = true;
//       });
//       //Upload to Firebase
//       final ref = _firebaseStorage.ref().child(fileName);
//       UploadTask uploadTask = ref.putFile(imageFile);

//       final snapshot = await uploadTask.whenComplete(() {
//         setState(() {
//           isloading = false;
//         });
//       });

//       var downloadUrl = await snapshot.ref.getDownloadURL();
//       print('download link ${downloadUrl}');
//       setState(() {
//         image = img;
//         imageUrl = downloadUrl;
//       });
//     } catch (e) {
//       print("Error ${e}");
//     }
//   }

//   //show popup dialog
//   void myAlert() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           title: Text('Please choose media to select'),
//           content: Container(
//             height: MediaQuery.of(context).size.height / 6,
//             child: Column(
//               children: [
//                 ElevatedButton(
//                   //if user click this button, user can upload image from gallery
//                   onPressed: () {
//                     Navigator.pop(context);
//                     getImage(ImageSource.gallery);
//                   },
//                   child: Row(
//                     children: [
//                       Icon(Icons.image),
//                       Text('From Gallery'),
//                     ],
//                   ),
//                 ),
//                 ElevatedButton(
//                   //if user click this button. user can upload image from camera
//                   onPressed: () {
//                     Navigator.pop(context);
//                     getImage(ImageSource.camera);
//                   },
//                   child: Row(
//                     children: [
//                       Icon(Icons.camera),
//                       Text('From Camera'),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
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
//       body: Column(
//         children: [
//           // Expanded(
//           //   child: MyDropdownButton(
//           //     email: email,
//           //   ),
//           // ),
//           Padding(
//             padding: const EdgeInsets.only(
//               bottom: 10.0,
//               top: 20.0,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Please Select your skills',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: Colors.white,
//                   ),
//                 ),
//                 CheckboxListTile(
//                   title: const Text(
//                     'React',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   value: react,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       react = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: const Text(
//                     'JavaScript',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   value: javascript,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       javascript = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: const Text(
//                     'Python',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   value: python,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       python = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: const Text(
//                     'TypeScript',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   value: typescript,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       typescript = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: const Text(
//                     'HTML',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   value: html,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       html = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: const Text(
//                     'Java',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   value: java,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       java = value!;
//                     });
//                   },
//                 ),
//                 CheckboxListTile(
//                   title: const Text(
//                     'CSS',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   value: css,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       css = value!;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(0.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 myAlert();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.yellow,
//               ),
//               child: isloading
//                   ? CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     )
//                   : Text(
//                       'Upload Photo',
//                       style: TextStyle(
//                         color: Colors.black,
//                       ),
//                     ),
//             ),
//           ),
//           Container(
//             color: Colors.yellow,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => About(
//                       email: email,
//                       imageUrl: imageUrl!,
//                       react: react,
//                       python: python,
//                       html: html,
//                       typescript: typescript,
//                       javascript: javascript,
//                       java: java,
//                       css: css,
//                     ),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.yellow,
//                 onPrimary: Colors.black,
//               ),
//               child: Text('Generate'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyDropdownButton extends StatefulWidget {
//   String email;

//   MyDropdownButton({required this.email});
//   @override
//   _MyDropdownButtonState createState() => _MyDropdownButtonState();
// }

// class _MyDropdownButtonState extends State<MyDropdownButton> {
//   String? selectedProfession;

//   List<String> professions = ['Doctor', 'Engineer', 'Teacher', 'Artist'];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 450.0, left: 16.0),
//                 child: Text(
//                   'Profession',
//                   style: TextStyle(
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//               SizedBox(width: 10), // Add some spacing between text and dropdown
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 450.0, left: 16.0),
//                 child: DropdownButton<String>(
//                   items:
//                       professions.map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   dropdownColor: Colors.black,
//                   value: selectedProfession,
//                   icon: Icon(Icons.arrow_downward, color: Colors.white),
//                   iconSize: 24,
//                   elevation: 16,
//                   style: TextStyle(color: Colors.white),
//                   onChanged: (value) {
//                     setState(() {
//                       selectedProfession = value;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portfolio_app/about.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:firebase_storage/firebase_storage.dart';

class inputForm2 extends StatefulWidget {
  String email;

  inputForm2({required this.email});

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<inputForm2> {
  late String email;
  String? imageUrl;
  bool react = true;
  bool javascript = true;
  bool python = true;
  bool typescript = true;
  bool html = true;
  bool java = true;
  bool css = true;
  bool isloading = false;
  final ImagePicker picker = ImagePicker();
  final _firebaseStorage = FirebaseStorage.instance;
  XFile? image;

  Future getImage(ImageSource source) async {
    try {
      var img = await picker.pickImage(source: source);
      final path = '${img!.name}';
      String fileName =
          DateTime.now().millisecondsSinceEpoch.toString() + "-" + path;
      File imageFile = File(img.path);
      setState(() {
        isloading = true;
      });

      final ref = _firebaseStorage.ref().child(fileName);
      UploadTask uploadTask = ref.putFile(imageFile);

      final snapshot = await uploadTask.whenComplete(() {
        setState(() {
          isloading = false;
        });
      });

      var downloadUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        image = img;
        imageUrl = downloadUrl;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Welcome to Talent Hub',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Please Select Your Skills',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            CheckboxListTile(
              title: const Text('React', style: TextStyle(color: Colors.white)),
              value: react,
              onChanged: (bool? value) {
                setState(() {
                  react = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('JavaScript',
                  style: TextStyle(color: Colors.white)),
              value: javascript,
              onChanged: (bool? value) {
                setState(() {
                  javascript = value!;
                });
              },
            ),
            CheckboxListTile(
              title:
                  const Text('Python', style: TextStyle(color: Colors.white)),
              value: python,
              onChanged: (bool? value) {
                setState(() {
                  python = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('TypeScript',
                  style: TextStyle(color: Colors.white)),
              value: typescript,
              onChanged: (bool? value) {
                setState(() {
                  typescript = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('HTML', style: TextStyle(color: Colors.white)),
              value: html,
              onChanged: (bool? value) {
                setState(() {
                  html = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Java', style: TextStyle(color: Colors.white)),
              value: java,
              onChanged: (bool? value) {
                setState(() {
                  java = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('CSS', style: TextStyle(color: Colors.white)),
              value: css,
              onChanged: (bool? value) {
                setState(() {
                  css = value!;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _showMediaSelectionDialog();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
              ),
              child: isloading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    )
                  : Text(
                      'Upload Photo',
                      style: TextStyle(color: Colors.black),
                    ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _navigateToAboutScreen();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
              ),
              child: Text(
                'Generate',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMediaSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Choose Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  getImage(ImageSource.gallery);
                },
                child: Row(
                  children: [
                    Icon(Icons.image),
                    SizedBox(width: 10.0),
                    Text('From Gallery'),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  getImage(ImageSource.camera);
                },
                child: Row(
                  children: [
                    Icon(Icons.camera),
                    SizedBox(width: 10.0),
                    Text('From Camera'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToAboutScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => About(
          email: widget.email,
          imageUrl: imageUrl!,
          react: react,
          python: python,
          html: html,
          typescript: typescript,
          javascript: javascript,
          java: java,
          css: css,
        ),
      ),
    );
  }
}
