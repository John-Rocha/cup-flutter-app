import 'package:cup_flutter_app/app/core/rest/custom_dio.dart';
import 'package:cup_flutter_app/app/core/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Button.primary(
          label: 'Testando Auth',
          onPressed: () async {
            context.get<CustomDio>().auth().get('/api/me');
          },
        ),
      ),
    );
  }
}
