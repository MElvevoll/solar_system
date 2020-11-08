import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:solar_system/AstrnomicalObject.dart';
import 'package:solar_system/DetailScreen.dart';
import 'package:solar_system/data.dart';

void main() => runApp(SolarSystem());

class SolarSystem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Test",
        home: AstronomicalObjectScreen(
          object: listOfObjects,
        ));
  }
}

class AstronomicalObjectScreen extends StatelessWidget {
  final List<AstronomicalObject> object;

  AstronomicalObjectScreen({Key key, @required this.object}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Astronomical Objects"),
        ),
        body: ListView.builder(
            itemCount: object.length,
            itemBuilder: (context, index) {
              return ListTile(
                //title: Text(object[index].name),
                leading: CachedNetworkImage(
                  imageUrl: object[index].imageSrc,
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularProgressIndicator(value: progress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),

                  /* Image.network(
                  object[index].imageSrc,
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,*/
                ),
                title: Text(object[index].name),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(object: object[index])));
                },
              );
            }));
  }
}
