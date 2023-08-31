import 'package:flutter/material.dart';

import 'app_router.dart';

void main() {
  runApp(const BreakingBadApp());
}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
    );
  }
}
