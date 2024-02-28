import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ASEFNotificationCubitAEF extends Cubit<bool> {
  final SharedPreferences pref;
  ASEFNotificationCubitAEF(this.pref)
      : super(EAFNotificationStorageSEFA(pref).getNotification());

  Future<void> setNotification(bool value) async {
    emit(value);
    await EAFNotificationStorageSEFA(pref).setNotification(state);
  }
}

class EAFNotificationStorageSEFA {
  final SharedPreferences pref;
  EAFNotificationStorageSEFA(this.pref);

  Future<void> setNotification(bool value) async {
    await pref.setBool('notification', value);
  }

  bool getNotification() {
    return pref.getBool('notification') ?? false;
  }
}
