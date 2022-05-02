class GenreVO {
  final int id;
  final String name;
  bool isSelected;
  GenreVO({
    required this.id,
    required this.name,
    required this.isSelected,
  });

  void onTap() {
    if (isSelected == false) {
      isSelected = true;
    } else {
      isSelected = false;
    }
  }
}
