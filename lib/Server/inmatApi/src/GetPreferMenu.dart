class InMatApi {
  InMatApi._() {}

  static InMatHome get home {
    return InMatHome();
  }
}

class InMatHome {
  Future<List<MenuThumbnail>> toDayMenu() async {
    return [
      MenuThumbnail(
        id: "daek1",
        imageUrl: "https/today_image1",
        name: "김치오믈렛",
      ),
      MenuThumbnail(
        id: "daek2",
        imageUrl: "https/today_image2",
        name: "참치오믈렛",
      ),
      MenuThumbnail(
        id: "daek3",
        imageUrl: "https/today_image3",
        name: "침치김치오믈렛",
      )
    ];
  }

  Future<List<MenuThumbnail>> preferMenu(Gender gender) async {
    return [
      MenuThumbnail(
        id: "vuds1",
        imageUrl: "https/prefer_image1",
        name: "김치볶음밥",
      ),
      MenuThumbnail(
        id: "vuds2",
        imageUrl: "https/prefer_image2",
        name: "참치볶음밥",
      ),
      MenuThumbnail(
        id: "vuds3",
        imageUrl: "https/prefer_image3",
        name: "침치김치볶음밥",
      )
    ];
  }

  Future<List<StoreThumbnail>> weekStore() async {
    return [
      StoreThumbnail(
        id: "xmir1",
        imageUrl: "https/week_image1",
        name: "홍콩반점",
      ),
      StoreThumbnail(
        id: "xmir2",
        imageUrl: "https/week_image2",
        name: "중국반점",
      ),
      StoreThumbnail(
        id: "xmir3",
        imageUrl: "https/week_image3",
        name: "대만반점",
      )
    ];
  }

}

enum Gender { man, woman }

class MenuThumbnail {
  MenuThumbnail({
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  String id;
  String imageUrl;
  String name;
}

class StoreThumbnail {
  StoreThumbnail({
    required this.id,
    required this.imageUrl,
    required this.name,
  });

  String id;
  String imageUrl;
  String name;
}
