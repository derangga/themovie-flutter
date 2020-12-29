extension ListExtension<E> on List<E> {
  List<E> orEmpty() {
    return this != null ? this : [];
  }
}
