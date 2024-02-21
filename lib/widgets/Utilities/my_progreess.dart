import 'package:flutter/material.dart';

import '../../Utilities/constants.dart';

class MyProgressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: CircularProgressIndicator(
        color: Constants.MAIN_COLOR,
      ),
    );
  }
}
