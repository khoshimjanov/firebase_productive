import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive/assets/constants/routes.dart';
import 'package:productive/core/injector/injector.dart';
import 'package:productive/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:productive/features/notes/notes/data/repository/notes.dart';
import 'package:productive/features/notes/notes/presentation/bloc/notes/notes_bloc.dart';
import 'package:productive/features/tasks/data/data_source/remote.dart';
import 'package:productive/features/tasks/data/repository/task.dart';
import 'package:productive/features/tasks/presentation/bloc/task_bloc.dart';
import 'package:productive/firebase_options.dart';

import 'assets/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(),
          ),
          BlocProvider(
            create: (context) => TaskBloc(
              response: TaskRepository(
                taskRemoteDataSource: TaskRemoteDataSource(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => NoteBloc(
              repository: NoteRepository(),
            ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Productive',
          theme: AppTheme.darkTheme(),
          navigatorKey: _navigatorKey,
          onGenerateRoute: RouteGenerator.onGenerateRoute,
        ),
      );
}
