import 'dart:ui';

// import 'package:badges/badges.dart' as badges;
import 'package:adhd/Screens/SideMenu/sidemenu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';

import '../../Utilities/constants.dart';

// import 'package:url_launcher/url_launcher.dart'; // import this

class CustomAppBar extends StatefulWidget {
  String title;
  bool haveDrawer;
  bool isHome;
  bool isProfile;

  bool isOrders;
  Function? didPhoneTap;
  // bool isArtistProfile;

  CustomAppBar({
    Key? key,
    required this.title,
    this.haveDrawer = false,
    this.isHome = false,
    this.isProfile = false,
    this.isOrders = false,
    this.didPhoneTap,

    // this.isArtistProfile = false
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  void showFilterDialog(BuildContext context) {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) => Filter(),
    // );
  }

  @override
  Widget build(context) {
    return
        //  PreferredSize(
        //       preferredSize: const Size.fromHeight(52),
        //       child:
        AppBar(
      backgroundColor: Constants.WHITE_BACKGROUND,

      foregroundColor: Constants.WHITE_BACKGROUND,
      automaticallyImplyLeading: true,
      elevation: 0,
      centerTitle: false,

      leading: widget.isHome
          ? const SizedBox(
              width: 0,
            )
          : widget.haveDrawer
              ? TextButton(
                  child: Image.asset("assets/images/Group 4664@3x.png"),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                )
              : (Navigator.canPop(context) && !widget.isHome)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => {Navigator.of(context).pop()},
                            child: SizedBox(
                              width: 45,
                              height: 45,
                              child: Center(
                                child: Image.asset(
                                  "assets/images/ic_round-arrow-back.png",
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(width: 10,),
                        ],
                      ),
                    )
                  : const SizedBox(),
      // leading:
      actions: [
        if (widget.isHome || widget.isOrders)
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, SideMenuScreen.id);
              },
              child: Container(
                height: 48,
                width: 48,
                child: Center(
                  child: Image.asset(Constants.LOCAL_IMAGE_PATH + "dot-horizontal.png"),
                    // child: badges.Badge(
                    //   badgeContent: Text(
                    //     '${Constants.CART_ITEMS_COUNT}',
                    //     style: TextStyle(color: Colors.white, fontSize: 10),
                    //   ),
                    //   // badgeColor: Constants.PRIMARY_COLOR,
                    //   // color:Constants.PRIMARY_COLOR,
                    //   badgeStyle: badges.BadgeStyle(
                    //     badgeColor: Constants.PRIMARY_COLOR,
                    //   ),
                    //   child: Image.asset(
                    //     "assets/images/Icon feather-shopping-bag@3x.png",
                    //     height: 20,
                    //     width: 20,
                    //   ),
                    // ),
                    ),
              ),
            ),
          ),

        // if (isHome)
        //   Padding(
        //     padding: const EdgeInsets.only(left: 15.0),
        //     child: Center(
        //       child: InkWell(
        //         onTap: () => showFilterDialog(context),
        //         child: Container(
        //           height: 40,
        //           width: 40,

        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //             color: Colors.white,
        //           ),
        //           child: Center(
        //             child: Image.asset(
        //               "assets/images/Filter 2@3x.png",
        //               height: 20,
        //               width: 20,
        //             ),
        //           ),
        //           // shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        //         ),
        //       ),
        //     ),
        //   ),
      ],
      title: widget.isHome
          ? InkWell(
              onTap: () {
                // Navigator.pushNamed(context, EditLocationScreen.id).then((_) => setState(() {}));;
              },
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/4916639-01 1.png",
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "ADHD".tr(),
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: Constants.FONT_FAMILY_NAME),
                  ),
                ],
              ),
            )
          : Text(
              widget.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
      //  )
    );
  }
}
