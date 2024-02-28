import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SAFEMoneyCubitASEF extends Cubit<int> {
  final SharedPreferences pref;
  SAFEMoneyCubitASEF(this.pref) : super(MoneyStorage(pref).getMoney());

  Future<void> setMoney(int value) async {
    emit(state + value);
    await MoneyStorage(pref).setMoney(state);
  }
}

class MoneyStorage {
  final SharedPreferences pref;
  MoneyStorage(this.pref);

  Future<void> setMoney(int value) async {
    await pref.setInt('money', value);
  }

  int getMoney() {
    return pref.getInt('money') ?? 10000;
  }
}
