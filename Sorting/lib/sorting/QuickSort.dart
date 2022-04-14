import 'dart:math';

Future<void> quickSort(List array,int firstIndex, int lastIndex,Function viewController,int speedAnimation) async{

  if(firstIndex < lastIndex) {

    int indexPivot = await partitionOrder(array, firstIndex, lastIndex, viewController,speedAnimation);
    viewController(firstIndex,indexPivot-1,array,true);
    await Future.delayed(Duration(milliseconds: speedAnimation ~/ array.length));
    await quickSort(array, firstIndex, indexPivot - 1, viewController,speedAnimation);
    viewController(indexPivot+1,lastIndex,array,true);
    await Future.delayed(Duration(milliseconds: speedAnimation ~/ array.length));
    await quickSort(array, indexPivot + 1, lastIndex, viewController,speedAnimation);
  }

  if(firstIndex > array.length-2){

    viewController(-1,-1,array,false);
  }
}

Future<int> partitionOrder(List array, int firstIndex, int lastIndex, Function viewController,int speed) async{

  int indexSwap = firstIndex;
  int pivot = array[lastIndex];
  int temp = 0;

  for(int i = firstIndex; i < lastIndex;i++){

    if(array[i] <= pivot){

      temp = array[indexSwap];
      array[indexSwap] = array[i];
      array[i] = temp;
      indexSwap++;
    }
    viewController(indexSwap,i,array,true);
    await Future.delayed(Duration(milliseconds: speed ~/ array.length));
  }

  array[lastIndex] = array[indexSwap];
  array[indexSwap] = pivot;
  viewController(indexSwap,lastIndex-1,array,true);
  await Future.delayed(Duration(milliseconds: speed ~/ array.length));

  return indexSwap;
}