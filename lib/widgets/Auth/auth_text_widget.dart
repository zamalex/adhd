import 'package:flutter/cupertino.dart';

import '../../Utilities/constants.dart';

class AuthMainTitleWidget extends StatelessWidget {
  String title;

  AuthMainTitleWidget({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      maxLines: 2,
      style: TextStyle(
          color: Constants.MAIN_TEXT_COLOR,
          fontSize: 22,
          fontWeight: FontWeight.bold),
    );
  }
}

// class AuthSubTitleWidget extends StatelessWidget {
//   String title;

//   AuthSubTitleWidget({Key? key, required this.title}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color: Constants.MAIN_TEXT_COLOR,
//           fontSize: 14,
//           fontWeight: FontWeight.bold),
//     );
//   }
// }

// class AuthTextTitleWidget extends StatelessWidget {
//   String title;

//   AuthTextTitleWidget({Key? key, required this.title}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color: Constants.MAIN_TEXT_COLOR,
//           fontSize: 16,
//           fontWeight: FontWeight.bold),
//     );
//   }
// }

// class YellowTextTitleWidget extends StatelessWidget {
//   String title;

//   YellowTextTitleWidget({Key? key, required this.title}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color: Constants.YELLOW_COLOR,
//           fontSize: 16,
//           fontWeight: FontWeight.bold),
//     );
//   }
// }

// class MoreDarkTextTitleWidget extends StatelessWidget {
//   String title;

//   MoreDarkTextTitleWidget({Key? key, required this.title}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color: Constants.MORE_DARK_GREY,
//           fontSize: 16,
//           fontWeight: FontWeight.normal),
//     );
//   }
// }

// class PrimaryColorkTextTitleWidget extends StatelessWidget {
//   String title;

//   PrimaryColorkTextTitleWidget({Key? key, required this.title}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color: Constants.PRIMARY_COLOR,
//           fontSize: 16,
//           fontWeight: FontWeight.normal),
//     );
//   }
// } 
// class NormalWhiteTextTitleWidget extends StatelessWidget {
//   String title;

//   NormalWhiteTextTitleWidget({Key? key, required this.title}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color: Constants.WHITE_BACKGROUND,
//           fontSize: 16,
//           fontWeight: FontWeight.normal),
//     );
//   }
// }

// class YellowReqularTextTitleWidget extends StatelessWidget {
//   String title;

//   YellowReqularTextTitleWidget({Key? key, required this.title})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color: Constants.YELLOW_COLOR,
//           fontSize: 14,
//           fontWeight: FontWeight.normal),
//     );
//   }
// }

// class ReqularTextTitleWidget extends StatelessWidget {
//   String title;

//   ReqularTextTitleWidget({Key? key, required this.title}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color: Constants.MAIN_TEXT_COLOR,
//           fontSize: 16,
//           fontWeight: FontWeight.normal),
//     );
//   }
// }

// class TextTitleWidget extends StatelessWidget {
//   String title;
//   Color? color;
//   TextTitleWidget({Key? key, required this.title, this.color})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color: color ?? Constants.WHITE_BACKGROUND,
//           fontSize: 16,
//           fontWeight: FontWeight.bold),
//     );
//   }
// }
// class SmallTextTitleWidget extends StatelessWidget {
//   String title;
//   Color? color;
//   SmallTextTitleWidget({Key? key, required this.title, this.color})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color: color ?? Constants.WHITE_BACKGROUND,
//           fontSize: 12,
//           fontWeight: FontWeight.bold),
//     );
//   }
// }
// class BlackTextTitleWidget extends StatelessWidget {
//   String title;
//   BlackTextTitleWidget({Key? key, required this.title})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color:Constants.BLACK_TEXT_COLOR,
//           fontSize: 16,
//           fontWeight: FontWeight.bold),
//     );
//   }
// }
// class BlackReqularTextTitleWidget extends StatelessWidget {
//   String title;
//   BlackReqularTextTitleWidget({Key? key, required this.title})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Text(
//       title,
//       maxLines: 2,
//       style: TextStyle(
//           color:Constants.BLACK_TEXT_COLOR,
//           fontSize: 14,
//           fontWeight: FontWeight.normal),
//     );
//   }
// }
//الملف الشخصي