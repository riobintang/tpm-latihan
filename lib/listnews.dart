import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:latihan/controller.dart';
import 'package:latihan/newsDetailPage.dart';

import 'list_news_model.dart';

class ListNews extends StatefulWidget {
  final String? news;
  final String? title;
  const ListNews({super.key, this.news, this.title});

  @override
  State<ListNews> createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CNN ' + widget.title!,
        ),
        centerTitle: true,
      ),
      body: _buildListView(widget.news),
    );
  }

  Widget _buildListView(String? news) {
    return Container(
      child: FutureBuilder(
          future: Controller.instance.loadList(news!),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              ListNewsModel list = ListNewsModel.fromJson(snapshot.data);
              return _buildSuccessSection(list);
            }
            return _buildLoadingSection();
          }),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(ListNewsModel news) {
    return ListView.builder(
      itemCount: news.data!.posts!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemNews(news.data!.posts![index]);
      },
    );
  }

  Widget _buildItemNews(Posts newsData) {
    return InkWell(
      onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetail(data: newsData))
        ),
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              child: Image.network(newsData.thumbnail!),
            ),
            SizedBox(
              width: 20,
            ),
            Text(newsData.title!),
          ],
        ),
      ),
    );
  }
}
