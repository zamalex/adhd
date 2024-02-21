import 'package:adhd/Models/media_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utilities/constants.dart';
import '../../../widgets/Media/video_widget.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';
import 'bloc/audio_list_bloc.dart';
import 'bloc/audio_list_status.dart';

class AudioListScreen extends StatefulWidget{
    static const String id = "Audio_list";

  @override
  State<AudioListScreen> createState() => _AudioListScreenState();
}

class _AudioListScreenState extends State<AudioListScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero).then((value) {
      context.read<AudioCubit>().fetchAudios();
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
      body: BlocBuilder<AudioCubit, AudioState>(
        builder: (context,state) {

          return Padding(
            padding: EdgeInsets.all(16),
            child: state is AudioLoading? Center(child: CircularProgressIndicator()): state is AudioLoaded?_AudioList(Audios: state.Audios,):Container() ,
          );
        }
      ),
    );
  }
}
class _AudioList extends StatelessWidget {

  _AudioList({required this.Audios});

  List<Video> Audios=[];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => VideoWidget(video: Audios[index]),
      scrollDirection: Axis.vertical,
      itemCount: Audios.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 23,
      ),
    );
  }
}