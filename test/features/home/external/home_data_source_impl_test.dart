import 'package:coolmovies/features/home/infra/model/home_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return a home model', () {
    final json = {
      "id": "70351289-8756-4101-bf9a-37fc8c7a82cd",
      "imgUrl":
          "https://upload.wikimedia.org/wikipedia/en/d/d4/Rogue_One%2C_A_Star_Wars_Story_poster.png",
      "title": "Rogue One: A Star Wars Story"
    };

    final model = HomeModel.fromJson(json);

    expect(model, isA<HomeModel>());
  });
}
