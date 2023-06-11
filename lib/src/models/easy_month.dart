class EasyMonth {
  final String name;
  final int vale;

  const EasyMonth({
    required this.name,
    required this.vale,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EasyMonth &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          vale == other.vale;

  @override
  int get hashCode => Object.hash(
        name.hashCode,
        vale.hashCode,
      );

  @override
  String toString() => "<$name,$vale>";
}
