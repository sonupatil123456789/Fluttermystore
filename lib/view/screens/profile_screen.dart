import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/utils/constants/colorpallets.dart';
import 'package:mystore/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../components/heading_text.dart';
import '../components/paragraph_text.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ValueNotifier<bool> _enabled = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final dynamic screenhight = MediaQuery.of(context).size.height;
    final dynamic screenwidth = MediaQuery.of(context).size.width;

    late TheamColors theamController = TheamColors();

    theamController = Provider.of<TheamColors>(context, listen: false);

    return Consumer<TheamColors>(
      builder: (BuildContext context, value, Widget? child) {
        return Expanded(
          child: Container(
            color: TheamColors.backgroundColor,
            child: Column(
              children: [
                Container(
                  width: screenwidth,
                  height: screenhight * 0.07,
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: screenwidth * 0.55,
                          child: Row(
                            children: [
                              H1text(
                                fonttext: "Profile",
                                size: screenwidth * 0.046,
                                weight: FontWeight.w700,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Ptext(
                                fonttext: "",
                                size: screenwidth * 0.032,
                                weight: FontWeight.w400,
                              ),
                            ],
                          )),
                      SizedBox(
                        width: screenwidth * 0.30,
                      )
                    ],
                  ),
                ),
                // Card(
                // child:
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.myOrders);
                  },
                  child: const ListTile(
                    tileColor: Colors.black,
                    leading: Icon(
                      Icons.person,
                      size: 29,
                    ),
                    title: Text('Profile'),
                    subtitle: Text('Edit user details'),
                    style: ListTileStyle.list,
                    //  style: Colors.amberAccent,   CupertinoIcons.cube_box_fill
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.myOrders);
                  },
                  child: const ListTile(
                    tileColor: Colors.black,
                    leading: Icon(
                      CupertinoIcons.cube_box_fill,
                      size: 29,
                    ),
                    title: Text('Myorders'),
                    subtitle: Text('Check status of order'),
                    style: ListTileStyle.list,
                    //  style: Colors.amberAccent,
                  ),
                ),

                ListTile(
                  tileColor: Colors.black,
                  leading: Icon(
                    //  Icons. dark_mode,
                    _enabled.value == true ? Icons.dark_mode : Icons.light_mode,
                    size: 29,
                  ),
                  title: Text('Myorders'),
                  subtitle: Text('Check status of order'),
                  trailing: Switch(
                    activeColor: Colors.deepPurpleAccent,
                    onChanged: (bool? value) {
                      theamController.SetDarkMode(value!);
                      _enabled.value = value!;
                    },
                    value: _enabled.value,
                  ),
                  style: ListTileStyle.list,
                  //  style: Colors.amberAccent,
                ),

                InkWell(
                  onTap: () {},
                  child: const ListTile(
                    tileColor: Colors.black,
                    leading: Icon(
                      Icons.logout,
                      size: 29,
                    ),
                    title: Text('Signe Out'),
                    subtitle: Text('Signe out user from user acount'),
                    style: ListTileStyle.list,
                    //  style: Colors.amberAccent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




            // ValueListenableBuilder(
            //   builder: (BuildContext context, value, Widget? child) {
            //     return ListTile(
            //       tileColor: Colors.black,
            //       leading: Icon(
            //         //  Icons. dark_mode,
            //         _enabled.value == true ? Icons.dark_mode : Icons.light_mode,
            //         size: 29,
            //       ),
            //       title: Text('Myorders'),
            //       subtitle: Text('Check status of order'),
            //       trailing: Switch(
            //         activeColor: Colors.deepPurpleAccent,
            //         onChanged: (bool? value) {
            //           _enabled.value = value!;
            //         },
            //         value: _enabled.value,
            //       ),
            //       style: ListTileStyle.list,
            //       //  style: Colors.amberAccent,
            //     );
            //   },
            //   valueListenable: _enabled,
            // ),