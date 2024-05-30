import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final String bookTitle = "The Great Gatsby";
  final String bookSubtitle = "F. Scott Fitzgerald";
  final String bookImageUrl = "https://example.com/gatsby.jpg";
  final String bookDescription = "Midwesterner Nick Carraway is lured into the lavish world of his neighbor, Jay Gatsby...";

  final String movieTitle = "The Great Gatsby";
  final String movieSubtitle = "Directed by Baz Luhrmann";
  final String movieImageUrl = "https://example.com/gatsby_movie.jpg";
  final String movieDescription = "A Midwesterner becomes fascinated with his nouveau riche neighbor, who obsesses over his lost love.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit a Review'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(title: "Book"),
            BookCard(
              title: bookTitle,
              subtitle: bookSubtitle,
              imageUrl: bookImageUrl,
              description: bookDescription,
              onPressed: () {
                // Handle submit review for book
              },
            ),
            SectionHeader(title: "Movie"),
            BookCard(
              title: movieTitle,
              subtitle: movieSubtitle,
              imageUrl: movieImageUrl,
              description: movieDescription,
              onPressed: () {
                // Handle submit review for movie
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String description;
  final VoidCallback onPressed;

  const BookCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(subtitle),
            trailing: Icon(Icons.favorite_border),
          ),
          SizedBox(height: 16),
          Center(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.6, // Adjust image width based on screen width
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Similarity",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Text("4.5 (44 reviews)"),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 40),
              Column(
                children: [
                  Text(
                    "Rating",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Text("3.2 (23 reviews)"),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Summary",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Divider(),
          Text(description),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.pink, // text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              child: Text('Submit a Review'),
            ),
          ),
        ],
      ),
    );
  }
}