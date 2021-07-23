import 'package:flutter/material.dart';
import 'package:myproject_animation/shared/theme.dart';
import 'package:myproject_animation/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top + 50,
            ),
            Container(
              height: 100,
              width: 100,
              child: SvgPicture.asset('assets/logo_monfadev.svg'),
            ),
            SizedBox(
              height: 50,
            ),
            DelayedAnimation(
              aniDuration: 700,
              aniOffsetX: 0.0,
              aniOffsetY: 0.35,
              delayedAnimation: 500,
              child: Text(
                "Hi",
                style: TextStyle(fontSize: 20.0, color: blueColor),
              ),
            ),
            DelayedAnimation(
              aniDuration: 700,
              aniOffsetX: 0.0,
              aniOffsetY: 0.35,
              delayedAnimation: 1000,
              child: Text("I'm Monfadev",
                  style: TextStyle(fontSize: 20.0, color: blueColor)),
            ),
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ButtonAnimationImplementation(
                buttonText: "Welcome",
                onTab: () {
                  ButtonAnimation.disableButton
                      ? print("Disable true")
                      : print("I'm pressed");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
