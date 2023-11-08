import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import './camera.dart';

class Land extends StatelessWidget {
  @override
  const Land({
    Key? key,
    required this.camera,
  }) : super(key: key);
  final CameraDescription camera;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                child: IconButton(
                  iconSize: 200,
                  icon: const Icon(Icons.camera_alt_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TakePictureScreen(
                                camera: camera,
                              )),
                    );
                  },
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: IconButton(
                  iconSize: 200,
                  icon: const Icon(Icons.bar_chart_rounded),
                  onPressed: () {},
                  color: Colors.blue,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*class Cam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}*/

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
