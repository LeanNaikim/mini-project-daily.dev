import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'package:flutter/material.dart';

// Fetch the list of blogs from the API
Future<List<Blog>> fetchBlogs() async {
  final response = await http.get(Uri.parse('https://blog-api.automatex.dev/blogs'));

  if (response.statusCode == 200) {
    // Parse the JSON data
    List<dynamic> jsonList = jsonDecode(response.body)['blogs'];

    // Convert JSON data into a list of Blog objects
    return jsonList.map((json) => Blog.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load blogs');
  }
}


class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late Future<List<Category>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = fetchCategories(); // Fetch categories when the widget is initialized
  }

  // Function to fetch categories from the API
  Future<List<Category>> fetchCategories() async {
    final url = 'https://blog-api.automatex.dev/categories'; // Replace with your actual API URL
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of categories
      List data = json.decode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: futureCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Show loading spinner
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No categories found'));
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: snapshot.data!.map((category) {
                return CategoryCard(categoryName: category.name); // Pass category data to CategoryCard
              }).toList(),
            ),
          );
        }
      },
    );
  }
}

// Your existing CategoryCard widget
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
          ),
        ],
      ),
    );
  }
}


