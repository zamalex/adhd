import 'package:adhd/Controllers/Utilites/urls.dart';
import 'package:adhd/Models/reports_response.dart';
import 'package:adhd/Screens/SideMenu/Reports/bloc/reports_bloc.dart';
import 'package:adhd/Screens/SideMenu/Reports/bloc/reports_status.dart';
import 'package:adhd/Utilities/static_functions.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utilities/constants.dart';
import '../../../widgets/Report/report_widget.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';

class ReportListScreen extends StatelessWidget {
  static const String id = "reports_list";

  @override
  Widget build(BuildContext context) {

    context.read<ReportsCubit>().fetchReports({
'Extension':'PDF',
      'id':URL.selectedChild?.id??''
    },'Parent');
    // TODO: implement build
    return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "Reports",
        ),
      ),
      body: BlocBuilder<ReportsCubit,ReportsState>(
        builder:(context, state) => Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _buttonTap(),
              SizedBox(
                height: 10,
              ),
              state is ReportsLoading?Center(child: CircularProgressIndicator(),):state is ReportsLoaded?Expanded(child: _fileList(reports: state.reports,)):Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class _fileList extends StatelessWidget {
  List<Report> reports;

  _fileList({required this.reports});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => ReportWidget(report: reports[index],),
      scrollDirection: Axis.vertical,
      itemCount: reports.length,
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
          _button(title: "Parent"),
          const SizedBox(
            width: 10,
          ),
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
            onTap: () {
              context.read<ReportsCubit>().fetchReports({
                'Extension':'PDF',
                'id':URL.selectedChild?.id??''
              },title);
            },
            child: Center(
                child: Text(
              title,
              style: TextStyle(color: Constants.WHITE_BACKGROUND),
            ))),
      ),
    );
  }
}
