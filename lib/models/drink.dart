class Drink {
  String name;
  bool selected;

  Drink(this.name, this.selected);

  Drink copyWith({String name, bool selected}) {
    return Drink(name ?? this.name, selected ?? this.selected);
  }
}
