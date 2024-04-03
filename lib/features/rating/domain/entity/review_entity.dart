class ReviewEntity {
  final String title;
  final String body;
  final String userId;
  final String movieReviewId;
  final int rating;

  ReviewEntity(
      {required this.title,
      required this.body,
      required this.userId,
      required this.movieReviewId,
      required this.rating});
}
