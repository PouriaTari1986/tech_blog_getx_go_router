



import 'package:clean_app/features/home_feature/domain/entities/article_entity.dart';
import 'package:clean_app/features/home_feature/domain/repositories/artcicle_repository.dart';

class HomeArticleUseCase {
  
  HomeArtcicleRepository artcicleRepository;
  HomeArticleUseCase(this.artcicleRepository);

  Future<List<HomeArticleEntity>> call()async{
   return await artcicleRepository.getArticleItems();
  }
}