abstract class CreateReviewDataSource {
  Future<bool> call(
    String title,
    String body,
    String movieId,
    int rating,
  );
}
