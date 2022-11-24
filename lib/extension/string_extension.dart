extension TextModification on String{
  String addS(int length)=>(length<=1)?this:'${this}s';

  String prefixAddDigit(int placeDigit,String placeHolder)=>padLeft(placeDigit,placeHolder);


}