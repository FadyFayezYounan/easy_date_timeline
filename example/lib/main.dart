import 'package:example/examples/examples.dart';
import 'package:example/examples/infinite_date_time_line_marked_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Date Timeline',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Easy Date Timeline 😊'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 32.0),
            EasyInfiniteDateTimeLineExample(),
            Divider(height: 32),
            SizedBox(height: 32.0),
            InfiniteItemBuilderExample(),
            BasicExample(),
            SizedBox(height: 32.0),
            CustomBackgroundExample(),
            SizedBox(height: 32.0),
            ChangeTodyHighlightColorExample(),
            SizedBox(height: 32.0),
            ChangeDayStructureExample(),
            SizedBox(height: 32.0),
            LandscapeViewExample(),
            SizedBox(height: 32.0),
            LocalSupportExample(),
            SizedBox(height: 32.0),
            ChangeHeaderAppearanceExample(),
            SizedBox(height: 32.0),
            EasyDateTimeLineItemBuilderExample(),
            SizedBox(height: 32.0),
            EasyInfiniteDateTimeLineMarkedExample(),
            SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
