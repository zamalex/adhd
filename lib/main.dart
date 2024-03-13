import 'package:adhd/Screens/Auth/ForgetPassword/forger_password_code_screen.dart';
import 'package:adhd/Screens/Auth/ForgetPassword/forget_password_receiver_screen.dart';
import 'package:adhd/Screens/Auth/ForgetPassword/reset_paswword_screen.dart';
import 'package:adhd/Screens/Auth/login_screen.dart';
import 'package:adhd/Screens/Home/home_screen.dart';
import 'package:adhd/Screens/Home/splash_screen.dart';
import 'package:adhd/Screens/Onboarding/onboarding.dart';
import 'package:adhd/Screens/Routine/bloc/routine_bloc.dart';
import 'package:adhd/Screens/Routine/routine_list_screen.dart';
import 'package:adhd/Screens/Routine/routine_questions.dart';
import 'package:adhd/Screens/SideMenu/Audio_Screens/audio_list_screen.dart';
import 'package:adhd/Screens/SideMenu/Audio_Screens/bloc/audio_list_bloc.dart';
import 'package:adhd/Screens/SideMenu/Audio_Screens/bloc/audio_list_status.dart';
import 'package:adhd/Screens/SideMenu/BehavioralProblemsScreen/bloc/behavioral_problems_files_status.dart';
import 'package:adhd/Screens/SideMenu/BehavioralProblemsScreen/problems_screen.dart';
import 'package:adhd/Screens/SideMenu/Chat/chat_screen.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/bloc/daily_notes_bloc.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/bloc/daily_notes_states.dart';
import 'package:adhd/Screens/SideMenu/Daliy%20notes/daily_notes_questions.dart';
import 'package:adhd/Screens/SideMenu/Notification/bloc/notification_bloc.dart';
import 'package:adhd/Screens/SideMenu/Notification/bloc/notification_status.dart';
import 'package:adhd/Screens/SideMenu/Notification/my_notifications_screen.dart';
import 'package:adhd/Screens/SideMenu/Notification/notifications_list_screen.dart';
import 'package:adhd/Screens/SideMenu/Reports/bloc/reports_bloc.dart';
import 'package:adhd/Screens/SideMenu/Reports/bloc/reports_status.dart';
import 'package:adhd/Screens/SideMenu/Reports/report_list.dart';
import 'package:adhd/Screens/SideMenu/Video_Screens/bloc/video_list_status.dart';
import 'package:adhd/Screens/SideMenu/Video_Screens/bloc/vidoes_list_bloc.dart';
import 'package:adhd/Screens/SideMenu/file_screens/bloc/educational_files_bloc.dart';
import 'package:adhd/Screens/SideMenu/file_screens/file_list_screen.dart';
import 'package:adhd/Screens/SideMenu/sidemenu_screen.dart';
import 'package:adhd/Screens/SideMenu/Video_Screens/video_list_screen.dart';
import 'package:adhd/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/Auth/bloc/auth_bloc.dart';
import 'Screens/Routine/select_child_screen.dart';
import 'Screens/SideMenu/BehavioralProblemsScreen/bloc/behavioral_problems_bloc.dart';
import 'Screens/SideMenu/Daliy notes/daily_notes_sub_users.dart';
import 'Screens/SideMenu/Notification/new_message_screen.dart';
import 'Screens/SideMenu/file_screens/bloc/educational_files_status.dart';
import 'Screens/SideMenu/followup_forms/followup_forms_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(InitialEvent())),
        BlocProvider(create: (context) => VideoCubit()..emit(VideoInitial())),
        BlocProvider(create: (context) => EducationalFileCubit()..emit(EducationalFileInitial())),
        BlocProvider(create: (context) => AudioCubit()..emit(AudioInitial())),
        BlocProvider(create: (context) => NotificationCubit()..emit(NotificationInitial())),
        BlocProvider(create: (context) => DailyNotesCubit()..emit(DailyNotesInit())),
        BlocProvider(create: (context) => BehavioralProblemsCubit()..emit(BehavioralProblemsInitial())),
        BlocProvider(create: (context) => ReportsCubit()..emit(ReportsInitial())),
        BlocProvider(
            create: (context) => RoutineBloc()..add(InitialRoutinEvent())),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            // colorScheme:
            //     ColorScheme.fromSeed(seedColor: Constants.WHITE_BACKGROUND),
            useMaterial3: true,
            fontFamily: 'Atkinson Hyperlegible',
          ),
          home: SplashScreen(),
          routes: {
            RoutineQuestiionsScreen.id: (context) => RoutineQuestiionsScreen(),
            SideMenuScreen.id: (context) => SideMenuScreen(),
            VideoListScreen.id: (context) => VideoListScreen(),
            FileListScreen.id: (context) => FileListScreen(),
            MyNotificationsScreen.id: (context) => MyNotificationsScreen(),
            NotificationsListScreen.id: (context) => NotificationsListScreen(),
            NewMessageScreen.id: (context) => const NewMessageScreen(),
            ReportListScreen.id: (context) => ReportListScreen(),
            DailyNotesQuestionsScreen.id: (context) =>
                DailyNotesQuestionsScreen(),
            DailyNotesSubUsersScreen.id: (context) =>
                DailyNotesSubUsersScreen(),
            FollowupFromsScreen.id: (context) => FollowupFromsScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            ForgetPassword.id: (context) => ForgetPassword(),
            HomeScreen.id: (context) => HomeScreen(),
            RoutineListScreen.id: (context) => RoutineListScreen(),
            ForgetPasswordCodeScreen.id: (context) => ForgetPasswordCodeScreen(),
            ResetPassword.id: (context) => ResetPassword(),
            AudioListScreen.id: (context) => AudioListScreen(),
            OnboardingScreen.id: (context) => OnboardingScreen(),
            ChatScreeen.id: (context) => ChatScreeen(),
            SelectParentChildScreen.id: (context) => SelectParentChildScreen(),
            BehavioralProblemsScreen.id: (context) => BehavioralProblemsScreen(),
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Constants.WHITE_BACKGROUND,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
