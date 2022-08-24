import 'dart:convert';
import 'dart:io';

void main(){

  print('Digite o numero');
  var number = stdin.readLineSync(encoding: utf8);
  var isvalid = isNumeric(number);
  if(isvalid == false){
    print('Digite um numero valido!!');
  }else{
    var convertednumb = int.parse(number!);
    print('o resultado e ${multiplos(convertednumb)}');
  }

}
multiplos(limite){
  int multiplode3 = 0;
  int multiplode5 = 0;
  int i = 0;
  for(i = 0; i < limite; i++){
    if(i % 3 == 0)
      multiplode3 += i;
    if(i % 5 == 0)
      multiplode5 += i;
  }  int res = multiplode3 + multiplode5;
  return(res);

}
bool isNumeric(s) {
  if(s == '' || s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}