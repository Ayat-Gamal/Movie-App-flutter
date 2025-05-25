import '../../../core/entities/keyword_entity.dart';
import '../../../core/models/keywrod_model.dart';

class KeywordMapper {
  static KeywordEntity toEntity(KeywordModel keywordModel) {
    return KeywordEntity(
        name: keywordModel.name,
        id: keywordModel.id
    );
  }
}
