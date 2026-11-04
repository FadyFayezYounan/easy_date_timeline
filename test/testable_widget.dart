import 'package:material_ui/material_ui.dart';

class TestableWidget extends StatelessWidget {
  const TestableWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }
}
