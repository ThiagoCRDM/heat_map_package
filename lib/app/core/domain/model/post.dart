import 'images.dart';

class Post {
  final String? id;
  final Location location;
  final List<Image> images;

  Post({required this.id, required this.location, required this.images});
}

class Location {
  final double latitude;
  final double longitude;
  final String district;

  Location({
    required this.latitude,
    required this.longitude,
    required this.district,
  });
}
