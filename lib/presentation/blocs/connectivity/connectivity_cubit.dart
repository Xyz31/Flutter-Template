import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetCubitState { Initial, Gained, Lost }

class InternetCubit extends Cubit<InternetCubitState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;
  InternetCubit() : super(InternetCubitState.Initial) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        emit(InternetCubitState.Gained);
      } else {
        emit(InternetCubitState.Lost);
      }
    });

    Future<void> close() {
      _streamSubscription?.cancel();
      return super.close();
    }
  }
}
