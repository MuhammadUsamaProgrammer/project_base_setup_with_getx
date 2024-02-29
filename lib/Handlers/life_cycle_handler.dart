import 'package:flutter/cupertino.dart';

class LifeCycleHandler extends WidgetsBindingObserver {
  final BuildContext context;
  LifeCycleHandler({required this.context});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state);
    if (state == AppLifecycleState.paused) {
    } else if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.inactive) {}
  }
}
