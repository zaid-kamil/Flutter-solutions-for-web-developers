import 'dart:math';
import 'dart:ui';

import 'package:dartbyte/utils/db_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DartByteThemedApp());
}

class DartByteThemedApp extends StatefulWidget {
  const DartByteThemedApp({super.key});

  @override
  State<DartByteThemedApp> createState() => _DartByteThemedAppState();
}

class _DartByteThemedAppState extends State<DartByteThemedApp> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dart byte',
        home: ByteBoard(toggleTheme: _toggleTheme),
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,
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

class ByteBoard extends StatelessWidget {
  final VoidCallback toggleTheme;

  const ByteBoard({super.key, required this.toggleTheme});

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
          //toggle theme
          IconButton(
            onPressed: toggleTheme,
            icon: const Icon(Icons.brightness_4),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1000) {
            return const Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 1000,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TopSlider(),
                        RecommendNews(),
                        AllArticleRow(),
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

class RecommendNews extends StatelessWidget {
  const RecommendNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: List.generate(4, (index) {
          var views = (index + 1) * Random().nextInt(1000);
          return Expanded(
            child: Card(
              color: Theme.of(context).cardColor,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(4),
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
    );
  }
}

class AllArticleRow extends StatelessWidget {
  const AllArticleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class TopSlider extends StatelessWidget {
  const TopSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Expanded(
        child: Scrollbar(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              NewsCard("Dart collections", "Noor ul Aman", 1),
              NewsCard("Web is Amazing", "Zaid Kamil", 2),
              NewsCard("Responsive Design", "Amna Ghazal", 3),
              NewsCard("List of Flutter Widgets", "Bharvi Sharma", 4),
              NewsCard("Learn Dart", "Akbar Ahmad", 5),
              NewsCard("Learn Dart Collections", "Adeeba Ahmad", 6),
            ],
          ),
        ),
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
      color: Theme.of(context).cardColor,
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
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text('by $author',
                    style: Theme.of(context).textTheme.bodySmall),
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
    return Card(
      color: Theme.of(context).cardColor.withOpacity(0.6),
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.primaries.last,
              radius: 20,
              child: FlutterLogo(size: 20),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text('News article title'),
            ),
          ],
        ),
      ),
    );
  }
}
