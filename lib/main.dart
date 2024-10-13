import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Blog Posts'),
    );
  }
}


class BlogPost {
  final String id;
  final String title;
  final String content;
  final String thumbnail;
  final Author author;
  final List<Category> categories;
  final int likesCount;
  final int bookmarksCount;
  final String createdAt;

  BlogPost({
    required this.id,
    required this.title,
    required this.content,
    required this.thumbnail,
    required this.author,
    required this.categories,
    required this.likesCount,
    required this.bookmarksCount,
    required this.createdAt,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    var authorJson = json['author'];
    var categoriesJson = json['categories'] as List;

    return BlogPost(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      author: Author.fromJson(authorJson),
      categories: categoriesJson.map((category) => Category.fromJson(category)).toList(),
      likesCount: json['number_of_likes'] ?? 0,
      bookmarksCount: json['number_of_bookmarks'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'thumbnail': thumbnail,
      'author': author.toJson(),
      'categories': categories.map((category) => category.toJson()).toList(),
      'number_of_likes': likesCount,
      'number_of_bookmarks': bookmarksCount,
      'created_at': createdAt,
    };
  }
}

class Author {
  final String id;
  final String username;
  final String email;
  final String profileUrl;
  final String bio;

  Author({
    required this.id,
    required this.username,
    required this.email,
    required this.profileUrl,
    required this.bio,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      profileUrl: json['profileUrl'] ?? '',
      bio: json['bio'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'profileUrl': profileUrl,
      'bio': bio,
    };
  }
}

class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<BlogPost> blogPosts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBlogPosts();
  }

  // Fetch blog posts from the API
  Future<void> fetchBlogPosts() async {
    final url = Uri.parse('https://blog-api.automatex.dev/blogs');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Check if 'data' key exists and is not null
        if (jsonResponse['data'] != null) {
          List<dynamic> data = jsonResponse['data'];

          setState(() {
            blogPosts = data.map((json) => BlogPost.fromJson(json)).toList();
            isLoading = false;
          });
        } else {
          // Handle case where 'data' is null
          print('No data found in the response');
          setState(() {
            isLoading = false;
            // Optionally, show a message to the user about missing data
          });
        }
      } else {
        print('Failed to load blog posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching blog posts: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset(
          'assets/images/logo1.png',
          width: 300,
          height: 300,
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add navigation to Login Page
            },
            child: const Text('Login', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              // Add navigation to SignUp Page
            },
            child: const Text('Sign up', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Search button pressed');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  side: const BorderSide(color: Colors.grey, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.search, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text('Search', style: TextStyle(color: Colors.grey, fontSize: 18)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Category Row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryCard(categoryName: 'Food'),
                  CategoryCard(categoryName: 'Drinks'),
                  CategoryCard(categoryName: 'Clothes'),
                  CategoryCard(categoryName: 'Accessories'),
                  CategoryCard(categoryName: 'Skin Care'),
                  CategoryCard(categoryName: 'Electronics'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Blog posts list
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: blogPosts.length,
            //   itemBuilder: (context, index) {
            //     final post = blogPosts[index];
            //     return MyCard(
            //       profileImageUrl: post.profileImageUrl,
            //       profileName: post.profileName,
            //       postDate: post.postDate,
            //       title: post.title,
            //       postImageUrl: post.postImageUrl,
            //       likesCount: post.likesCount,
            //       sharesCount: post.sharesCount, blogPost: null,
            //     );
            //   },
            // ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: blogPosts.length,
              itemBuilder: (context, index) {
                final post = blogPosts[index];
                return MyCard(
                  blogPost: post, // Pass the whole BlogPost object here
                );
              },
            )

          ],
        ),
      ),
    );
  }
}





// ========= CategoryCard widget ================
class CategoryCard extends StatelessWidget {
  final String categoryName;

  const CategoryCard({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Add padding for better spacing
            decoration: BoxDecoration(
              color: Colors.white24, // Set the desired background color
              borderRadius: BorderRadius.circular(8), // Optional: Add rounded corners
            ),
            child: Text(
              categoryName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}




// ========= card ==========

class MyCard extends StatelessWidget {
  
  final BlogPost blogPost;

  var backgroundColor; // Accept BlogPost object directly

  MyCard({
    required this.blogPost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile row
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    blogPost.author.profileUrl.isNotEmpty
                        ? blogPost.author.profileUrl
                        : 'https://via.placeholder.com/150', // Fallback image
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blogPost.author.username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${blogPost.createdAt}', // Display post creation date
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              blogPost.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                blogPost.thumbnail.isNotEmpty
                    ? blogPost.thumbnail
                    : 'https://via.placeholder.com/200', // Fallback image
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            // Icons row
            Row(
              children: [
                // Left side: Heart and Share icons
                Expanded(
                  child: Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border, color: Colors.white),
                            onPressed: () {
                              print('Heart icon pressed');
                            },
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${blogPost.likesCount}', // Display the number of likes
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.share_outlined, color: Colors.white),
                            onPressed: () {
                              print('Share icon pressed');
                            },
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${blogPost.bookmarksCount}', // Display the number of bookmarks
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Right side: Bookmark icon
                IconButton(
                  icon: const Icon(Icons.bookmark_border, color: Colors.white),
                  onPressed: () {
                    print('Bookmark icon pressed');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





// class MyCard extends StatelessWidget {
//   final String profileImageUrl;
//   final String profileName;
//   final String postDate;
//   final String title;
//   final String postImageUrl;
//   final Color backgroundColor;
//   final int likesCount;
//   final int sharesCount;
//
//   MyCard({
//     required this.profileImageUrl,
//     required this.profileName,
//     required this.postDate,
//     required this.title,
//     required this.postImageUrl,
//     this.backgroundColor = Colors.white12,
//     this.likesCount = 0,
//     this.sharesCount = 0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8 , horizontal: 8),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             spreadRadius: 2,
//             blurRadius: 6,
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile row
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 25,
//                   backgroundImage: NetworkImage(profileImageUrl),
//                 ),
//                 SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       profileName,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 2),
//                     Text(
//                       postDate,
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 12),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.grey[100],
//               ),
//             ),
//             SizedBox(height: 12),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(
//                 postImageUrl,
//                 width: double.infinity,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 15),
//             // Icons row
//             Row(
//               children: [
//                 // Left side: Heart and Share icons
//                 Expanded(
//                   child: Row(
//                     children: [
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.favorite_border, color: Colors.white),
//                             onPressed: () {
//                               print('Heart icon pressed');
//                             },
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             '$likesCount', // Display the number of likes
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: 16),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.share_outlined, color: Colors.white),
//                             onPressed: () {
//                               print('Share icon pressed');
//                             },
//                           ),
//                           SizedBox(width: 4),
//                           Text(
//                             '$sharesCount', // Display the number of shares
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Right side: Bookmark icon
//                 IconButton(
//                   icon: Icon(Icons.bookmark_border, color: Colors.white),
//                   onPressed: () {
//                     print('Bookmark icon pressed');
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
