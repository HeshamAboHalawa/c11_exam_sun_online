import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AudiobooksScreen(),
    );
  }
}

class AudiobooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Logo Small.png', height: 30),
            SizedBox(width: 8),
            //Text('AudiBooks', style: TextStyle(color: Colors.black)),
            Image.asset('assets/images/AudiBooks..png', height: 30),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryButton('Art'),
                  CategoryButton('Business'),
                  CategoryButton('Comedy'),
                  CategoryButton('Drama'),
                ],
              ),
              SizedBox(height: 32),
              SectionHeader(title: 'Recommended For You'),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BookCard('The Silence', 'assets/images/Image Placeholder 1.png'),
                    BookCard('The Speaker', 'assets/images/Image Placeholder 400x600.png'),
                  ],
                ),
              ),
              SizedBox(height: 32),
              SectionHeader(title: 'Best Seller'),
              SizedBox(height: 16),
              BookCard('Light Mage', 'assets/images/Image Placeholder 2.png', isHorizontal: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  CategoryButton(this.title);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(title),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        TextButton(onPressed: () {}, child: Text('See more')),
      ],
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final bool isHorizontal;

  BookCard(this.title, this.imageUrl, {this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isHorizontal ? double.infinity : 150,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl, fit: BoxFit.cover, height: isHorizontal ? 200 : 150),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}