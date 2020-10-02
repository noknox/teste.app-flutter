import 'package:flutter/material.dart';
import 'package:teste_app_flutter/application.dart';
import 'package:teste_app_flutter/core/di/application_container.dart';
import 'package:teste_app_flutter/core/environment/environment.prod.dart';

void main() async {
  await ApplicationContainer.instance().setUp(ProductionEnvironment());
  runApp(Application());
}
