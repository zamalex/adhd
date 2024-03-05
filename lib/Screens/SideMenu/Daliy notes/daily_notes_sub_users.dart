import 'package:adhd/Models/sub_user.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/bloc/daily_notes_bloc.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/bloc/daily_notes_states.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/daily_notes_questions.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/Daily Notes Quitiions/daily_notes_questions_widget.dart';

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
          title: "Daily Notes sub Users",
        ),
      ),
      body: BlocBuilder<DailyNotesCubit,DailyNotesState>(
        builder:(c,state) {


          return state is DailyNotesLoadingState?Center(child: CircularProgressIndicator(),): state is ListSubUsersState? Padding(
            padding: EdgeInsets.all(16),
            child: _dailyNotesSubUsersList(subUsers: state.subUsers,),
          ):Container();
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
        Navigator.pushNamed(context, DailyNotesQuestionsScreen.id);
      },
    );
  }
}
