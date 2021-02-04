import 'package:flutter/material.dart';
import 'package:giphy_search/app.dart';
import 'package:giphy_search/app_config.dart';

void main() {
  final configuredApp = AppConfig(
    appName: 'Giphy Search',
    apiUrl: 'https://api.giphy.com/v1',
    child: Application(),
  );
  runApp(configuredApp);
}



