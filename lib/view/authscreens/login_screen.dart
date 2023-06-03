import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystore/controllers/auth_controller.dart';
import 'package:mystore/utils/constants/colorpallets.dart';
import 'package:mystore/utils/constants/data_list.dart';
import 'package:mystore/view/components/coustom_textfield.dart';
import 'package:mystore/view/authscreens/signeup_screen.dart';
import 'package:provider/provider.dart';

import '../../utils/input_field_utils.dart';
import '../../utils/listners_utils.dart';
import '../../utils/routes/routes_name.dart';
import '../components/coustom_button.dart';
// import 'package:mystore/view/screens/signeup_screen.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final formkey = GlobalKey<FormState>();

  late Map inputFieldData;

  @override
  Widget build(BuildContext context) {
    print("builtmethod login ran");
    final authController = Provider.of<AuthController>(context, listen: false);
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
        // color: Colors.green,
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
                  "LogIn",
                  style: GoogleFonts.poppins(
                      fontSize: screenwidth * 0.12,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 20,
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
                            child:
                                Text("Loading... ${value.loading.toString()}"))
                        : CommonButton(
                            width: screenwidth * 0.80,
                            height: screenheight * 0.056,
                            btnTitle: "Log In ${value.loading.toString()}",
                            btnColor: TheamColors.primaryColor,
                            onTapHandler: () {
                              if (InputFielUtils.emailController.text == null ||
                                  InputFielUtils.emailController.text.isEmpty) {
                                ListnersUtils.showFlushbarMessage(
                                    "Email field should not be empty",
                                    Colors.redAccent,
                                    TheamColors.PtexrtColor2,
                                    "Error",
                                    Icons.done,
                                    context);
                                return 'Email field should not be empty';
                              }
                              if (InputFielUtils.passowrdController.text !=
                                      null &&
                                  InputFielUtils
                                          .passowrdController.text.length <
                                      8) {
                                ListnersUtils.showFlushbarMessage(
                                    "Password is too short",
                                    Colors.redAccent,
                                    TheamColors.PtexrtColor2,
                                    "Error",
                                    Icons.done,
                                    context);
                                return 'Password is too short';
                              } else {
                                inputFieldData = {
                                  "email": InputFielUtils.emailController.text
                                      .toString(),
                                  "password": InputFielUtils
                                      .passowrdController.text
                                      .toString()
                                };
                                authController.loginUserController(
                                    inputFieldData, context);
                              }
                            });
                  },
                ),
                SizedBox(
                  height: screenheight * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenwidth * 0.52, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot password",
                      style: GoogleFonts.notoSans(
                          fontSize: screenwidth * 0.032,
                          color: TheamColors.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ]),
        ));
  }

  // @override
  // void dispose() {
  //   InputFielUtils.passowrdController.dispose();
  //   InputFielUtils.emailController.dispose();
  //   InputFielUtils.nameController.dispose();
  //   super.dispose();
  // }
}
