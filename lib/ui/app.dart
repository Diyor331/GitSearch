import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search_app/blocs/blocs.dart';
import 'package:git_search_app/services/api_repository.dart';

import 'screens/screens.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Этот виджет - корень приложения
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GitBloc>(
            create: (context) => GitBloc(GitRepository())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Git Search',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) =>  Splash(),
            '/home': (context) => const Home(),
            '/result': (context) => const ResultPage(),
            '/resultDetail': (context) => const RepoDetail(),
          },
        ),
    );

  }
}

