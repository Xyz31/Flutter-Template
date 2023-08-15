import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetCubitState { Initial, Gained, Lost }

class InternetCubit extends Cubit<InternetCubitState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;
  InternetCubit() : super(InternetCubitState.Initial) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        emit(InternetCubitState.Gained);
      } else if (result == ConnectivityResult.none) {
        emit(InternetCubitState.Lost);
      } else {
        emit(InternetCubitState.Initial);
      }
    });
  }
  @override
  Future<void> close() async {
    _streamSubscription?.cancel();
    return super.close();
  }
}
