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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: sampleImage == null? Text("Select an Image"): enableUpload(),
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
              onPressed: validateAndSave,
            ),
          ],
        ),
      ),
    );
  }
}