import 'package:bloc2bloc_listener/blocs/counter/counter_bloc.dart';
import 'package:bloc2bloc_listener/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) {
          return CounterBloc();
        }),
        BlocProvider<ThemeBloc>(create: (context) {
          return ThemeBloc();
        }),
      ],
      child: MaterialApp(
        title: 'block2bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementValue = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeBloc, ThemeState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementValue = 1;
        }
        if (state.color == Colors.green) {
          incrementValue = 10;
        }
        if (state.color == Colors.yellow) {
          incrementValue = 100;
        }
        if (state.color == Colors.black) {
          incrementValue = -100;
          context
              .read<CounterBloc>()
              .add(ChangeCounterEvent(incrementValue: incrementValue));
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ThemeBloc>().state.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(ChangeThemeEvent());
                },
                child: const Text(
                  'Change Color',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                '${context.watch<CounterBloc>().state.counter}',
                style: const TextStyle(
                  fontSize: 52.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(ChangeCounterEvent(incrementValue: incrementValue));
                },
                child: const Text(
                  'Increment Counter',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
