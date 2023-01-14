class ReviewModel {
  ReviewModel({
    required this.id,
    required this.imageUrl,
    required this.restaurantName,
    required this.nickName,
    required this.ratingStar,
    required this.review,
  });

  final int id;
  final String? imageUrl;
  final String restaurantName;
  final String nickName;
  final int ratingStar;
  final String review;
}
