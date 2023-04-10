import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class inputImageWidget extends StatefulWidget {
  final authVM;
  const inputImageWidget({super.key, this.authVM});

  @override
  State<inputImageWidget> createState() => _inputImageWidgetState();
}

class _inputImageWidgetState extends State<inputImageWidget> {
  //image picker
  File? _image;
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> getGalleryImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() async {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref('/userimages' + id);
        firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);
        await Future.value(uploadTask);
        widget.authVM.setImageController(await ref.getDownloadURL()) ;
        setState(() {});
        print("khushi ${widget.authVM.setImageController.toString()}");
      } else {
        print('no image picked');
      } 
    });}
    
  var id = DateTime.now().millisecondsSinceEpoch.toString();
  String profileimg = "https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg";
    @override
    Widget build(BuildContext context) {
      return InkWell(
                        onTap: () {
                          
                          getGalleryImage();
                          
                        },
                        child: Obx((){ return CircleAvatar(
                          radius: 80,
                          backgroundImage:  NetworkImage( widget.authVM.imageController.toString() == '' ?  profileimg : widget.authVM.imageController.toString()),
                          backgroundColor: Color.fromARGB(255, 239, 237, 237),
                        );}) 
                      );
    }
  }

