import 'package:flutter/material.dart';

class ImageShoes {
  ImageShoes(
    this.image,
    this.color,
    this.desc
  );
  final String image;
  final Color color;
  final String desc;
}

class Shoes {
  Shoes(
    this.name,
    this.category,
    this.price,
    this.punctuation,
    this.listImage,
  );
  final String name;
  final String category;
  final String price;
  final int punctuation;
  final List<ImageShoes> listImage;
}