import 'package:apptiptime_provider/selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() async {
  await Hive.initFlutter();
  runApp(ChangeNotifierProvider(
    create: (context) => SelectedProvider(),
    child: Main(),
  ));
}

class Main extends StatelessWidget {
  Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tip Time',
        theme: ThemeData(primarySwatch: Colors.green),
        home: HomePage());
  }
}
