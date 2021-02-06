import 'dart:ui';

import 'package:giphy_search/network/response.dart';


const shimmerLightColor = Color(0xffF5F5F5);
const shimmerDarkColor = Color(0xffE0E0E0);
const transparent = Color(0);
const white = Color(0xffffffff);


class Utils {
  static Future<void> responseListener(
      {Response response, Function onLoading, Function onCompleted, Function onError}) async {
    switch (response.status) {
      case Status.loading:
        print('status loading');
        response.status = Status.none;
        onLoading?.call();
        break;
      case Status.completed:
        print('status completed');
        response.status = Status.none;
        onCompleted?.call();
        break;
      case Status.error:
        response.message = null;
        response.status = Status.none;
        onError?.call();
        break;
      case Status.none:
      case Status.unauthorized:
        break;
    }
  }
}
