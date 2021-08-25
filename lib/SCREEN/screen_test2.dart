import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_web/image_picker_web.dart';
//import http package manually

class ImageUpload extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ImageUpload();
  }
}

class _ImageUpload extends State<ImageUpload>{

  // My IPv4 : 192.168.43.171 
  final String phpEndPoint = 'http://192.168.43.171/phpAPI/image.php';
  final String nodeEndPoint = 'http://192.168.43.171:3000/image';
  File? file;
  Image? pickedImage;

  void _choose() async {
    file = await ImagePicker().pickImage(source: ImageSource.camera) as File;
// file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  Future<void> getFiles() async{
    Image? fromPicker = await ImagePickerWeb.getImage(outputType: ImageType.widget) as Image;
    if (fromPicker != null) {
      setState(() {
        pickedImage = fromPicker;
      });
    }

  }

  void _upload() {
    if (file == null) return;
    String base64Image = base64Encode(file!.readAsBytesSync());
    String fileName = file!.path.split("/").last;
    http.post(Uri.parse(phpEndPoint), body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image to Server"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: getFiles,
                child: Text('Choose Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: _upload,
                child: Text('Upload Image'),
              )
            ],
          ),
          file == null
              ? Text('No Image Selected')
              : pickedImage!
        ],
      ),
    );
  }
}