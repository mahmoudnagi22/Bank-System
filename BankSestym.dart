import 'package:dart1_rout/broject_oop/Client.dart';

class BankAccount{
  static int ads = 1000;
  late int accountID;
  double balance;
 late  Client client;
  BankAccount([this.balance=0] ){
    accountID=ads;
    ads++;
  }

  bool withdraw(double  amountOfMoney){
    if(amountOfMoney < 0 ){
      print('error');
      return false;
    }
    if(amountOfMoney > balance){
      print("error");
      return false;
    }
    balance-=amountOfMoney;
    print('done!');
    return true;
  }
  bool deposit(double depositsNoney ){

    if(depositsNoney < 0 ){
      print('error');
      return false;
    }
    balance+=depositsNoney;
    print('the balance is: $balance');
    return true;
  }
  void view(){
    print('balance :${balance}');
  }
}