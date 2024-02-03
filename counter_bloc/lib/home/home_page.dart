import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/cubit/counter_cubit.dart';
import 'package:counter_bloc/home/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, int>(
              builder: (context, counterValue) {
                return Text(
                  '$counterValue',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const IncDecPage(),
                ),
              );
            },
            tooltip: 'Next Page',
            child: const Icon(Icons.navigate_next),
          ),

          // FloatingActionButton(
          //   onPressed: () {
          //     counterCubit.decrement();
          //   },
          //   tooltip: 'Decrement',
          //   child: const Icon(Icons.remove),
          // ),
          // const SizedBox(width: 40),
          // FloatingActionButton(
          //   onPressed: () {
          //     counterCubit.increment();
          //   },
          //   tooltip: 'Increment',
          //   child: const Icon(Icons.add),
          // ),
        ],
      ),
    );
  }
}
