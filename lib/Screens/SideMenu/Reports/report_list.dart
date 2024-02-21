import 'package:adhd/Utilities/static_functions.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:flutter/material.dart';

import '../../../Utilities/constants.dart';
import '../../../widgets/Report/report_widget.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';

class ReportListScreen extends StatelessWidget {
  static const String id = "reports_list";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "Reports",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buttonTap(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: _fileList()),
          ],
        ),
      ),
    );
  }
}

class _fileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => ReportWidget(),
      scrollDirection: Axis.vertical,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 40,
        child: Center(
          child: Container(
            color: Constants.LIGHT_MAIN_COLOR,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _buttonTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Constants.LIGHT_MAIN_COLOR),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _button(title: "Psychologist"),
          const SizedBox(
            width: 10,
          ),
          _button(title: "Teacher"),
          const SizedBox(
            width: 10,
          ),
          _button(title: "Trainer"),
        ],
      ),
    );
  }
}

class _button extends StatelessWidget {
  var title;
  _button({required this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Constants.MAIN_COLOR),
        child: InkWell(
            onTap: () {},
            child: Center(
                child: Text(
              title,
              style: TextStyle(color: Constants.WHITE_BACKGROUND),
            ))),
      ),
    );
  }
}
