import 'package:flutter/material.dart';
import '../../models/article.dart';
import '../../widgets/app_styles.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: article.urlToImage.isNotEmpty
                ? Image.network(article.urlToImage, fit: BoxFit.cover)
                : Container(color: kTopColor),
          ),
          Container(
            margin: const EdgeInsets.only(top: 350),
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF5F5F5), kBottomColor],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    article.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kDarkColor),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(article.source),
                        backgroundColor: kTopColor,
                      ),
                      Text(
                        article.publishedAt.substring(0, 10),
                        style: const TextStyle(color: kGreyColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    article.description,
                    style: const TextStyle(fontSize: 16, height: 1.5, color: Color(0xFF404040)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    article.content,
                    style: const TextStyle(fontSize: 16, height: 1.5, color: kGreyColor),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: kDarkColor),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}