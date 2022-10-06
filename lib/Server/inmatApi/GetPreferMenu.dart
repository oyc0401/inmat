class InMatApi {
  static InMatHome get home {
    return InMatHome();
  }
}

class InMatHome {
  Future<MenuThumbnail> Getprefer(Gender gender) async {
    return MenuThumbnail(
      id: "dfvcas",
      imageUrl: "https/dsadadsdas",
      name: "김치볶음밥",
    );
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
