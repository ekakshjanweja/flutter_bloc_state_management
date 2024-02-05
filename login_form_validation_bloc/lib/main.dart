import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_validation_bloc/app_bloc_observer.dart';
import 'package:login_form_validation_bloc/bloc/authentication_bloc.dart';
import 'package:login_form_validation_bloc/pages/login_page.dart';

void main(List<String> args) {
  Bloc.observer = AppBlocObserver();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        title: "Login Form Validation With BLoC",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
        home: const LoginPage(),
      ),
    );
  }
}
