import 'package:flutter/material.dart';
import 'package:pdax_exam/presentation/utility/constants.dart' as constants;

class Utils {
  Utils._();

  static final Utils _instance = Utils._();

  factory Utils() {
    return _instance;
  }

  void pushScreen(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(constants.capError),
      ),
      body: const Center(
        child: Text(constants.capError),
      ),
    );
  }
}
