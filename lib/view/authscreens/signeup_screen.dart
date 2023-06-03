import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mystore/controllers/auth_controller.dart';
import 'package:mystore/utils/constants/colorpallets.dart';
import 'package:mystore/utils/constants/data_list.dart';
import 'package:mystore/utils/routes/routes_name.dart';
import 'package:mystore/view/components/coustom_textfield.dart';
import 'package:provider/provider.dart';

import '../../utils/input_field_utils.dart';
import '../../utils/listners_utils.dart';
import '../components/coustom_button.dart';

class SigneupScreen extends StatefulWidget {
  @override
  State<SigneupScreen> createState() => _SigneupScreenState();
}

class _SigneupScreenState extends State<SigneupScreen> {
  final formkey = GlobalKey<FormState>();

  late Map inputFieldData = {};

  @override
  Widget build(BuildContext context) {
    print("builtmethod signeup ran");
    final authController = Provider.of<AuthController>(context, listen: false);
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenheight * 0.80,
      alignment: Alignment.center,
      child: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenheight * 0.06,
              ),
              Text(
                "SigneUp",
                style: GoogleFonts.poppins(
                    fontSize: screenwidth * 0.12, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 20,
              ),
              CoustomTextfield(
                controller: InputFielUtils.nameController,
                isPasswordTextField: false,
                labelText: 'Name',
                maxline: 1,
                placeholder: 'Enter your name',
                width: screenwidth * 0.80,
                FocusNodeNames: InputFielUtils.nameFocusNode,
                changeFocusNode: InputFielUtils.emailFocusNode,
                iconName: Icons.person,
              ),
              CoustomTextfield(
                controller: InputFielUtils.emailController,
                isPasswordTextField: false,
                labelText: 'Email',
                maxline: 1,
                placeholder: 'Enter your email',
                width: screenwidth * 0.80,
                FocusNodeNames: InputFielUtils.emailFocusNode,
                changeFocusNode: InputFielUtils.passwordFocusNode,
                iconName: Icons.email,
              ),
              CoustomTextfield(
                controller: InputFielUtils.passowrdController,
                isPasswordTextField: true,
                labelText: 'Password',
                maxline: 1,
                placeholder: 'Enter your password',
                width: screenwidth * 0.80,
                FocusNodeNames: InputFielUtils.passwordFocusNode,
                changeFocusNode: InputFielUtils.passwordFocusNode,
                iconName: Icons.lock,
              ),
              SizedBox(
                height: screenheight * 0.03,
              ),
              Consumer<AuthController>(
                builder: (BuildContext context, value, Widget? child) {
                  return value.loading == true
                      ? Container(
                          width: screenwidth * 0.80,
                          height: screenheight * 0.056,
                          alignment: Alignment.center,
                          child: Text("Loading... ${value.loading.toString()}"))
                      : CommonButton(
                          width: screenwidth * 0.80,
                          height: screenheight * 0.056,
                          btnTitle: "signe Up ${value.loading.toString()}",
                          btnColor: TheamColors.primaryColor,
                          onTapHandler: () {
                            if (InputFielUtils.nameController.text == null ||
                                InputFielUtils.nameController.text.isEmpty) {
                              ListnersUtils.showFlushbarMessage(
                                  "Name field should not be empty",
                                  Colors.redAccent,
                                  TheamColors.PtexrtColor2,
                                  "Error",
                                  Icons.error,
                                  context);
                            } else if (InputFielUtils.emailController.text ==
                                    null ||
                                InputFielUtils.emailController.text.isEmpty) {
                              ListnersUtils.showFlushbarMessage(
                                  "Email field should not be empty",
                                  Colors.redAccent,
                                  TheamColors.PtexrtColor2,
                                  "Error",
                                  Icons.error,
                                  context);
                            } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(
                                InputFielUtils.emailController.text
                                    .toString())) {
                              ListnersUtils.showFlushbarMessage(
                                  "EmailId is not valid",
                                  Colors.redAccent,
                                  TheamColors.PtexrtColor2,
                                  "Error",
                                  Icons.error,
                                  context);
                            } else if (InputFielUtils.passowrdController.text !=
                                    null &&
                                InputFielUtils.passowrdController.text.length <
                                    8) {
                              ListnersUtils.showFlushbarMessage(
                                  "Password is too short",
                                  Colors.redAccent,
                                  TheamColors.PtexrtColor2,
                                  "Error",
                                  Icons.error,
                                  context);
                            } else {
                              inputFieldData = {
                                "fullName": InputFielUtils.nameController.text
                                    .toString(),
                                "email": InputFielUtils.emailController.text
                                    .toString(),
                                "password": InputFielUtils
                                    .passowrdController.text
                                    .toString()
                              };
                              print(inputFieldData);
                              authController.registerUserController(
                                  inputFieldData, context);
                            }
                          });
                },
              ),
            ]),
      ),
    );
  }
}
