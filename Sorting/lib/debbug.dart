import 'package:sorting/sorting/MergeSort.dart';

void main() async{

  List<int> array = [10,23,4,5,4,3,13,45,6,4];

  await mergeSort(array,0,array.length,(){});

  for(int i = 0; i <array.length; i++){

    print(array[i]);
  }
}