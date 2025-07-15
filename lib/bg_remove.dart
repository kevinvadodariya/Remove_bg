import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remove_bg/Reg_form.dart';
import 'Log_in.dart';

class Bg_remove extends StatefulWidget {
  final String imagePath;

  const Bg_remove({required this.imagePath});

  @override
  State<Bg_remove> createState() => _Bg_removeState();
}

class _Bg_removeState extends State<Bg_remove> {
  int click = 0;
  List<Widget> addedContainers = [];


  final ImagePicker _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        addedContainers.add(
          _buildContainer(addedContainers.length, File(pickedFile.path)),
        );
      });
    }
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image.asset(
            "lib/Assets/Images/bg1.png",
            width: 60,
            height: 60,
          ),
          backgroundColor: Colors.white,
          toolbarHeight: 60,
          shape:
          const Border(bottom: BorderSide(color: Colors.white10, width: 1)),
          elevation: 4,
          shadowColor: Colors.white,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  click = 0;
                });
                print('Undo action');
              },
              icon: Icon(
                click == 0 ? Icons.undo : Icons.undo_outlined,
                color: click == 0 ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  click = 1;
                });
                print('Redo action');
              },
              icon: Icon(
                click == 1 ? Icons.redo : Icons.redo_outlined,
                color: click == 1 ? Colors.black : Colors.grey,
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (String result) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Log_in(),
                    ));
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'LOG IN',
                  child: Text('LOG IN'),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _openImagePicker();
                      setState(() {
                      });
                    },
                    child: Container(
                      child: Icon(Icons.add),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.lightBlue.shade200,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent.shade400,
                        width: 2, // Set border width here
                      ),
                      borderRadius:
                      BorderRadius.circular(4), // Set border radius here
                    ),
                    child: Image.file(
                      File(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    children: addedContainers,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 190,
            ),
            Container(
                width: 450,
                height: 300,
                // color: Colors.orangeAccent,
                child: Image.file(File(widget.imagePath))),
          ],
        ),
        bottomNavigationBar:
        _Navigator_menu(context, File(widget.imagePath), widget.imagePath),
      );
    }
  Widget _buildContainer(int index, File imagePath) {
    int selectedContainerIndex = -1;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedContainerIndex == index;
          });
        },
        onDoubleTap: () {
          setState(() {
            addedContainers.removeAt(index);
            selectedContainerIndex = -1;
          });
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedContainerIndex == index
                  ? Colors.red
                  : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Image.file(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
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
              _showDownloadHD(context, imagePath);
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
              _addBackgorund(context);
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

void _showDownloadHD(BuildContext context, String imagePath) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        // height: 500,
        width: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 300, top: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close, size: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 180),
              child: Text(
                "Download HD",
                style: GoogleFonts.exo2(
                    textStyle:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 135, bottom: 20),
              child: Text(
                "HD 512x215px",
                style: GoogleFonts.publicSans(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      color: Color(0xFF9B5107)),
                ),
              ),
            ),
            Container(
              color: Colors.grey.shade300,
              width: 300,
              height: 200,
              child: Image(image: FileImage(File(imagePath))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(300, 55)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    )),
                onPressed: () {},
                child: Text(
                  "Download HD For 1 Credit ",
                  style: GoogleFonts.cabin(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800)),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                children: [
                  Text(
                    " You Have 0 Credite",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registration(),
                          ));
                    },
                    child: Text(
                      "Get Credits",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

void _addBackgorund(BuildContext context) {
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
  bool _showImages = true;
  bool _blur = false;
  bool _color = false;
  bool _switch = false;
  double _sliderValue = 45;

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) =>
            Container(
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
                            style: TextStyle(color: Colors.black45,
                                fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 240,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Done",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                  if (_blur)
                    Container(
                      height: 160,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  CupertinoSwitch(
                                    activeColor: Colors.orangeAccent,
                                    value: _switch,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _switch = newValue;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Blur background ',
                                    style: GoogleFonts.alata(
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey.shade800)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 230, top: 10),
                              child: Text(
                                "Blur amount  : ${_sliderValue.toInt()}",
                                style: GoogleFonts.alata(
                                    textStyle: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade800)),
                              ),
                            ),
                            Slider(
                              activeColor: Colors.orangeAccent,
                              value: _sliderValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _sliderValue = newValue;
                                });
                              },
                              min: 0.0,
                              max: 100.0,
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    if (!_blur) // Show GridView when _blur is false
                      Container(
                        height: 160,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: 22,
                            // Adjust item count based on _showImages
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              if (_showImages) {
                                if (index == 0) {
                                  // Render an icon in the first container
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: selectedIndex == index
                                            ? Colors.black
                                            : Colors.transparent,
                                        width: 2,
                                      ),
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedIndex = index;
                                          print("bksdfb");
                                        });
                                      },
                                      icon: Icon(
                                        Icons.do_not_disturb_alt,
                                        size: 25,
                                      ),
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
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedIndex = index;
                                            print("bksdfb");
                                          });
                                        },
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(
                                          Icons.add,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: selectedIndex == index
                                              ? Colors.black
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        'lib/Assets/Images/Daco_4232955.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }
                              } else if (_color) {
                                if (index == 0) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        print("bksdfb");
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: selectedIndex == index
                                              ? Colors.black
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedIndex = index;
                                            print("bksdfb");
                                          });
                                        },
                                        icon: Icon(
                                          Icons.do_not_disturb_alt,
                                          size: 25,
                                        ),
                                      ),
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
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                      Fluttertoast.showToast(
                                          msg: "ram ram",
                                          backgroundColor: colors[index]);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: selectedIndex == index
                                              ? Colors.black
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                        color: colors[index],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  );
                                }
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
                          setState(() {
                            _showImages = true;
                            _blur = false;
                            _color = false;
                          });
                        },
                        child: Text(
                          'Photo',
                          style: TextStyle(
                              color:
                              _showImages ? Colors.blue : Colors.grey.shade700,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _showImages = false;
                            _blur = false;
                            _color = true;
                          });
                        },
                        child: Text(
                          'Color',
                          style: TextStyle(
                              color: _color ? Colors.blue : Colors.grey
                                  .shade700,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _showImages = false;
                            _blur = true;
                            _color = false;
                          });
                        },
                        child: Text(
                          'Blur',
                          style: TextStyle(
                              color: _blur ? Colors.blue : Colors.grey.shade700,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
      );
    },
  );
}
}