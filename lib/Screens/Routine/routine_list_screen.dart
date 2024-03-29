import 'package:adhd/Controllers/Utilites/urls.dart';
import 'package:adhd/Models/routin.dart';
import 'package:adhd/Screens/Routine/bloc/routine_bloc.dart';
import 'package:adhd/Screens/Routine/routine_questions.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Routine/routine_widget.dart';
import 'package:adhd/widgets/Utilities/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutineListScreen extends StatelessWidget {
  static const String id = "routin_list";
  List<RoutinModel> routines = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<RoutineBloc, RoutineState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ListRoutinState) {
          routines = state.routines;
        }
        if (state is ShowRoutinDetailsState) {
          
        }
      },
      builder: (context, state) {
        if (state is ListRoutinState) {
          routines = state.routines;
        }
        return Scaffold(
          backgroundColor: Constants.WHITE_BACKGROUND,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: CustomAppBar(
              title: "",
              isHome: true,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: _routineList(routines),
          ),
        );
      },
    );
  }
}

class _routineList extends StatelessWidget {
  List<RoutinModel> routines = [];
  _routineList(this.routines);

  bool checkAvailable(int index) {
    if (index == 0) {
      return true;
    } else if ((routines[index].isAvailable ?? false)||URL.userType!='Child') {
      return true;
    } else if ((routines[index - 1].isAvailable ?? false||URL.userType!='Child')) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => Opacity(
        opacity: checkAvailable(index) ? 1 : .3,
        child: RoutineWidget(
            routine: routines[index],
            onTap: () {
              if (checkAvailable(index)) {
                Navigator.pushNamed(context, RoutineQuestiionsScreen.id);

                context.read<RoutineBloc>().add(GoRoutinDetailsEvent(
                    routines[index], routines[index].id ?? 0));
              }
            }),
      ),
      // scrollDirection: Axis.horizontal,
      itemCount: routines.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
