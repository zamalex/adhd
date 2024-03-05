import 'package:adhd/Models/routin.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/image_neetwork_widget.dart';
import 'package:flutter/material.dart';

class RoutineWidget extends StatelessWidget {
  Function onTap;
  RoutinModel routine;
  RoutineWidget({super.key, required this.onTap, required this.routine});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 103,
        decoration: BoxDecoration(
          color: Constants.WHITE_BACKGROUND,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Card(
          elevation: 6,
          color: Constants.WHITE_BACKGROUND,
          surfaceTintColor: Constants.WHITE_BACKGROUND,
          child: Row(
          
            children: [
              Container(
                height: 103,
                width: 103,
                decoration: BoxDecoration(
                  color: Constants.MAIN_COLOR,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                padding: const EdgeInsets.all(5),
                child: ImageeNetworkWidget(image:routine.image ?? "" , height: 103, width: 103,)
                //Image.network(routine.image ?? ""),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    routine.titleEn ?? "",
                    style: const TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("${routine.duration ?? 0} min",
                      style: const TextStyle(fontSize: 14))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
