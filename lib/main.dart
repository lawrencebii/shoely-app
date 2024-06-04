import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prime_template/features/discover/views/filter.dart';
import 'package:prime_template/features/discover/views/reviews_page.dart';
import 'package:prime_template/features/navigation/views/navigation.dart';
import 'package:prime_template/firebase_options.dart';
import 'package:prime_template/state_management_class.dart';

import 'features/discover/views/discover_page.dart';
import 'utils/petite_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // LocalNotificationService.initialize();
  await StorageUtil.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateManagementClass(
      child: MaterialApp(
          title: 'Shoely App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            fontFamily: 'Urbanist',
            useMaterial3: true,
          ),
          home: ReviewsPage()),
    );
  }
}
