import 'dart:async';
import 'dart:io';

import 'package:adhd/Controllers/Utilites/urls.dart';
import 'package:adhd/Screens/SideMenu/Notification/audio_player.dart';
import 'package:adhd/Screens/SideMenu/Notification/bloc/notification_bloc.dart';
import 'package:adhd/Screens/SideMenu/Notification/bloc/notification_status.dart';
import 'package:adhd/widgets/Utilities/button_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Utilities/constants.dart';
import '../../../widgets/Auth/rich_textfiield_widget.dart';
import '../../../widgets/Utilities/custom_appbar_widget.dart';
import 'package:record/record.dart';

class NewMessageScreen extends StatefulWidget {
  static const String id = "new_message";
  // final void Function(String path) onStop;

  const NewMessageScreen({super.key});

  @override
  State<NewMessageScreen> createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends State<NewMessageScreen> {
  int _recordDuration = 0;
  Timer? _timer;
  String message='';
  final _audioRecorder = AudioRecorder();
  StreamSubscription<RecordState>? _recordSub;
  RecordState _recordState = RecordState.stop;
  StreamSubscription<Amplitude>? _amplitudeSub;
  // Amplitude? _amplitude;
  var audioPath = "";
  var showPlayer = false;
  final _form = GlobalKey<FormState>();

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      setState(() => _recordState = recordState);
    });

    // _amplitudeSub = _audioRecorder
    //     .onAmplitudeChanged(const Duration(milliseconds: 300))
    //     .listen((amp) => setState(() => _amplitude = amp));

    super.initState();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        // We don't do anything with this but printing
        final isSupported = await _audioRecorder.isEncoderSupported(
          AudioEncoder.aacLc,
        );
        if (kDebugMode) {
          print('${AudioEncoder.aacLc.name} supported: $isSupported');
        }

        // final devs = await _audioRecorder.listInputDevices();
        // final isRecording = await _audioRecorder.isRecording();
        showPlayer = false;
        await _audioRecorder.start(const RecordConfig(), path: 'aFullPath/myFile.m4a');
        _recordDuration = 0;

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _recordDuration = 0;

    final path = await _audioRecorder.stop();

    if (path != null) {
      // widget.onStop(path);
      setState(() {
        print(path);
        showPlayer = true;
        audioPath = path;
      });
    }
  }

  Future<void> _pause() async {
    _timer?.cancel();
    await _audioRecorder.pause();
  }

  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }


  sendNotification(){
    if(_form.currentState!.validate()){
      _form.currentState!.save();

      Map<String,dynamic> body={
        'TitleAr':message,
        'TitleEn':message,
        'VoiceNotification':audioPath.isEmpty?null:File(audioPath),
        'TaskDuration':20,
        'SendAt':DateTime.now().toString(),
        'HasSound':audioPath.isNotEmpty,
        'PatientID':URL.selectedChild!.id,
      };

      context.read<NotificationCubit>().sendNotification(body);

    }
  }

  //NotificationWidget
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
      body: BlocConsumer<NotificationCubit,NotificationState>(
        builder:(context, state) => state is NotificationLoading?Center(child: CircularProgressIndicator(),):Form(
          key: _form,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Column(
                  children: [
                    RichTextFieldWidget(
                      returnValue: (v) {
                        message = v;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _buildRecordStopControl(),
                    const SizedBox(width: 20),
                    _buildPauseResumeControl(),
                    const SizedBox(width: 20),
                    _buildText(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                if (showPlayer)
                  AudioPlayer(
                    source: audioPath,
                    onDelete: () {
                      setState(() => showPlayer = false);
                    },
                  ),
                  ],
                ),

                ButtonWidget(title: "Send", action: () {
                  sendNotification();
                }),
              ],
            ),
          ),
        ), listener: (BuildContext context, NotificationState state) {  },
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    if (_recordState != RecordState.stop) {
      icon = const Icon(Icons.stop, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = Icon(Icons.mic, color: Constants.MAIN_COLOR, size: 30);
      color = Constants.MAIN_COLOR.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 56, height: 56, child: icon),
          onTap: () {
            (_recordState != RecordState.stop) ? _stop() : _start();
          },
        ),
      ),
    );
  }

  Widget _buildPauseResumeControl() {
    if (_recordState == RecordState.stop) {
      return const SizedBox.shrink();
    }

    late Icon icon;
    late Color color;

    if (_recordState == RecordState.record) {
      icon = const Icon(Icons.pause, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = const Icon(Icons.play_arrow, color: Colors.red, size: 30);
      color = Constants.MAIN_COLOR.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 56, height: 56, child: icon),
          onTap: () {
            (_recordState == RecordState.pause) ? _resume() : _pause();
          },
        ),
      ),
    );
  }

  Widget _buildText() {
    if (_recordState != RecordState.stop) {
      return _buildTimer();
    }

    return const Text("Waiting to record");
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: const TextStyle(color: Colors.red),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }
}
