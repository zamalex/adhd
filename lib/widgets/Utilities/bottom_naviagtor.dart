// import 'package:flutter/material.dart';



// class BottomNavogator extends StatefulWidget {
//   int selectedIndex = 0;
//   GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();

//   BottomNavogator(
//       {super.key, required this.selectedIndex, required this.sideMenuKey});

//   @override
//   State<BottomNavogator> createState() => _BottomNavogatorState();
// }

// class _BottomNavogatorState extends State<BottomNavogator> {
//   //New
//   void _onItemTapped(int index) {
//     // setState(() {
//     //   widget.selectedIndex = index;
//     // });
//     if (index == 0) {
//       Navigator.pushReplacementNamed(context, HomeScreen.id);
//     } else if (index == 1) {
//       Navigator.pushReplacementNamed(context, MyordersListScreren.id);
//     } else if (index == 2) {
//       Navigator.pushReplacementNamed(context, OfferListScreen.id);
//     } else if (index == 3) {
//       final _state = widget.sideMenuKey.currentState;
//       if (_state != null) {
//         if (_state.isOpened)
//           _state.closeSideMenu(); // close side menu
//         else
//           _state.openSideMenu();
//       }
//     }
//     // final _state = _sideMenuKey.currentState;
//     //             if (_state.isOpened)
//     //               _state.closeSideMenu(); // close side menu
//     //             else
//     //               _state.openSideMenu();// open side menu
//     //           },
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return BottomNavigationBar(
//         currentIndex: widget.selectedIndex, //New
//         onTap: _onItemTapped,
//         selectedItemColor: Constants.PRIMARY_COLOR,
//         elevation: 2,
//         unselectedItemColor: Constants.MORE_DARK_GREY,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               "assets/images/Home@3x.png",
//               width: 24,
//               height: 24,
//             ),
//             activeIcon: Image.asset(
//               "assets/images/Home Selected@3x.png",
//               width: 24,
//               height: 24,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               "assets/images/Delivery Charge Icon@3x.png",
//               width: 24,
//               height: 24,
//             ),
//             label: 'My Orders',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               "assets/images/Offers@3x.png",
//               width: 24,
//               height: 24,
//             ),
//             label: 'Offers',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               "assets/images/Profile@3x.png",
//               width: 24,
//               height: 24,
//             ),
//             label: 'Profile',
//           ),
//         ]);
//   }
// }
