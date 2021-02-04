
import 'package:flutter/material.dart';
import 'package:giphy_search/app_config.dart';
import 'package:giphy_search/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:giphy_search/providers/search_provider.dart';


class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider(appConfig.apiUrl)),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
      ),
    );
  }
}
