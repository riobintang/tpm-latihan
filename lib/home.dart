import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:latihan/listnews.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SizedBox(height: 20,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                "https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png",
                width: 200,
              ),
            ),

            // Container(child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), children: [
            //   Text('tes'),
            //   Text('tes'),
            // ],),),
            SizedBox(
              height: 120,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 30,
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListNews(news: "terbaru", title: "TERBARU",)),
                      );
                    },
                    child: Text("Terbaru")),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 30,
                width: 120,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListNews(news:"nasional", title: "NASIONAL")),
                      );
                    },
                    child: Text("Nasional")),
              ),
            ]),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListNews(news: "olahraga", title: "OLAHRAGA",)),
                        );
                      },
                      child: Text("Olahraga")),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 30,
                  width: 120,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListNews(news:"teknologi", title: "TEKNOLOGI")),
                        );
                      },
                      child: Text("Teknologi")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
