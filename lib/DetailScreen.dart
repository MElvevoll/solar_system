import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:solar_system/AstrnomicalObject.dart';

class DetailScreen extends StatelessWidget {
  final AstronomicalObject object;

  DetailScreen({Key key, @required this.object}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget highlightSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildHighlightColumn("Volume", object.volume),
          _buildHighlightColumn("Mass", object.mass),
          _buildHighlightColumn("Mean radius", object.meanRadius),
        ],
      ),
    );
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                object.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(object.alternateNames,
                style: TextStyle(color: Colors.grey[500])),
          ],
        ))
      ]),
    );
    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          object.info,
          softWrap: true,
        ));
    return MaterialApp(
      title: 'Solarsystem',
      home: Scaffold(
          appBar: AppBar(
            title: Text(object.name),
          ),
          body: ListView(
            children: [
              CachedNetworkImage(
                  imageUrl: object.imageSrc,
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularProgressIndicator(value: progress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error)),
              //Image.network(object.imageSrc, fit: BoxFit.cover),
              titleSection,
              highlightSection,
              textSection
            ],
          )),
    );
  }

  Column _buildHighlightColumn(String title, String label) {
    var text = Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
    var column = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: text),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(label,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)))
      ],
    );
    return column;
  }
}
