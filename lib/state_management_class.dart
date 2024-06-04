import 'package:flutter/material.dart';
import 'package:prime_template/features/discover/discover_provider.dart';
import 'package:provider/provider.dart';

import 'features/navigation/navigation_provider.dart';
import 'features/notifications/notification_provider.dart';

class StateManagementClass extends StatelessWidget {
  final child;
  const StateManagementClass({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => DiscoverProvider()),
      ChangeNotifierProvider(create: (context) => NavigationProvider()),
    ], child: child);
  }
}
