//import 'dart:html';
//import 'dart:html';
//import 'dart:html';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'All_Student.dart';
import 'Attendance.dart';
import 'Utiles.dart';
import 'onleave.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
/* // final ImagePicker _imagePicker = ImagePicker();

Future<void> getGalleryImage() async {

    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
     print(pickedFile?.path);
if(pickedFile!=null){
_image=File(pickedFile.path) as File?;
}else{
  print("No image is selected");
}

  }*/

DatabaseReference databaseref=FirebaseDatabase.instance.ref("Post") ;
     File? _image;

     firebase_storage.FirebaseStorage  storage=firebase_storage.FirebaseStorage.instance;
Future pickimage()async{
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return "jjlk";
    final imagetemp = File(image.path);
    setState(() {
      this._image = imagetemp;
    });
  }
  catch(e){
    print("failed to pick image:$e ");
  }
}
void uploadimage()async{
  firebase_storage.Reference ref=firebase_storage.FirebaseStorage.instance.ref("/FolderName"+"123");
    firebase_storage.UploadTask uploadTask=ref.putFile(_image!.absolute);

     await Future.value(uploadTask).then((value){
print(value);
     }).onError((error, stackTrace) {
       print(error);
     });
     var newurl=ref.getDownloadURL();

     databaseref.child("1").set({
        'studentid':"123",
       'Name':newurl.toString(),
     });
}

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: GestureDetector(

                onTap: (){

                 // getGalleryImage();
        print(_image?.path);
        pickimage();
                },
                child:_image!=null?Container(
                  width: 100,
                    height: 100,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    //borderRadius: BorderRadius.circular(50),
                  ),
                    child: Image.file(_image!.absolute,),

                ) : CircleAvatar(
                  backgroundImage:  AssetImage('Assets/images/1.jpg'), // Replace with default image asset
                  radius: 50,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(child: Text("This is the home page")),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentAttandace()),
                );
              },
              child: Container(
                width: width * .60,
                height: height * .20,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      "Attendance",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: height * .08,
                        backgroundImage: AssetImage('Assets/images/2.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * .02),
            Container(
              width: width * .60,
              height: height * .20,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => onleave()),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      "On Leave",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: height * .08,
                        backgroundImage: AssetImage('Assets/images/3.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * .02),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => View_all_Student()),
                );
              },
              child: Container(
                width: width * .60,
                height: height * .20,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      "View Attendance",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: height * .08,
                        backgroundImage: AssetImage('Assets/images/1.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
