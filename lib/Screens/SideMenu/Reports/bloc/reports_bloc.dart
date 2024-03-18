import 'package:adhd/Controllers/media_controller.dart';
import 'package:adhd/Models/media_response.dart';
import 'package:adhd/Models/reports_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'reports_status.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsInitial());

  void fetchReports(Map<String,String> q) async {
    emit(ReportsLoading());

    try {
      // Simulate fetching data from an API
      List<Report> files = await MediaController.getReportsList(q);

      // Replace this with your actual API call to get educational files


      emit(ReportsLoaded(files));
    } catch (e) {
      emit(ReportsError('Failed to fetch reports. Error: $e'));
    }
  }
}
