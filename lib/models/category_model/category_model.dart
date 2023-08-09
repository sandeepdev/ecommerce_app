import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Category extends Equatable {
  final String name;
  final String imgUrl;
  const Category({required this.imgUrl, required this.name});
  static Category fromsnapshot(DocumentSnapshot snap) {
    Category category = Category(imgUrl: snap['imgUrl'], name: snap['name']);
    return category;
  }

  @override
  List<Object?> get props => [name, imgUrl];
  // static List<Category> categories = [
  //   const Category(
  //       imgUrl:
  //           'https://images.unsplash.com/photo-1543253687-c931c8e01820?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80',
  //       name: 'soft drink'),
  //   const Category(
  //       imgUrl:
  //           'https://images.unsplash.com/photo-1615478503562-ec2d8aa0e24e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
  //       name: 'smoothies'),
  //   const Category(
  //       imgUrl:
  //           'https://media.istockphoto.com/id/1313351665/photo/water-bottle.webp?s=2048x2048&w=is&k=20&c=t5jHkJ22GxP9gouxcsjwv78nzVuT2YSklro2ErqShuQ=',
  //       name: 'water')
  // ];
}
