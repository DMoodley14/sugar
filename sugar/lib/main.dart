import 'package:flutter/material.dart';
import './widget.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(App(camera: firstCamera));
}

class App extends StatefulWidget {
  @override
  const App({
    Key? key,
    required this.camera,
  }) : super(key: key);
  final CameraDescription camera;

  _AppState createState() => _AppState(camera: camera);
}

class _AppState extends State<App> {
  @override
  _AppState({
    required this.camera,
  });
  final CameraDescription camera;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Land(camera: camera));
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}
