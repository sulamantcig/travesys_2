import 'package:flutter/material.dart';
import 'package:travesys_2/api/api.dart';
import 'package:travesys_2/helper/router.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    startUpApiCalls();
    return MaterialApp.router(
      routerConfig: CustomRouterConfig.instance.router,
    );
  }

  void startUpApiCalls() {
    Api.instance.createGuestUser();
  }
}
