import 'package:movie_app/core/model/trailer_model.dart';
import 'package:movie_app/domain/movies/entities/trailer.dart';

class TrailerMapper {
  static toEntity(TrailerModel trailerModel) {
    return TrailerEntity(
      iso6391: trailerModel.iso6391,
      iso31661: trailerModel.iso31661,
      name: trailerModel.name,
      key: trailerModel.key,
      site: trailerModel.site,
      size: trailerModel.size,
      type: trailerModel.type,
      official: trailerModel.official,
      publishedAt: trailerModel.publishedAt,
      id: trailerModel.id,
    );
  }
}
