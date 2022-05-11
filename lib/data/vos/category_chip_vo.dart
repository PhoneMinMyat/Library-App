class CategoryChipVO {
  final String name;
  bool isSelected;
  CategoryChipVO({
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryChipVO &&
      other.name == name &&
      other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;
}
