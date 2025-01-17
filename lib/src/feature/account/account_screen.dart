import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/widget/app_scaffold.dart';
import 'package:themovie_flutter/src/widget/dark_app_bar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: DarkAppBar(
        title: Text('Account Page'),
      ),
      body: Center(
        child: Text('Comming Soon ~'),
      ),
    );
  }
}
