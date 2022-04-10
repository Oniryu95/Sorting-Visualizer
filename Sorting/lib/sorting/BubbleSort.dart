Future<void> bubbleSort(List array, Function viewController) async {
  int temp;

  for (int i = 0; i < array.length; i++) {
    for (int j = i + 1; j < array.length; j++) {
      await Future.delayed(Duration(milliseconds: 1000 ~/ array.length));

      if (array[j] < array[i]) {
        temp = array[i];
        array[i] = array[j];
        array[j] = temp;
      }

      viewController(i, j, array, true);
    }
  }
  viewController(-1, -1, array, false);
}
