import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/news_card.dart';

class DashboardScreenWeb extends StatefulWidget {
  final VoidCallback toggleTheme;
  final String title;

  const DashboardScreenWeb(
      {super.key, required this.toggleTheme, required this.title});

  @override
  State<DashboardScreenWeb> createState() => _DashboardScreenWebState();
}

class _DashboardScreenWebState extends State<DashboardScreenWeb> {
  final _formKey = GlobalKey<FormBuilderState>();
  final auth = FirebaseAuth.instance;

  // load news data from firebase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => {
            Navigator.pushNamed(context, '/'),
          },
          tooltip: 'Home',
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: widget.toggleTheme,
            tooltip: 'Toggle Theme',
          ),
          IconButton(
            onPressed: () => {
              FirebaseAuth.instance.signOut(),
              Navigator.pushNamed(context, '/login'),
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(
            child: Padding(
              child: NewsGrid(),
              padding: EdgeInsets.all(8),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            width: 500,
            child: AddNews(
              formKey: _formKey,
              auth: auth,
            ),
          ),
        ],
      ),
    );
  }
}

//news model
class News {
  final String imageUrl;
  final String title;
  final String author;
  final String description;
  final String category;
  final bool isRecommended;
  final bool isPopular;

  News({
    required this.imageUrl,
    required this.title,
    required this.description,
    this.author = 'Admin',
    this.category = 'General',
    this.isRecommended = false,
    this.isPopular = false,
  });
}

class AddNews extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final FirebaseAuth auth;

  AddNews({
    super.key,
    required this.formKey,
    required this.auth,
  });

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  var isUploading = false;

  Future<bool> saveNews() async {
    if (widget.formKey.currentState!.saveAndValidate()) {
      final formData = widget.formKey.currentState!.value;
      debugPrint(formData.toString());
      final news = News(
        imageUrl: formData['imageUrl'],
        title: formData['title'],
        description: formData['description'],
        author: formData['author'],
        category: formData['category'],
        isRecommended: formData['isRecommended'],
        isPopular: formData['isPopular'],
      );
      var doc = await FirebaseFirestore.instance.collection('news').add({
        'imageUrl': news.imageUrl,
        'title': news.title,
        'description': news.description,
        'author': news.author,
        'category': news.category,
        'isRecommended': news.isRecommended,
        'isPopular': news.isPopular,
      });
      if (doc.id.isNotEmpty) {
        widget.formKey.currentState!.reset();
        isUploading = false;
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FormBuilder(
          key: widget.formKey,
          child: Column(
            children: [
              Text(
                'Add News',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              FormBuilderDropdown(
                name: 'category',
                initialValue: 'General',
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                items: ['General', 'Technology', 'Sports', 'Entertainment']
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'author',
                initialValue: widget.auth.currentUser?.displayName ?? 'Admin',
                decoration: const InputDecoration(labelText: 'Author'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'imageUrl',
                decoration: const InputDecoration(
                    labelText: 'Image URL',
                    hintText: 'https://example.com/image.jpg'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.url(),
                ]),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'title',
                decoration: const InputDecoration(labelText: 'Title'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'description',
                maxLines: 3,
                decoration: const InputDecoration(
                    labelText: 'Description', alignLabelWithHint: true),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 10),
              FormBuilderCheckbox(
                name: 'isRecommended',
                title: const Text('Recommended'),
                initialValue: false,
              ),
              FormBuilderCheckbox(
                name: 'isPopular',
                title: const Text('Popular'),
                initialValue: true,
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.save_alt),
                onPressed: () async {
                  if (isUploading) {
                    return;
                  }
                  isUploading = true;
                  if (await saveNews()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('News added successfully'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to add news'),
                      ),
                    );
                  }
                },
                label: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// news grid
class NewsGrid extends StatelessWidget {
  const NewsGrid({super.key});

  Stream<List<News>> getNewsStream() {
    return FirebaseFirestore.instance
        .collection("news")
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => News(
                  imageUrl: doc['imageUrl'],
                  title: doc['title'],
                  description: doc['description'],
                  author: doc['author'] ?? 'Admin',
                  category: doc['category'] ?? 'General',
                  isRecommended: doc['isRecommended'] ?? false,
                  isPopular: doc['isPopular'] ?? false,
                ))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<News>>(
        stream: getNewsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Column(
                children: [
                  Icon(Icons.error),
                  Text('An error occurred while loading news'),
                  Text('Please try again later'),
                ],
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset(
                'animations/login.json',
                width: 200,
                height: 200,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: Text('No data found'),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final news = snapshot.data![index];
              return ByteNewsCard(
                newsItem: news,
              );
            },
          );
        });
  }
}
