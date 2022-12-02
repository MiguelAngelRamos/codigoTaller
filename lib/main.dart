import 'package:apptaller/pages/pages.dart';
import 'package:apptaller/provider/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

//* Creamos un nuevo widget que va ser el que maneje el estado del provider
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PhotosProvider(), lazy: false)
      ],
      child: const MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'home',
      routes: {
        'home':(context) => const HomePage(),
        'detail':(context) => const DetailPage(),
        'users':(context) => const UsersPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

