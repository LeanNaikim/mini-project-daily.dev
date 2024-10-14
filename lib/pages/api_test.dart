// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// void main() {
//   runApp(SearchPage());
// }
//
// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Search Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _searchController = TextEditingController();
//   List<dynamic> _blogs = [];
//   bool _isLoading = false;
//   String? _errorMessage; // To hold error messages
//
//   Future<void> _searchBlogs(String query) async {
//     if (query.isEmpty) return;
//
//     setState(() {
//       _isLoading = true; // Start loading
//       _errorMessage = null; // Reset error message
//       _blogs = []; // Clear previous results
//     });
//
//     final url = 'https://blog-api.automatex.dev/blogs?title=$query';
//     print('Fetching blogs for query: $query'); // Debugging
//
//     try {
//       final response = await http.get(Uri.parse(url));
//       print('Response status: ${response.statusCode}'); // Debugging
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print('Response data: $data'); // Debugging
//
//         setState(() {
//           _blogs = data['blogs'] ?? [];
//           if (_blogs.isEmpty) {
//             _errorMessage = 'No blogs found';
//           }
//         });
//       } else {
//         setState(() {
//           _errorMessage = 'Error: ${response.reasonPhrase}'; // Set error message for non-200 responses
//         });
//       }
//     } catch (e) {
//       print('Error: $e'); // Catch and log any errors
//       setState(() {
//         _errorMessage = 'An error occurred: $e'; // Set error message
//       });
//     } finally {
//       setState(() {
//         _isLoading = false; // Reset loading state
//       });
//     }
//   }
//
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
//
//             },
//             child: const Text(
//               'Login',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           // Your SVG and Sign Up button code...
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // Search bar with ElevatedButton
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _searchController,
//                       decoration: InputDecoration(
//                         hintText: 'Search',
//                         hintStyle: TextStyle(color: Colors.grey[200]),
//                         filled: true,
//                         fillColor: Colors.grey[800],
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(50),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       _searchBlogs(_searchController.text); // Trigger search
//                     },
//                     child: Text('Search'),
//                   ),
//                 ],
//               ),
//             ),
//             // Display loading indicator or error message
//             if (_isLoading)
//               Center(child: CircularProgressIndicator())
//             else if (_errorMessage != null)
//               Center(child: Text(_errorMessage!, style: TextStyle(color: Colors.red)))
//             else if (_blogs.isEmpty)
//                 Center(child: Text('No blogs found', style: TextStyle(color: Colors.white)))
//               else
//                 ListView.builder(
//                   shrinkWrap: true, // Allow ListView inside SingleChildScrollView
//                   physics: NeverScrollableScrollPhysics(), // Prevent scrolling of ListView
//                   itemCount: _blogs.length,
//                   itemBuilder: (context, index) {
//                     final blog = _blogs[index];
//                     return ListTile(
//                       title: Text(blog['title'] ?? 'No Title', style: TextStyle(color: Colors.white)),
//                       subtitle: Text(blog['description'] ?? 'No Description', style: TextStyle(color: Colors.grey)),
//                     );
//                   },
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
// }
