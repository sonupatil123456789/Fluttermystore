import 'package:flutter/material.dart';
import 'package:mystore/view/authscreens/login_screen.dart';
import 'package:mystore/view/authscreens/signeup_screen.dart';
import '../../utils/input_field_utils.dart';
import '../components/coustom_textfield.dart';
import '../components/heading_text.dart';
import '../components/navbar.dart';

class EditUserDetailsScreen extends StatefulWidget {
  EditUserDetailsScreen({super.key});

  @override
  State<EditUserDetailsScreen> createState() => _EditUserDetailsScreenState();
}

class _EditUserDetailsScreenState extends State<EditUserDetailsScreen> {
  ValueNotifier<bool> checkAuthScreen = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: ValueListenableBuilder(
          builder: (BuildContext context, value, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Navbar(  
                  isVisible: false,
                  title: 'Edit Userdetails',
                  subtitle: '',
                  cart: false,
                  filter: false,
                  search: false,
                  backButton: true,
                  cartCount: null,
                ),
                SizedBox(
                  height: screenheight * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H1text(
                        fonttext: "Full Name",
                        weight: FontWeight.w500,
                        size: screenwidth * 0.036),
                    SizedBox(
                      height: screenheight * 0.006,
                    ),
                    CoustomTextfield(
                      controller: InputFielUtils.emailController,
                      isPasswordTextField: false,
                      labelText: 'Name',
                      maxline: 1,
                      placeholder: 'Enter your Name',
                      width: screenwidth * 0.80,
                      FocusNodeNames: InputFielUtils.emailFocusNode,
                      changeFocusNode: InputFielUtils.passwordFocusNode,
                      iconName: Icons.person,
                    ),
                  ],
                ),
//////////////////////////////////////////////////////////////////////
                SizedBox(
                  height: screenheight * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H1text(
                        fonttext: "Email",
                        weight: FontWeight.w500,
                        size: screenwidth * 0.036),
                    SizedBox(
                      height: screenheight * 0.006,
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
                  ],
                ),
//////////////////////////////////////////////////////////////////////
                SizedBox(
                  height: screenheight * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H1text(
                        fonttext: "Mobile Number",
                        weight: FontWeight.w500,
                        size: screenwidth * 0.036),
                    SizedBox(
                      height: screenheight * 0.006,
                    ),
                    CoustomTextfield(
                      controller: InputFielUtils.emailController,
                      isPasswordTextField: false,
                      labelText: 'Mobile Number',
                      maxline: 1,
                      placeholder: 'Enter your Number',
                      width: screenwidth * 0.80,
                      FocusNodeNames: InputFielUtils.emailFocusNode,
                      changeFocusNode: InputFielUtils.passwordFocusNode,
                      iconName: Icons.numbers,
                    ),
                  ],
                ),
//////////////////////////////////////////////////////////////////////
                SizedBox(
                  height: screenheight * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H1text(
                        fonttext: "BirthDate",
                        weight: FontWeight.w500,
                        size: screenwidth * 0.036),
                    SizedBox(
                      height: screenheight * 0.006,
                    ),
                    CoustomTextfield(
                      controller: InputFielUtils.emailController,
                      isPasswordTextField: false,
                      labelText: 'BirthDate',
                      maxline: 1,
                      placeholder: 'Enter your BirthDate',
                      width: screenwidth * 0.80,
                      FocusNodeNames: InputFielUtils.emailFocusNode,
                      changeFocusNode: InputFielUtils.passwordFocusNode,
                      iconName: Icons.calendar_month,
                    ),
                  ],
                ),
//////////////////////////////////////////////////////////////////////
                SizedBox(
                  height: screenheight * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H1text(
                        fonttext: "Address",
                        weight: FontWeight.w500,
                        size: screenwidth * 0.036),
                    SizedBox(
                      height: screenheight * 0.006,
                    ),
                    CoustomTextfield(
                      controller: InputFielUtils.emailController,
                      isPasswordTextField: false,
                      labelText: 'Address',
                      maxline: 2,
                      placeholder: 'Enter your Full Address',
                      width: screenwidth * 0.80,
                      FocusNodeNames: InputFielUtils.emailFocusNode,
                      changeFocusNode: InputFielUtils.passwordFocusNode,
                      iconName: Icons.local_shipping,
                    ),
                  ],
                )
              ],
            );
          },
          valueListenable: checkAuthScreen,
        ),
      )),
    );
    // : NoInternet();
  }

  // @override
  // void dispose() {
  //   InputFielUtils.passowrdController.dispose();
  //   InputFielUtils.emailController.dispose();
  //   InputFielUtils.nameController.dispose();
  //   super.dispose();
  // }
}
