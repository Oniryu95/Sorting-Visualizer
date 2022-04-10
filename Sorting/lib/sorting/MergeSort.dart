Future<void> mergeSort(List array, int indexFirsEl, int indexLastEl,Function viewController) async {
  int half = ((indexFirsEl + indexLastEl) / 2).floor();

  if (half == indexFirsEl) {
    return;
  }
  viewController(indexFirsEl,half,array,true);
  await Future.delayed(Duration(milliseconds: 1000 ~/ array.length));
  await mergeSort(array, indexFirsEl, half,viewController);
  viewController(half,indexLastEl,array,true);
  await Future.delayed(Duration(milliseconds: 1000 ~/ array.length));
  await mergeSort(array, half, indexLastEl,viewController);

  List leftPart = List.filled(half - indexFirsEl, 0, growable: false);
  List rightPart = List.filled(indexLastEl - half, 0, growable: false);

  for (int i = 0; i < leftPart.length; i++) {
    leftPart[i] = array[indexFirsEl + i];
  }

  for (int i = 0; i < rightPart.length; i++) {
    rightPart[i] = array[half + i];
  }

  await merge(array, leftPart, rightPart, indexFirsEl,indexLastEl,viewController);

  if(leftPart.length+rightPart.length == array.length){

    viewController(-1,-1,array,false);
  }
}

Future<void> merge(List array, List leftPart, List rightPart, int indexFirsEl,int indexLastEl,Function viewController) async {

  int indexLef = 0;
  int indexRight = 0;
  int half = (indexLastEl-indexFirsEl/2).floor();

  while (indexLef < leftPart.length && indexRight < rightPart.length) {
    if (leftPart[indexLef] > rightPart[indexRight]) {
      array[indexFirsEl++] = rightPart[indexRight++];
      viewController(indexFirsEl,half++,array,true);
    } else {
      array[indexFirsEl++] = leftPart[indexLef++];
      viewController(indexFirsEl,indexFirsEl,array,true);
    }

    await Future.delayed(Duration(milliseconds: 1000 ~/ array.length));
  }

  if (indexLef != leftPart.length) {
    while (indexLef < leftPart.length) {
      array[indexFirsEl++] = leftPart[indexLef++];
      viewController(indexFirsEl,indexFirsEl,array,true);
      await Future.delayed(Duration(milliseconds: 1000 ~/ array.length));
    }
  } else if (indexRight != rightPart.length) {
    while (indexRight < rightPart.length) {
      array[indexFirsEl++] = rightPart[indexRight++];
      viewController(indexFirsEl,half++,array,true);
      await Future.delayed(Duration(milliseconds: 1000 ~/ array.length));
    }
  }
}
