import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Display selected time on the screen
  String yearSelected = DateTime.now().year.toString();

  // The value of the selected Item
  int selectedIcon = -1;

// Change the index of the selected item
  void changeIconSlected(int newValue) => setState(() {
        selectedIcon = newValue;
      });

// TextEditingController are variables that we use to control and get the value of textfields
  TextEditingController companyNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastBameController = TextEditingController();

// Allows to manage Fors
  final formKey = GlobalKey<FormState>();

  // Validator Function for textfields
  String? validate(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a value';
    } else {
      return null;
    }
  }

  bool isPictureLoaded = false;
  File? photoFile;

// Get Image File
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image;

    // Pick an image
    image = await picker.pickImage(source: ImageSource.gallery);

    // Capture a photo.
    // image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      File file = File(image.path);
      isPictureLoaded = true;
      photoFile = file;
    } else {
      // User canceled the picker
    }
  }

  void getAllinfos() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 60,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await pickImage();
                          setState(() {});
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          backgroundImage:
                              isPictureLoaded ? FileImage(photoFile!) : null,
                          radius: 60,
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 5,
                        child: Icon(Icons.photo),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        validator: validate,
                        decoration: InputDecoration(
                          floatingLabelStyle:
                              const TextStyle(color: Colors.black),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.white,
                          labelText: 'Company/Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        validator: validate,
                        decoration: InputDecoration(
                          floatingLabelStyle:
                              const TextStyle(color: Colors.black),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.white,
                          labelText: 'First Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        validator: validate,
                        decoration: InputDecoration(
                          floatingLabelStyle:
                              const TextStyle(color: Colors.black),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.white,
                          labelText: 'Last Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => changeIconSlected(1),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedIcon == 1
                                        ? Colors.blue
                                        : Colors.black,
                                    width: 1),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Icon(
                                Icons.girl,
                                size: 40,
                                color: selectedIcon == 1
                                    ? Colors.blue
                                    : Colors.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => changeIconSlected(2),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedIcon == 2
                                        ? Colors.blue
                                        : Colors.black,
                                    width: 1),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Icon(
                                Icons.man_2,
                                size: 40,
                                color: selectedIcon == 2
                                    ? Colors.blue
                                    : Colors.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => changeIconSlected(3),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedIcon == 3
                                        ? Colors.blue
                                        : Colors.black,
                                    width: 1),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Icon(
                                Icons.woman_2,
                                size: 40,
                                color: selectedIcon == 3
                                    ? Colors.blue
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            yearSelected =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text('Establish'),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  yearSelected,
                                  style: const TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.blue,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 20,
                child: TextButton(
                  onPressed: getAllinfos,
                  child: const Text('FINISH'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
