import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

class BuildNoInternet extends StatelessWidget {
  const BuildNoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/undraw_server_down_s4lk.png',
            ),
            const SizedBox(height: 20,),

            const Text(
              'can\'t connect... check internet',
              style: TextStyle(color: MyColors.myGrey, fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}
