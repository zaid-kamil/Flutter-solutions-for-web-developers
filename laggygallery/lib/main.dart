// import 'package:flutter/material.dart';
//
// void main() => runApp(LaggyGallery());
//
// class LaggyGallery extends StatelessWidget {
//   LaggyGallery({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Laggy Gallery',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: LgHomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class LgHomePage extends StatefulWidget {
//   LgHomePage({super.key});
//
//   @override
//   State<LgHomePage> createState() => _LgHomePageState();
// }
//
// class _LgHomePageState extends State<LgHomePage> {
//   List<String> images =
//       List.generate(50, (index) => 'https://picsum.photos/id/$index/256/256');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Laggy Gallery'),
//       ),
//       body: GridView.builder(
//         itemCount: images.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4,
//         ),
//         itemBuilder: (context, index) {
//           // Heavy computation in each build
//           for (int i = 0; i < 1000000; i++) {
//             // Inefficient loop that causes jank
//           }
//           return Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black12, width: 1),
//             ),
//             padding: EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 // Network image without caching
//                 Expanded(
//                   child: Image.network(
//                     images[index],
//                     height: 256,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Image #${index + 1}',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// OPTIMIZED CODE BELOW (Remove the above code before running this)
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LaggyGallery());
}

class LaggyGallery extends StatelessWidget {
  const LaggyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laggy Gallery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LgHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LgHomePage extends StatefulWidget {
  const LgHomePage({super.key});

  @override
  State<LgHomePage> createState() => _LgHomePageState();
}

class _LgHomePageState extends State<LgHomePage> {
  // Make images list final and static to prevent rebuilding
  static final List<String> images = List.generate(
    50,
    (index) => 'https://picsum.photos/id/${index + 1}/200/300',
    growable: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laggy Gallery'),
      ),
      body: GridView.builder(
        itemCount: images.length,
        cacheExtent: 500, // Add cache extent for better scrolling
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          // Removed heavy computation loop
          return _buildImageCard(index);
        },
      ),
    );
  }

  Widget _buildImageCard(int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                images[index],
                height: 256,
                width: double.infinity,
                fit: BoxFit.cover,
                // Add loading placeholder
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (frame == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return child;
                },
                // Add error handling
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Image #${index + 1}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
