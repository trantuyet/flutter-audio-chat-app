// Stream config
import 'package:flutter/material.dart';

const streamKey = 'gwv65uqpsgzg';

const firstItem = DemoUser(
  id: '1',
  name: 'Tên thằng A',
  image:
      'https://i.pinimg.com/originals/7f/f6/61/7ff6616606f59e2d2976b2cddfc4d9bc.jpg',
);

const secondItem = DemoUser(
  id: '2',
  name: 'Tên thằng B',
  image:
      'https://cdnmedia.thethaovanhoa.vn/Upload/leenEplQKY7jsunvYUYgg/files/2021/05/KTH17.jpg',
);

@immutable
class DemoUser {
  final String id;
  final String name;
  final String image;

  const DemoUser({
    required this.id,
    required this.name,
    required this.image,
  });
}