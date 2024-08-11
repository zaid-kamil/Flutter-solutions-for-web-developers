class Article {
  final String title;
  final String image;
  final String description;
  Article({
    required this.title,
    required this.image,
    required this.description,
  });

  static List<Article> fetchAll() {
    return [
      Article(
        title: 'Article One',
        image: 'assets/images/image1.jpg',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien.',
      ),
      Article(
        title: 'Article Two',
        image: 'assets/images/image2.jpg',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien.',
      ),
      Article(
        title: 'Article Three',
        image: 'assets/images/image3.jpg',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien.',
      ),
      Article(
        title: 'Article Four',
        image: 'assets/images/image4.jpg',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien.',
      ),
      Article(
        title: 'Article Five',
        image: 'assets/images/image5.jpg',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien.',
      ),
    ];
  }
}
