import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:remove_bg/Log_in.dart';
import 'package:remove_bg/bg_remove.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();

  void _openImagePicker() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery,);

    if (pickedFile != null) {
      String imagePath = pickedFile.path;
      Navigator.push(context, MaterialPageRoute(builder:  (context) => Bg_remove(imagePath: imagePath,)));
    } else {
     print("nskdnc");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset("lib/Assets/Images/bg23.png", width: 180),
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        shape:
        const Border(bottom: BorderSide(color: Colors.white10, width: 1)),
        elevation: 4,
        shadowColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Log_in(),));
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image(
                image: AssetImage(
                    "lib/Assets/Images/Target free icons designed by Barudaklier.jpg"),
                width: 50,
                height: 50,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 8, right: 8),
            child: Text(
              "Upload As Image To Remove The Background",
              textAlign: TextAlign.center,
              style: GoogleFonts.cabin(
                  textStyle: TextStyle(
                      letterSpacing: 1,
                      color: Colors.grey.shade700,
                      fontSize: 33,
                      fontWeight: FontWeight.w900)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(Size(250, 60)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    )),
                onPressed: () {
                  _openImagePicker();
                },
                child: Text(
                  "Upload Image",
                  style: GoogleFonts.cabin(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              "No Image? Try One Of These:",
              style: GoogleFonts.cabin(
                  textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade500)),
            ),
          ),
          Container(
            // color: Colors.lightGreen,
            height: 90,
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("Image 1 clicked");
                      // Implement action
                    },
                    child: Container(
                      height: 90,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                          "lib/Assets/Images/ai-generated-8570323_1280.jpg"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("Image 2 clicked");
                      // Implement action
                    },
                    child: Container(
                      height: 90,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                          "lib/Assets/Images/human-3782189_1280.jpg"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("Image 3 clicked");
                      // Implement action
                    },
                    child: Container(
                      height: 90,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                          "lib/Assets/Images/cap-2923682_1280.jpg"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("Image 4 clicked");
                      // Implement action
                    },
                    child: Container(
                      height: 90,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child:
                      Image.asset("lib/Assets/Images/Daco_4232955.png"),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
