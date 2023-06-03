import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 300,height: 300,color: Colors.amber,
      child: IconButton(
        icon: Icon(Icons.abc),
        onPressed: () {
       
        },
      ),
    );
  }


}
