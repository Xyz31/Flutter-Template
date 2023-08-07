import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_template/presentation/blocs/connectivity/connectivity_cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int c = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(),
          )
        ],
        child: MaterialApp(
          darkTheme: ThemeData.light(),
          themeMode: ThemeMode.system,
          home: Scaffold(
            backgroundColor: c == 0 ? Colors.grey[100] : Colors.grey,
            appBar: AppBar(
              title: const Text('hello'),
            ),
            body: BlocBuilder<InternetCubit, InternetCubitState>(
              builder: (context, state) {
                if (state == InternetCubitState.Gained) {
                  c = 0;

                  return const Center(
                    child: Text('Hello World!'),
                  );
                } else if (state == InternetCubitState.Lost) {
                  return const InternetConnectedWidget();
                } else {
                  return InternetConnectedWidget();
                  // return const Center(
                  //   child: Text('Hello Initial.'),
                  // );
                }
              },
            ),
          ),
        ));
  }
}

class InternetConnectedWidget extends StatelessWidget {
  const InternetConnectedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 220,
        height: 150,
        child: Dialog(
          backgroundColor: Colors.grey[300],
          child: const Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Connection Lost',
                style: TextStyle(fontSize: 16),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
