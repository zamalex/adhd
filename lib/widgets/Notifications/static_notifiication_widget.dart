import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:voice_message_package/voice_message_package.dart';

class StaticNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "you did agreat job",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(
                width: 10,
              ),

              InkWell(
                onTap: (){
                  
                },
                child: Image.asset(Constants.LOCAL_IMAGE_PATH + "HeroIcon (TailWind)-2.png",  height: 30,
                  width: 20,),
              ),
           
            ],
          ),
        ],
      ),
    );
  }
}
