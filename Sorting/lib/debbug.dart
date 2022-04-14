import 'package:sorting/sorting/MergeSort.dart';
import 'package:sorting/sorting/QuickSort.dart';

void main()async {

  List<int> array = [10,23,4,5,4,3,13,45,6,4];
  List<int> array2 = [10,2,4,6,2,10,22,10,10,22,3,4,2,5,6,78,7,6,5];

  await quickSort(array2, 0, array2.length-1, (){},1000);

  for(int i = 0; i <array2.length; i++){

    print(array2[i]);
  }
}