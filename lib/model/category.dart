import 'package:news/utils/app_assests.dart';

class Category {
  String id;
  String title;
  String image;

  Category({required this.id, required this.title, required this.image});

  static List<Category> getCategoriesList(bool isDark) {
    return [
      //
      Category(
        id: 'general',
        title: 'General',
        image:
            isDark
                ? AppAssests.genaralWhiteImage
                : AppAssests.genaralBlackImage,
      ),
      Category(
        id: 'business',
        title: 'Business',
        image:
            isDark
                ? AppAssests.businessWhiteImage
                : AppAssests.businessBlackImage,
      ),
      Category(
        id: 'sports',
        title: 'Sports',
        image:
            isDark
                ? AppAssests.sportsWhiteImage
                : AppAssests.sportsBlackmage,
      ),
      Category(
        id: 'technology',
        title: 'Technology',
        image:
            isDark
                ? AppAssests.technologyWhiteImage
                : AppAssests.technologyBlackImage,
      ),
      Category(
        id: 'entertainment',
        title: 'Entertainment',
        image:
            isDark
                ? AppAssests.entertainmentWhiteImage
                : AppAssests.entertainmentBlackImage,
      ),
      Category(
        id: 'health',
        title: 'Health',
        image:
            isDark
                ? AppAssests.healthWhiteImage
                : AppAssests.healthBlackImage,
      ),
      Category(
        id: 'science',
        title: 'Science',
        image:
            isDark
                ? AppAssests.scienceWhiteImage
                : AppAssests.scienceBlackImage,
      ),
    ];
  }
}
