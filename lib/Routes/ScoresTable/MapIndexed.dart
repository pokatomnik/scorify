Iterable<O> mapIndexed<I, O>(
  Iterable<I> iterable,
  O Function(I item, int index) mapper
) sync* {
  int i = 0;
  for (final item in iterable) {
    yield mapper(item, i);
    i += 1;
  }
}