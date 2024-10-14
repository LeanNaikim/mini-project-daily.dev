//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mini_project/pages/login.dart';
// import 'package:mini_project/pages/signUp.dart';
// import 'package:mini_project/pages/splashScreen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         leading: SizedBox(
//           width: 300,
//           height: 300,
//           child: Image.asset(
//             'assets/images/logo1.png',
//             width: 300,
//             height: 300,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const LoginHomePage(),
//                 ),
//               );
//             },
//             child: const Text(
//               'Login',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           SvgPicture.string(
//             '''
//             <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 16 16">
//               <path fill="currentColor" d="M8 0h1v16H8z" />
//             </svg>
//             ''',
//             color: Colors.white,
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const SignupPage(),
//                 ),
//               );
//             },
//             child: const Text(
//               'Sign up',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(vertical: 8.0 , horizontal: 8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch, // Makes the button fill the width
//           children: [
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   print('Search button pressed');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 4),
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   side: BorderSide(
//                     color: Colors.grey,
//                     width: 1,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(width: 10),
//                     Container(
//                       padding: const EdgeInsets.all(5.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white10,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.search,
//                         color: Colors.white,
//                         size: 24,
//                       ),
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       'Search',
//                       style: TextStyle(
//                         color: Colors.grey[200],
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             // Horizontal scrollable category section
//             Container(
//               height: 60, // Set a height for your category row
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     CategoryCard(categoryName: 'Food'),
//                     CategoryCard(categoryName: 'Drinks'),
//                     CategoryCard(categoryName: 'Clothes'),
//                     CategoryCard(categoryName: 'Accessories'),
//                     CategoryCard(categoryName: 'Skin Care'),
//                     CategoryCard(categoryName: 'Electronics'),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ListView(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               children: [
//                 MyCard(
//                   profileImageUrl: 'https://via.placeholder.com/150',
//                   profileName: 'John Doe',
//                   postDate: '2 hours ago',
//                   title: 'Just enjoying a sunny day at the park!',
//                   postImageUrl: 'https://via.placeholder.com/600x400',
//                   likesCount: 120,  // Example like count
//                   sharesCount: 45,
//                 ),
//                 MyCard(
//                   profileImageUrl: 'https://via.placeholder.com/150',
//                   profileName: 'Jane Smith',
//                   postDate: 'Yesterday at 5:00 PM',
//                   title: 'Had an amazing meal at the new restaurant downtown!',
//                   postImageUrl: 'https://via.placeholder.com/600x400',
//                   likesCount: 200,
//                   sharesCount: 30,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
// // ========= CategoryCard widget ================
// class CategoryCard extends StatelessWidget {
//   final String categoryName;
//
//   const CategoryCard({
//     Key? key,
//     required this.categoryName,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Column(
//         children: [
//           SizedBox(height: 8),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Add padding for better spacing
//             decoration: BoxDecoration(
//               color: Colors.white24, // Set the desired background color
//               borderRadius: BorderRadius.circular(8), // Optional: Add rounded corners
//             ),
//             child: Text(
//               categoryName,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
// // ========= card ==========
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
//
//
//



















import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_project/pages/login.dart';
import 'package:mini_project/pages/signUp.dart';
import 'package:mini_project/pages/splashScreen.dart';

import 'blogs/api_service.dart';
import 'blogs/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: SizedBox(
          width: 300,
          height: 300,
          child: Image.asset(
            'assets/images/logo1.png',
            width: 300,
            height: 300,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginHomePage(),
                ),
              );
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SvgPicture.string(
            '''
            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 16 16">
              <path fill="currentColor" d="M8 0h1v16H8z" />
            </svg>
            ''',
            color: Colors.white,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupPage(),
                ),
              );
            },
            child: const Text(
              'Sign up',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8.0 , horizontal: 8.0),
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
                  padding: EdgeInsets.symmetric(vertical: 4),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: CategoryList(),
            ),
            SizedBox(
                height: 600,
                child: BlogListPage(),
            ),
          ],
        ),
      ),
    );
  }
}





// ========= card ==========
class BlogListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<Blog>>(
        future: fetchBlogs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Blog>? blogs = snapshot.data;
            return ListView.builder(
              itemCount: blogs?.length ?? 0,
              itemBuilder: (context, index) {
                Blog blog = blogs![index];
                return GestureDetector( // Use GestureDetector for tap detection
                  onTap: () {
                    // Navigate to the BlogDetailsPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlogDetailsPage(blog: blog),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[900], // Adjust color as needed
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
                                backgroundImage: NetworkImage(blog.author.profileUrl),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    blog.author.username,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Created: ${blog.getFormattedDate()}",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            blog.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[100],
                            ),
                          ),
                          SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              blog.thumbnail,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 15),
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
                                          icon: Icon(Icons.favorite_border, color: Colors.white),
                                          onPressed: () {
                                            print('Heart icon pressed');
                                          },
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '${blog.numberOfLikes}', // Display the number of likes
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 16),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.share_outlined, color: Colors.white),
                                          onPressed: () {
                                            print('Share icon pressed');
                                          },
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          '${blog.numberOfBookmarks}', // Assuming sharesCount
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.bookmark_border, color: Colors.white),
                                    onPressed: () {
                                      print('Bookmark icon pressed');
                                    },
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${blog.numberOfBookmarks}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No blogs found'));
          }
        },
      ),
    );
  }
}


class BlogDetailsPage extends StatelessWidget {
  final Blog blog;

  BlogDetailsPage({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // title: Text(blog.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[900],
        iconTheme: IconThemeData(
          color: Colors.white, // Set the back button color to white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8),
              //   child: Image.network(blog.thumbnail),
              // ),
              SizedBox(height: 16),
              Text(
                blog.title,
                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "By ${blog.author.username} - ${blog.getFormattedDate()}",
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              Text(
                blog.content,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 15),

              // Display categories here
              Wrap(
                spacing: 8.0, // Space between categories
                children: blog.categories.map((category) {
                  return Text(
                    '# ${category.name}',
                    style: TextStyle(color: Colors.grey[600]),
                  );
                }).toList(), // Convert Iterable to List
              ),


              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(blog.thumbnail),
              ),
              SizedBox(height: 15),
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
                              icon: Icon(Icons.favorite_border, color: Colors.white),
                              onPressed: () {
                                print('Heart icon pressed');
                              },
                            ),
                            SizedBox(width: 4),
                            Text(
                              '${blog.numberOfLikes}', // Display the number of likes
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.share_outlined, color: Colors.white),
                              onPressed: () {
                                print('Share icon pressed');
                              },
                            ),
                            SizedBox(width: 4),
                            Text(
                              '${blog.numberOfBookmarks}', // Assuming sharesCount
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.bookmark_border, color: Colors.white),
                        onPressed: () {
                          print('Bookmark icon pressed');
                        },
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${blog.numberOfBookmarks}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}











