class ApiUrlConstant{
  ApiUrlConstant._();
  static const hostDlUrl ="https://techblog.sasansafari.com";
  static const baseUrl ="https://techblog.sasansafari.com/Techblog/api/";
  static const getHomeItems ="${baseUrl}home/?command=index";
  static const getArticleList ="${baseUrl}article/get.php?command=new&user_id=";
  static const publishedByMe ="${baseUrl}article/get.php?command=published_by_me&user_id=";
  static String getArticleInfo(String articleId) {
    return "${baseUrl}article/get.php?command=info&id=$articleId&user_id=1";
  }
  static const postRegister ="${baseUrl}register/action.php";
  static const articlePost ="${baseUrl}article/post.php";
  static const podcastFiles ="${baseUrl}podcast/get.php?command=get_files&podcats_id=";
  static const postPodcast = "${baseUrl}podcast/post.php";
  static const publishedByMePodcast = "${baseUrl}podcast/get.php?command=published_by_me&user_id=";
  
  static String getArticleListTypes({
    required ArticleListType type,
    required String id,
  }){
    switch (type) {
      case ArticleListType.articleList:
        return "${baseUrl}article/get.php?command=new&user_id=";
      case ArticleListType.publishedByMe:
        return "${baseUrl}article/get.php?command=published_by_me&user_id=";
      case ArticleListType.byTag:
        return "${baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=1";
      case ArticleListType.byCat:
        return "${baseUrl}article/get.php?command=get_articles_with_cat_id&cat_id=$id&user_id=1";
      case ArticleListType.favouriteList:
        return "{baseUrl}article/get.php?command=favorites&user_id=";
        
      }
  }


}
  enum ArticleListType{
    favouriteList,
   articleList,
   publishedByMe,
   byCat,
   byTag,
  }