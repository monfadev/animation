import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: "logo",
        child: Container(
          width: double.infinity,
          color: blueColor,
          child: SvgPicture.asset(
            'assets/logo_monfadev.svg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
