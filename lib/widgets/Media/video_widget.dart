import 'package:adhd/Screens/SideMenu/media_webview.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:adhd/widgets/Utilities/image_neetwork_widget.dart';
import 'package:flutter/material.dart';

import '../../Models/media_response.dart';
import '../../Screens/SideMenu/Video_Screens/bloc/video_list_status.dart';

class VideoWidget extends StatelessWidget {
//   @override
//   State<VideoWidget> createState() => _VideoWidgetState();
// }

// class _VideoWidgetState extends State<VideoWidget> {
//   final videoPlayerController = VideoPlayerController.network(
//       'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //    videoPlayerController.dispose();
  // // chewieController.dispose();
  //   super.dispose();
  // }

  Video? video;

  VideoWidget({this.video});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () async {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MediaWebView(
            video: video,
          ),
        ));
        print("fdsfs");
        // await videoPlayerController.initialize();

        // final chewieController = ChewieController(
        //   videoPlayerController: videoPlayerController,
        //   autoPlay: true,
        //   looping: true,
        // );

        // final playerWidget = Chewie(
        //   controller: chewieController,
        // );
        //                 chewieController.enterFullScreen();
      },
      // child: Stack(
      //   children: [
      //     RoundedImageeNetworkWidget(
      //       height: 200,
      //       image:
      //           video!.image??"https://epe.brightspotcdn.com/d5/8b/827913334eb5af8201910afbfc8b/adhd.jpg",
      //     ),
      //     Positioned(
      //       left: 15,
      //       right: 15,
      //       bottom: 15,
      //       child: Text(
      //         video!.titleEn??"Self Help",
      //         style: TextStyle(fontSize: 24, color: Constants.WHITE_BACKGROUND),
      //       ),
      //     ),
      //   ],
      // ),
      child: Card(
        elevation: 2,
        color: Constants.WHITE_BACKGROUND,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:10, vertical: 16),
            child: Text(
              video!.titleEn ?? "Self Help",
              style: TextStyle(fontSize: 24, color: Constants.MAIN_COLOR),
            ),
          ),
        ),
      ),
    );
  }
}
