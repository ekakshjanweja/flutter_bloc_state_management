import 'package:counter_bloc/bloc/counter_bloc.dart';
import 'package:counter_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterCubit counterCubit = BlocProvider.of<CounterCubit>(context);
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filledTonal(
              onPressed: () {
                counterBloc.add(CounterDecremented());
              },
              icon: const Icon(Icons.remove),
            ),
            const SizedBox(width: 40),
            IconButton.filledTonal(
              onPressed: () {
                counterBloc.add(CounterIncremented());
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        tooltip: 'Decrement',
        child: const Icon(Icons.navigate_before),
      ),
    );
  }
}
