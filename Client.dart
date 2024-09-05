
import 'package:dart1_rout/broject_oop/BankSestym.dart';

class Client{
  String name;
  String address;
  String phoneNumber;
  late BankAccount bankAccount;
  Client(this.name , this.address , this.phoneNumber );
  void view(){
    print('name:$name');
    print('phone:$phoneNumber');
    print('address:$address');
    print('address:${bankAccount.balance}');
  }
}