import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/articl_model.dart';

class ArticlView extends StatelessWidget {
  Articles articlModel;

  ArticlView(this.articlModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              articlModel.urlToImage ?? "",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              articlModel.source?.name ?? "",
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF79828B),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              articlModel.title ?? "",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              articlModel.publishedAt ?? "",
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF79828B),
              ),
            ),
          )
        ],
      ),
    );
  }
}
