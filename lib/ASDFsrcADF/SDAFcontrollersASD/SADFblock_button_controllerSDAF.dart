import 'package:flutter/material.dart';

class SAEFBlockButtonAFSFE extends ValueNotifier<bool> {
  SAEFBlockButtonAFSFE(super.value);

  void changeBlock(bool value) {
    this.value = value;
    notifyListeners();
  }
}

abstract class AEFProviderSAEF {
  static final blockSEF = SAEFBlockButtonAFSFE(false);
}
