import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:latihan/list_news_model.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({super.key, required this.data});
  final Posts data;
  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  double size = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CNN News"),),
      body: Container(
        child: Column(
          children: [
            Text(
              widget.data.title!,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              widget.data.pubDate!,
              style: TextStyle(
                  fontSize: 10, color: Color.fromARGB(18, 190, 190, 190)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              
              child: Image.network(
                widget.data.thumbnail!,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: size,
              child: InkWell(
              child: Text(widget.data.description!),
              onTap: () {
                setState(() {
                  size == 50 ? size = 300 : size = 50;
                });
              },
            ),
            ),
            
          ],
        ),
      ),
    );
  }
}
