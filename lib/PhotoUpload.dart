import 'package:blog_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class UploadPhotoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {

  File sampleImage;
  String _myValue;
  String url;
  final formKey = GlobalKey<FormState>();

  Future getImage() async{
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage=tempImage;
    });
  }

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }

  void uploadStatusImage() async{
    if(validateAndSave()){
      final StorageReference postImageRef = FirebaseStorage.instance.ref().child("Post Images");
      var timeKey = DateTime.now();
      final StorageUploadTask uploadTask = postImageRef.child(timeKey.toString()+".jpg").putFile(sampleImage);
      var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      url = ImageUrl.toString();
      print("Image url = " + url);

      goToHome();

      saveToDatabase(url);


    }
  }

void saveToDatabase(url){
  var dbTimeKey = DateTime.now();
  var formatDate = DateFormat('MMM d, yyyy');
  var formatTime = DateFormat('EEEE, hh:mm aaa');

  String date = formatDate.format(dbTimeKey);
  String time = formatTime.format(dbTimeKey);

  DatabaseReference ref = FirebaseDatabase.instance.reference();
  var data = {
    "image": url,
    "description": _myValue,
    "date": date,
    "time": time,
  };

  ref.child("Posts").push().set(data);
}  

void goToHome(){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context){
      return HomePage();
    }
    )
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: sampleImage == null? Text("Select an Image"): enableUpload(),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.red,
      ),      
    );
  }

  Widget enableUpload(){
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Image.file(sampleImage, height:250.0, width:660.0),
            SizedBox(height: 5.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              validator: (value){
                return value.isEmpty ? 'Blog Description is Required' : null;
              },
              onSaved: (value){
                return _myValue = value;              
              },
            ),
            SizedBox(height: 5.0),
            RaisedButton(
              elevation: 10.0,
              child: Text("Add a New Post "),
              textColor: Colors.white,
              color: Colors.red,
              onPressed: uploadStatusImage,
            ),
          ],
        ),
      ),
    );
  }
}