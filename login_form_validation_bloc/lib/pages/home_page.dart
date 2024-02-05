import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_validation_bloc/bloc/authentication_bloc.dart';
import 'package:login_form_validation_bloc/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationInitial) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final authState = context.watch<AuthenticationBloc>().state
              as AuthenticationSuccess;
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(authState.uid),
                  FilledButton.tonal(
                    onPressed: () {
                      context
                          .read<AuthenticationBloc>()
                          .add(AuthLogoutRequested());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      child: Text(
                        "Logout".toUpperCase(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
