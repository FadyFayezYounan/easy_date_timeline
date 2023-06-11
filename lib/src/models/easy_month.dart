class EasyMonth {
  const EasyMonth({
    required this.name,
    required this.vale,
  });

  /// The name of the month
  final String name;

  ///the value of the month and this value has range of 1,...12
  final int vale;

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
