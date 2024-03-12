import 'package:adhd/Controllers/Utilites/urls.dart';
import 'package:adhd/Models/sub_user.dart';
import 'package:adhd/Screens/Routine/routine_list_screen.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/bloc/daily_notes_bloc.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/bloc/daily_notes_states.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/daily_notes_questions.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/Utilities/static_functions.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/Daily Notes Quitiions/daily_notes_questions_widget.dart';
import '../../Routine/bloc/routine_bloc.dart';

class DailyNotesSubUsersScreen extends StatefulWidget {
  static const String id = "daily_notes_sub_users_screen";

  @override
  State<DailyNotesSubUsersScreen> createState() => _DailyNotesSubUsersScreenState();
}

class _DailyNotesSubUsersScreenState extends State<DailyNotesSubUsersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero).then((value) {
      context.read<DailyNotesCubit>().getSubUsersList();
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Constants.WHITE_BACKGROUND,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(52),
        child: CustomAppBar(
          title: "Patients",
        ),
      ),
      body: BlocBuilder<DailyNotesCubit,DailyNotesState>(
        builder:(c,state) {


          return state is DailyNotesLoadingState?Center(child: CircularProgressIndicator(),):Padding(
            padding: EdgeInsets.all(16),
            child: _dailyNotesSubUsersList(subUsers: context.read<DailyNotesCubit>().subUsers,)
          );
        }
      ),
    );
  }
}

class _dailyNotesSubUsersList extends StatelessWidget {
  List<SubUser> subUsers = [];

  _dailyNotesSubUsersList({required this.subUsers});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => SubUserWidget(subUser: subUsers[index],),
      // scrollDirection: Axis.horizontal,
      itemCount: subUsers.length,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20,
      ),
    );
  }
}

class SubUserWidget extends StatelessWidget {
  SubUserWidget({super.key,required this.subUser});
  SubUser subUser;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${subUser.firstName} ${subUser.lastName}'),
      subtitle: Text(subUser.email??''),
      onTap: () {
        if(URL.userType=='Teacher') {
          context.read<RoutineBloc>().add(InitialRoutinEvent(subUser: subUser));

          Navigator.pushNamed(
              context, RoutineListScreen.id, arguments: subUser);
        }
        else if(URL.userType=='Parent') {
          URL.selectedChild = subUser;

          StaticFunctions.saveChild(subUser);

          context.read<RoutineBloc>().add(InitialRoutinEvent(subUser: subUser));

          Navigator.pushNamed(
              context, RoutineListScreen.id, arguments: subUser);
        }else
        Navigator.pushNamed(context, DailyNotesQuestionsScreen.id,arguments: subUser);
      },
    );
  }
}
