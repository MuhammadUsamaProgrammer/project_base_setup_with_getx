// ignore_for_file: body_might_complete_normally_catch_error, override_on_non_overriding_member

part of 'api_client.dart';

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio,
  );

  final Dio _dio;

  @override
  Future getRequest({required String apiUrl}) async {
    var response = await _dio
        .get(
      apiUrl,
      options: Options(headers: {
        'accept': '*/*',
      }),
    )
        .whenComplete(() {
      debugPrint("Getting Process is Complete:");
    }).catchError((onError) {
      if (onError is DioError) {
        ShowMessage.onFail("No internet connection!");
      }

      debugPrint("GET Error: ${onError.toString()}");
    });

    return response;
  }

  @override
  Future getRequestHeader(
      {required String apiUrl, required String token}) async {
    Response response;
    // TODO: implement getRequestHeader
    response = await _dio
        .get(
      apiUrl,
      options: Options(headers: {
        "Accept": '*/*',
        "Authorization": "Bearer ${token.toString()}",
      }),
    )
        .whenComplete(() {
      debugPrint("Getting Process is Complete:");
    }).catchError((error) async {
      print(error.response);
      int result = await ServerError.withError(error: error).getErrorCode();
      // debugPrint(result.toString());
      // debugPrint(error.response!.toString());

      if (result == 401) {
        ShowMessage().onSessionExpirePopUp();
      } else if (result == 400) {
        ShowMessage.onFail(error.response!.data["message"].join("").toString());
      } else {
        ShowMessage.onFail(
            ServerError.withError(error: error).getErrorMessage().toString());
      }
    });

    return response;
  }

  @override
  Future patchRequestHeader(
      {required String apiUrl, data, required String token}) async {
    var response = await _dio.patch(
      apiUrl,
      data: data,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-type': 'application/json',
        "Authorization": "Bearer ${token.toString()}",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {
      int result = await ServerError.withError(error: error).getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage.onFail(
            ServerError.withError(error: error).getErrorMessage().toString());
      }
    });
    return response;
  }

  @override
  Future postRequest({required String apiUrl, data}) async {
    var response;

    response = await _dio.post(
      apiUrl,
      data: data,
      options: Options(headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((onError) {
      int? statusCode = onError.response?.statusCode;
      print(statusCode);
      var data = onError.response.toString();

      debugPrint("POST Error---: ${onError.response} ${statusCode} ");

      if (onError.type == DioExceptionType.unknown) {
        ShowMessage.onFail("Connection failed due to internet connection");
      } else {
        ShowMessage.onFail(jsonDecode(data)["message"]);
      }
    });

    return response;
  }

  @override
  Future postRequestHeader({
    required String apiUrl,
    data,
    required String token,
  }) async {
    Response response;
    response = await _dio.post(
      apiUrl,
      data: data,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-type': 'application/json',
        "Authorization": "Bearer ${token.toString()}",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {
      int result = await ServerError.withError(error: error).getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage.onFail(
            ServerError.withError(error: error).getErrorMessage().toString());
      }
    });
    return response;
  }

  @override
  Future putRequest({required String apiUrl, data}) {
    // TODO: implement putRequest
    throw UnimplementedError();
  }

  @override
  Future putRequestHeader(
      {required String apiUrl, data, required String token}) async {
    // TODO: implement putRequestHeader
    Response response;
    response = await _dio.put(
      apiUrl,
      data: data,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-type': 'application/json',
        "Authorization": "Bearer ${token.toString()}",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {
      int result = await ServerError.withError(error: error).getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage.onFail(
            ServerError.withError(error: error).getErrorMessage().toString());
      }
    });

    return response;
  }

  @override
  Future profileUpdateMultiPart(
      {required String apiUrl,
      required FormData formData,
      required String token}) async {
    // TODO: implement profileUpdateMultiPart

    var response = await _dio.post(
      apiUrl,
      data: formData,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-Type': 'multipart/form-data',
        "Authorization": "Bearer ${token.toString()}",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {
      int result = await ServerError.withError(error: error).getErrorCode();
      debugPrint(result.toString());
      debugPrint(error.response!.statusCode.toString());
      debugPrint(error.response!.toString());
      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage.onFail(
            ServerError.withError(error: error).getErrorMessage().toString());
      }
    });
    return response;
  }

  @override
  Future deleteRequestHeader(
      {required String apiUrl, required String token}) async {
    var response = await _dio
        .delete(
      apiUrl,
      options: Options(headers: {
        'Accept': '*/*',
        'Content-type': 'application/json',
        "Authorization": "Bearer ${token.toString()}",
      }),
    )
        .whenComplete(() {
      debugPrint("Getting Process is Complete:");
    }).catchError((error) async {
      int result = await ServerError.withError(error: error).getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage.onFail(
            ServerError.withError(error: error).getErrorMessage().toString());
      }
    });

    return response;
  }

  @override
  Future imagePickerScanData(
      {required String apiUrl, required FormData formData}) async {
    var response = await _dio.post(
      apiUrl,
      data: formData,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-Type': 'multipart/form-data',
        "Authorization": "Token 94166b27b1f5dc804ca7668d1aae752c059bf54d",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {
      int result = await ServerError.withError(error: error).getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage.onFail(
            ServerError.withError(error: error).getErrorMessage().toString());
      }
    });
    return response;
  }

  @override
  Future postRequestBody(
      {required String apiUrl, required String token}) async {
    Response response;
    response = await _dio.post(
      apiUrl,
      options: Options(headers: {
        "Accept": 'application/json',
        'Content-type': 'application/json',
        "Authorization": "Bearer ${token.toString()}",
      }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((error) async {
      int result = await ServerError.withError(error: error).getErrorCode();
      debugPrint(result.toString());

      debugPrint("jjjjhjhjhjhjhjhuuhhj");

      if (result == 401) {
        ShowMessage().onSessionExpirePopUp();
      } else {
        ShowMessage.onFail(
            ServerError.withError(error: error).getErrorMessage().toString());
      }
    });
    return response;
  }

  @override
  Future getRequestQuery(
      {required String apiUrl, required String token}) async {
    var response = await _dio
        .get(
      apiUrl,
      queryParameters: {
        'location[]': ['1'],
        'category_id[]': ['13'],
        'per_page': '100',
        'page': '1',
      },
      options: Options(headers: {
        'accept': '*/*',
      }),
    )
        .whenComplete(() {
      debugPrint("Getting Process is Complete:");
    }).catchError((onError) {
      // if (onError is DioError) {
      //     ShowMessage().showErrorMessage("No internet connection!");
      //   }

      debugPrint("GET Error: ${onError.toString()}");
    });

    return response;
  }
}
