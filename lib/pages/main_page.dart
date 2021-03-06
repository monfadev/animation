import 'package:animation/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:animation/shared/theme.dart';
import 'package:animation/widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _loading
                ? CustomShimmer(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset('assets/logo_monfadev.svg'),
                    ),
                  )
                : Hero(
                    tag: "logo",
                    child: Container(
                      height: 100,
                      width: 100,
                      child: SvgPicture.asset('assets/logo_monfadev.svg'),
                    ),
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
              child: Text("I'm Monfadev", style: TextStyle(fontSize: 20.0, color: blueColor)),
            ),
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ButtonAnimationImplementation(
                buttonText: "Welcome",
                onTab: () {
                  ButtonAnimation.disableButton ? print("Disable true") : print("I'm pressed");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
