import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class navigationbar extends StatefulWidget {
  final String imagePath;

  const navigationbar ({required this.imagePath});
  @override
  State<navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<navigationbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar:
        _Navigator_menu(context, File(widget.imagePath), widget.imagePath),
    );
  }
}

Widget _Navigator_menu(BuildContext context, File removeimg, String imagePath) {
  return Container(
      height: 80,
      color: Colors.grey.shade100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Material(
          // elevation: 1,
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () {
              print("abshdkbk");
              _saveImageToDevice(removeimg);
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 15, bottom: 8, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      maxRadius: 17,
                      child: Icon(
                        Icons.arrow_circle_down,
                        size: 35,
                        color: Colors.blue,
                      )),
                  SizedBox(height: 4),
                  // Add some space between the avatar and text
                  Text(
                    "Download",
                    style:
                        GoogleFonts.afacad(textStyle: TextStyle(fontSize: 10)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          // elevation: 1, // Add elevation for a shadow effect
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(5),
          child: InkWell(
            onTap: () {
              _showBottomDialog(context, imagePath);
              print("bk");
            },
            splashColor: Colors.blue.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    maxRadius: 17,
                    child: Icon(
                      Icons.download_for_offline_outlined,
                      size: 35,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Add some space between the avatar and text
                  Text(
                    "Download HD",
                    style:
                        GoogleFonts.afacad(textStyle: TextStyle(fontSize: 10)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          child: InkWell(
            onTap: () {
              _showBackground(context);
              print("kbk");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 17,
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/1486974/pexels-photo-1486974.jpeg?auto=compress&cs=tinysrgb&w=600",
                    ),
                  ),
                  SizedBox(height: 4),
                  // Add some space between the avatar and text
                  Text(
                    "Add Background",
                    style:
                        GoogleFonts.afacad(textStyle: TextStyle(fontSize: 10)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          // elevation: 1, // Add elevation for a shadow effect
          color: Colors.grey.shade100,
          // Set the color to transparent to maintain InkWell's ripple effect
          borderRadius: BorderRadius.circular(10),
          // Optional: Add border radius to match the circle avatar

          child: InkWell(
            onTap: () {
              print("abshdkbk");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 17,
                    child: Image.asset(
                      "lib/Assets/Images/brush.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Add some space between the avatar and text
                  Text(
                    "Erase \\ Restore",
                    style:
                        GoogleFonts.afacad(textStyle: TextStyle(fontSize: 10)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          // elevation: 1, // Add elevation for a shadow effect
          color: Colors.grey.shade100,
          // Set the color to transparent to maintain InkWell's ripple effect
          borderRadius: BorderRadius.circular(10),
          // Optional: Add border radius to match the circle avatar

          child: InkWell(
            onTap: () {
              print("abshdkbk");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 17,
                    backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Canva_icon_2021.svg/900px-Canva_icon_2021.svg.png?20220821125247",
                    ),
                  ),
                  SizedBox(height: 4),
                  // Add some space between the avatar and text
                  Text(
                    "Create Design",
                    style:
                        GoogleFonts.afacad(textStyle: TextStyle(fontSize: 10)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]));
}

class _showBottomDialog {
  _showBottomDialog(BuildContext context, String imagePath);
}

void _showBackground(BuildContext context) {
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.cyan,
    Colors.indigo,
    Colors.lime,
    Colors.amber,
    Colors.brown,
    Colors.lightBlue,
    Colors.deepOrange,
    Colors.lightGreen,
    Colors.deepPurple,
    Colors.blueGrey,
    Colors.grey,
    Colors.black,
    Colors.indigo,
    Colors.lime,
  ];
  int selectedIndex = -1;

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Colors.deepOrangeAccent,
        ),
        height: 280,
        width: 390,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 12,
              ),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.black45, fontSize: 15),
                      )),
                  SizedBox(
                    width: 240,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Done",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ))
                ],
              ),
            ),
            Container(
              height: 160,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(), // Disable GridView's scrolling behavior
                  itemCount: 22,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      // Render an icon in the first container
                      return GestureDetector(
                        onTap: () {
                          selectedIndex = index;
                          print("bksdfb");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.transparent, // Add this line
                              width: 2,
                            ),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.do_not_disturb_alt),
                        ),
                      );
                    } else if (index == 1) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.add),
                        ),
                      );
                    } else {
                      // Render colors in the rest of the containers
                      return GestureDetector(
                        onTap: () {
                          selectedIndex = index;
                          Fluttertoast.showToast(
                              msg: "ram ram", backgroundColor: colors[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedIndex == index
                                  ? Colors.indigo
                                  : Colors.transparent, // Add this line
                              width: 2,
                            ),
                            color: colors[index],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle button 3 tap
                  },
                  child: Text(
                    'Photo',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                TextButton(
                  onPressed: () {
                    // Handle button 3 tap
                  },
                  child: Text(
                    'Color',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                TextButton(
                  onPressed: () {
                    // Handle button 3 tap
                  },
                  child: Text(
                    'Blur',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}

Future<void> _saveImageToDevice(File imageFile) async {
  try {
    // Read the image file as Uint8List
    Uint8List bytes = await imageFile.readAsBytes();

    // Save the image to the device
    await ImageGallerySaver.saveImage(bytes);

    print('Image saved to gallery.');
    Fluttertoast.showToast(
      msg: "Your Image Is Downloaded",
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
    );
  } catch (error) {
    print('Error saving image: $error');
  }
}