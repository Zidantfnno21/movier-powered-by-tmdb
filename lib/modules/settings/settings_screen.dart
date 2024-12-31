
import 'package:flutter/material.dart';
import 'package:the_movie_databases/data/shared_preferences_service.dart';

import '../../utils/result.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.sharedPreferencesService});

  final SharedPreferencesService sharedPreferencesService;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _theme;

  @override
  void initState() {
    super.initState();
    widget.sharedPreferencesService.fetchUserTheme().then((value) {
      if (value is Ok<String?>) {
        setState(() {
          _theme = value.value;
        });
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Settings'),
              Text('Theme'),
            ],
          ),
      ),
    );
  }
}
