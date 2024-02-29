import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoked/Common/AppText/AppTextView.dart';
import 'package:yoked/Constant/AppConfig.dart';
import 'package:yoked/Theme/colors.dart';

import '../Common/AppBTN/primary_btn.dart';

import '../Utils/fulkey_animation.dart';

class CheckConnectivityServices {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool internetStatus = false;

  initiateConnectivity(
      {required Function callBack, required BuildContext context}) {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      _updateConnectionStatus(event, (isInternet) {
        callBack(isInternet);
        if (isInternet == false) {
          internetStatus = true;
          onNoInterNetPopUp(context: context);
        } else {
          if (internetStatus) {
            internetStatus = false;

            Navigator.pop(context);
          }
        }
      });
    });
  }

  disposeConnectivity() {
    _connectivitySubscription.cancel();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if () {
    //   return Future.value(null);
    // }

    return _updateConnectionStatus(result, (isInternet) {});
  }

  Future<void> _updateConnectionStatus(
      ConnectivityResult result, Function callBack) async {
    switch (result) {
      case ConnectivityResult.wifi:
        callBack(true);
        break;
      case ConnectivityResult.mobile:
        callBack(true);
        break;
      case ConnectivityResult.none:
        callBack(false);
        // setState(() => _connectionStatus = result.toString());
        break;
      default:
        callBack(true);
        // setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  Future<bool> onConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // ShowMessage().showConnectivitySnackBar(connectivityResult, context);
      return true;
    } else {
      // ShowMessage().showErrorMessage(connectivityResult, context);
      return false;
    }
  }
}

onNoInterNetPopUp({
  required BuildContext context,
}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return FunkyOverlay(
          child: NoInterNetPopUp(),
        );
      });
}

class NoInterNetPopUp extends StatefulWidget {
  @override
  _NoInterNetPopUpState createState() => _NoInterNetPopUpState();
}

class _NoInterNetPopUpState extends State<NoInterNetPopUp> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
                colors: [AppColor.primaryColor, AppColor.secondaryColor])),
        height: 180,
        width: size.width - 30,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title: "No Internet Connection",
                    fontWeight: FontWeights.semiBold,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                title: "Please check your internet and try again",
                fontWeight: FontWeights.medium,
                size: 14,
                color: Colors.white,
              ),
              Spacer(),
              PrimaryBTN(
                  height: 40,
                  color: AppColor.primaryColor,
                  callback: () async {
                    CheckConnectivityServices checkConnectivityServices =
                        CheckConnectivityServices();
                    bool result =
                        await checkConnectivityServices.onConnectivity();
                    if (result) {
                      Navigator.pop(context);
                    }
                  },
                  title: "Retry",
                  width: AppConfig(context).width / 3),
            ],
          ),
        ),
      ),
    );
  }
}
