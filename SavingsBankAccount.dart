import 'package:dart1_rout/broject_oop/BankSestym.dart';
import 'package:dart1_rout/broject_oop/Client.dart';

class SavingsBankAccount extends BankAccount{
  double minimumBalance;
  SavingsBankAccount( double balanced , [this.minimumBalance=1000]   ) : super( balanced );


  @override
  bool withdraw(double amount) {
    if (balance - amount > minimumBalance) {
      balance -= amount;
      print('done!');
      print('the balance is: $balance');
      return true;
    } else {
      print("can't withdraw");
      return false;
    }
  }
  @override
  bool deposit(double deposit) {
    if (deposit > 100) {
      balance += deposit;
      print('done!');
      print('the balance is: $balance');
      return true ;
    } else {
      print("you can't deposit less than 100");
      return false;
    }
  }

}
void main(){
  Client client = Client("name", "address", "phoneNumber");
  BankAccount bankAccount= BankAccount();
  client.bankAccount= bankAccount;
  bankAccount.client=client;

}