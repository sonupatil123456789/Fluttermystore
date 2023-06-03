import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker pickedFile = ImagePicker();

class InputFielUtils {


  late String ImagePath = "";
  late String ImageName = "";
  late File imageFile = File("");
  late Map imageDetails = <dynamic, dynamic>{};

  late Map<String, String> inputFieldData;

  // login trextfield controllers
  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passowrdController = TextEditingController();

  static FocusNode emailFocusNode = FocusNode();
  static FocusNode passwordFocusNode = FocusNode();
  static FocusNode nameFocusNode = FocusNode();

  void disposeControllers() {
    InputFielUtils.passowrdController.dispose();
    InputFielUtils.emailController.dispose();
    InputFielUtils.nameController.dispose();
  }

  Future imagePicker() async {
    final XFile? image =
        await pickedFile.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      ImagePath = image!.path;
      ImageName = "${DateTime.now()}_${image.name}";
      imageFile = File(ImagePath);
      print(ImagePath);
      print(imageFile);
      imageDetails = {"imageFilePath": ImagePath, "imageName": ImageName};
      return imageDetails;
    }
  }
}
