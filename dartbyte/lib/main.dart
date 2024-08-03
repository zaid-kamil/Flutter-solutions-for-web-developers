import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dart byte',
        home: const MyHomePage(),
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.unknown,
          },
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DartByte'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {},
          ),
          // todo icons here
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1000) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 1000,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 400,
                          width: double.infinity,
                          child: Expanded(
                            child: Scrollbar(
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: const [
                                  NewsCard(
                                      "Dart collections", "Noor ul Aman", 1),
                                  NewsCard("Web is Amazing", "Zaid Kamil", 2),
                                  NewsCard(
                                      "Responsive Design", "Amna Ghazal", 3),
                                  NewsCard("List of Flutter Widgets",
                                      "Bharvi Sharma", 4),
                                  NewsCard("Learn Dart", "Akbar Ahmad", 5),
                                  NewsCard("Learn Dart", "Adeeba Ahmad", 6),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: List.generate(4, (index) {
                              var views = (index + 1) * Random().nextInt(1000);
                              return Expanded(
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 5,
                                  margin: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        "https://picsum.photos/id/${index + 10}/500/500",
                                        fit: BoxFit.fill,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Dartbyte #${index + 1}',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text('Views: $views'),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        // Center-aligned 2-column layout of news articles
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: List.generate(6, (index) {
                                    return const NewsArticleItem();
                                  }),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: List.generate(5, (index) {
                                    return const NewsArticleItem();
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Placeholder();
          }
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String author;
  final int imgId;

  const NewsCard(this.title, this.author, this.imgId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(
            "https://picsum.photos/id/$imgId/500/300",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '$title',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('by $author'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsArticleItem extends StatelessWidget {
  const NewsArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green[300],
            radius: 20,
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text('News article title'),
          ),
        ],
      ),
    );
  }
}
