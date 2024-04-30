import 'dart:io' show File;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.onPickImage});
  final void Function(File PickedImage) onPickImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _PickedImageFile;
  ///////////////////////
  void  _pickImage() async{
   final XFile? pickedImage = await ImagePicker().pickImage(source: ImageSource.camera,maxWidth: 150,imageQuality: 50,);
   if (pickedImage == null){
     return;
   }
   setState(() {
     _PickedImageFile = File(pickedImage.path);
   });
   widget.onPickImage(_PickedImageFile!);

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:_PickedImageFile== null? null: FileImage(_PickedImageFile!) ,
        ),
        TextButton.icon(onPressed: _pickImage, icon: const Icon(Icons.image),label:  Text('Add Image',style:TextStyle(
          color: Theme.of(context).primaryColor,
        ) ),


    ),
],
    );
  }
}
