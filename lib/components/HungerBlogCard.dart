import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HungerBlogCard extends StatefulWidget {

   HungerBlogCard({Key? key}) : super(key: key);

  @override
  State<HungerBlogCard> createState() => _HungerBlogCardState();
}

class _HungerBlogCardState extends State<HungerBlogCard> {

  String? _image;
  bool image_loading = false;
  bool loading = false;

  TextEditingController title=TextEditingController();
  TextEditingController image=TextEditingController();
  TextEditingController descriptions=TextEditingController();
  TextEditingController date=TextEditingController();
  TextEditingController creater=TextEditingController();
var uuid=Uuid();
  Future<void> PickImage() async {
    final _imageStorage = FirebaseStorage.instance;
    final UploadImage = FileUploadInputElement()..accept = 'image/*';
    UploadImage.click();
    UploadImage.onChange.listen((event) async {
      final file = UploadImage.files!.first;
      print(file.name);
      var fileName = file.name;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      //Upload to Firebase
      var snapshot =
      await _imageStorage.ref().child('images/${uuid.v1()}').putBlob(file);
      var url = await snapshot.ref.getDownloadURL();
      print(' url is founded ${url}');
      if (await url != null) {
        setState(() {
          _image = url;

          image_loading = false;

        });
      }

      await reader.onLoadStart.listen((event) {
        print("images loading started ${event}");
      });
      await reader.onLoadEnd.listen((event) {});
    });
  }
var dates= DateTime.now();
  UploadBlog(){
    setState(() {
      loading=true;
    });
    FirebaseFirestore.instance.collection('Blog').doc().set({
      'date':"${dates.day}/${dates.month}/${dates.year}",
      'title':title.text,
      'desc':descriptions.text,
      'image':_image,
      'creater':creater.text

    }).then((value) {
      loading=false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: Text('Add Hunger Blog'),),
        SizedBox(height: 12,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          ),
          width: 500,
          child:TextField(
            controller: title,
            decoration: InputDecoration(border: InputBorder.none,hintText: "Hunger Blog Title"),),),
        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          ),
          width: 500,
          child:TextField(
            controller: creater,
            decoration: InputDecoration(border: InputBorder.none,hintText: "Hunger Blog publisher Name"),),),
        SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          ),
          width: 500,
          child:TextField(

            maxLines:8 ,
            controller: descriptions,
            decoration: InputDecoration(

                border: InputBorder.none,hintText: "Hunger Blog Descriptions"),),),
        SizedBox(height: 10,),

        Container(
          color: Colors.white,
          width: 500,
          child:ElevatedButton(child: Text('Add Blog Image'),onPressed: (){
            PickImage();
          },),),
        SizedBox(height: 10,),
       loading==false ?
       Container(
          color: Colors.white,
          width: 500,
          child:ElevatedButton(child: Text('Save'),onPressed: (){
            if(title.text.isNotEmpty && descriptions.text.isNotEmpty &&
                creater.text.isNotEmpty&&_image!=null ){
            UploadBlog();
            }

          },),):Container(child: Text("Uploading..."),),
        SizedBox(height: 10,),
      ],
    );
  }
}
