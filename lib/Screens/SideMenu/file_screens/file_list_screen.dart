import 'dart:io';

import 'package:adhd/Screens/SideMenu/file_screens/bloc/educational_files_bloc.dart';
import 'package:adhd/widgets/Media/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/media_response.dart';
import '../../../Utilities/constants.dart';
import '../../../widgets/Home/about_adhd_widget.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';
import 'bloc/educational_files_status.dart';

class FileListScreen extends StatefulWidget{
    static const String id = "files_list";

  @override
  State<FileListScreen> createState() => _FileListScreenState();
}

class _FileListScreenState extends State<FileListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      context.read<EducationalFileCubit>().fetchEducationalFiles();
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
      body: BlocBuilder<EducationalFileCubit,EducationalFileState>(
        builder: (context,state) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: state is EducationalFileLoading? Center(child: CircularProgressIndicator()): state is EducationalFileLoaded?_fileList(files: state.files,):Container() ,
          );
        }
      ),
    );
  }
}
class _fileList extends StatelessWidget {
  List<Video> files = [];
  _fileList({required this.files});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemBuilder: (context, index) => VideoWidget(video: files[index]),
      scrollDirection: Axis.vertical,
      itemCount: files.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 23,
      ),
    );
  }
}