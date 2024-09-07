import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  // run the DartByteApp widget
  runApp(const DartByteApp());
}

class DartByteApp extends StatelessWidget {
  const DartByteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart byte',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        // for web and desktop, we need to add mouse and unknown as a drag device
        dragDevices: {
          PointerDeviceKind.unknown,
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      // remove debug banner
      debugShowCheckedModeBanner: false,
      // set the home page
      home: const ByteBoardPage(),
    );
  }
}

class ByteBoardPage extends StatelessWidget {
  const ByteBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DartByte'),
          // add actions to the right corner of app bar
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          // check if the width is greater than 1200
          if (constraints.maxWidth > 1200) {
            return const Row(
                // mainAxisSize set to max to take full width
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // create a fixed width container in the center
                  SizedBox(
                      width: 1200,
                      // SingleChildScrollView to make the content scrollable
                      child: SingleChildScrollView(
                          child: Column(
                              // the 3 sections of the page
                              children: [
                            TopSlider(),
                            RecommendedNews(),
                            AllArticleRow(),
                          ])))
                ]);
          } else {
            // if the width is less than 1200, return a placeholder
            return const Placeholder();
          }
        }));
  }
}

class TopSlider extends StatelessWidget {
  const TopSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // sets the height of the slider
        height: 400,
        width: double.infinity,
        child: Expanded(
            child: Scrollbar(
                // horizontal scroll view
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    // NewsCard widget is used to display the news
                    children: const [
              ByteNewsCard("Dart collections", "Noor ul Aman", 1),
              ByteNewsCard("Web is Amazing", "Zaid Kamil", 2),
              ByteNewsCard("Responsive Design", "Amna Ghazal", 3),
              ByteNewsCard("List of Flutter Widgets", "Bharvi Sharma", 4),
              ByteNewsCard("Learn Dart", "Akbar Ahmad", 5),
              ByteNewsCard("Learn Dart", "Adeeba Ahmad", 6),
            ]))));
  }
}

class ByteNewsCard extends StatelessWidget {
  final String title;
  final String author;
  final int imgId;

  const ByteNewsCard(this.title, this.author, this.imgId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        // this is used to clip the card shape
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          // Image.network is used to load the image from the network
          Image.network(
            "https://picsum.photos/id/$imgId/500/300",
            // fits the image to cover the whole area
            fit: BoxFit.cover,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text(title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 8),
                Text('by $author'),
              ]))
        ]));
  }
}

class RecommendedNews extends StatelessWidget {
  const RecommendedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // generate 4 cards in a row
          children: List.generate(4, (index) {
            // generate random views for each card between 0 and 1000
            var views = (index + 1) * Random().nextInt(1000);
            return Expanded(
                // each card is wrapped in an expanded widget to take equal space
                child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: Column(children: [
                      // Load the image from the network
                      Image.network(
                        "https://picsum.photos/id/${index + 10}/500/500",
                        fit: BoxFit.fill,
                      ),
                      Padding(
                          // add padding to the text
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            // cocatenate the index with the text
                            Text(
                              'Dartbyte #${index + 1}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Views: $views'),
                          ]))
                    ])));
          }),
        ));
  }
}

class AllArticleRow extends StatelessWidget {
  const AllArticleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          // align the items to the start
          crossAxisAlignment: CrossAxisAlignment.start,
          // 2 columns in a row
          children: [
            Expanded(
              child: Column(
                // generate 6 news article items
                children: List.generate(6, (index) {
                  return const NewsArticleItem();
                }),
              ),
            ),
            Expanded(
                child: Column(
                    // generate 5 news article items
                    children: List.generate(5, (index) {
              return const NewsArticleItem();
            })))
          ]),
    );
  }
}

class NewsArticleItem extends StatelessWidget {
  const NewsArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    // return a container with margin, padding, border and border radius
    return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          // create a circle avatar
          CircleAvatar(backgroundColor: Colors.green[300], radius: 20),
          const SizedBox(width: 8),
          // let the text take the remaining space in the row
          const Expanded(
            child: Text('News article title'),
          )
        ]));
  }
}
