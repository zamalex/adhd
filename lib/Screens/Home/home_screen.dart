import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Home/about_adhd_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/Utilities/custom_appbar_widget.dart';

class HomeScreen extends StatelessWidget {
    static const String id = "home";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "",
          isHome: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About adhd",
              style: TextStyle(fontSize: 32),
            ),
            _aboutADHD(),
           _info()
          ],
        ),
      ),
    );
  }
}

class _aboutADHD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 286,
      child: ListView.separated(
        itemBuilder: (context, index) => AboutADHDWidget(),
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 23,
        ),
      ),
    );
  }
}
class _info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 286,
      child: ListView.separated(
        itemBuilder: (context, index) => AboutADHDWidget(),
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 23,
        ),
      ),
    );
  }
}
