
import 'package:clean_app/core/config/constants/api_constants.dart';

class ArticleListArgs {
  final ArticleListType type;
  final String id;
  final String title;

  const ArticleListArgs({
    required this.type,
    required this.id,
    required this.title,
  });
}