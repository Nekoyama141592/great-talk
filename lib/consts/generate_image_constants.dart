enum GenerateImageEnum {
  sqare,
  horizontal,
  vertical;

  String text() {
    switch (this) {
      case (GenerateImageEnum.sqare):
        return '1024x1024';
      case (GenerateImageEnum.horizontal):
        return '1536x1024';
      case (GenerateImageEnum.vertical):
        return '1024x1536';
    }
  }
}
