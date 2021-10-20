import 'dart:io';

String readJsonFromFile(String name) =>
    File('test/fixture/$name').readAsStringSync();
