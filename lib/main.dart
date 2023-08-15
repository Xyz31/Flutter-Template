import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_template/home.dart';
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
/*
  void _showConnectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Connection Status'),
          content: Text(
            _isConnected ? 'Internet is connected.' : 'No internet connection.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(),
          )
        ],
        child: MaterialApp(
          // darkTheme: ThemeData.from(
          //   colorScheme: ColorScheme.fromSeed(
          //     seedColor: Colors.cyanAccent,
          //   ),
          // ),
          theme: ThemeData(
              useMaterial3: true,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Poppins'),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              title: const Text('hello'),
            ),
            body: BlocConsumer<InternetCubit, InternetCubitState>(
              listener: (context, state) => {
                if (state == InternetCubitState.Lost)
                  {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Data Lost'),
                            content: const Text('Conection Lost'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Close'))
                            ],
                          );
                        })
                  }
                else
                  {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: const Text(
                              'Welcome back',
                              style: TextStyle(fontSize: 15),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('close'),
                              )
                            ],
                          );
                        })
                  }
              },
              builder: (context, state) {
                // return const Center(
                //   child: Text('Hello World!'),
                return const HomeScreen();
              },
            ),
          ),
        ));
  }
}
