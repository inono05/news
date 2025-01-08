import 'package:flutter/material.dart';
import 'package:news/src/commons/extensions/app_context_extension.dart';
import 'package:news/src/commons/extensions/app_widget_extension.dart';

class DiscoveriesView extends StatelessWidget {
  const DiscoveriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.secondary,
        child: Text('data'),
      ).toCenter(),
    );
  }
}
