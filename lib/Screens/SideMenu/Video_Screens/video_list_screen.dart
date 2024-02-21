import 'package:adhd/Screens/SideMenu/Video_Screens/bloc/video_list_status.dart';
import 'package:adhd/widgets/Media/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/media_response.dart';
import '../../../Utilities/constants.dart';
import '../../../widgets/Home/about_adhd_widget.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';
import 'bloc/vidoes_list_bloc.dart';

class VideoListScreen extends StatefulWidget{
    static const String id = "video_list";

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero).then((value) {
      context.read<VideoCubit>().fetchVideos();
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
          title: "",
        ),
      ),
      body: BlocBuilder<VideoCubit, VideoState>(
        builder: (context,state) {

          return Padding(
            padding: EdgeInsets.all(16),
            child: state is VideoLoading? Center(child: CircularProgressIndicator()): state is VideoLoaded?_videoList(videos: state.videos,):Container() ,
          );
        }
      ),
    );
  }
}
class _videoList extends StatelessWidget {

  _videoList({required this.videos});

  List<Video> videos=[];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => VideoWidget(video: videos[index]),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 23,
      ),
    );
  }
}