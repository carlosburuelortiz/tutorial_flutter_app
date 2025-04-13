import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_app/bloc/user_bloc.dart';
import 'package:tutorial_app/bloc/user_event.dart';
import 'package:tutorial_app/screens/user_list_screen.dart';
import 'package:tutorial_app/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserBloc>()
        ..add(LoadUserEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserListScreen(),
      ),
    );
  }
}
