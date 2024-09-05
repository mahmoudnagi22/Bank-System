import 'dart:io';
import 'package:dart1_rout/broject_oop/BankSestym.dart';
import 'package:dart1_rout/broject_oop/Client.dart';
import 'package:dart1_rout/broject_oop/SavingsBankAccount.dart';

class BankingApp {
  List<Client> clients = [];
  List<BankAccount> accounts = [];
  BankingApp();
  creatTestData() {
    for (int i = 0; i < 10; i++) {
      Client client = Client('name$i', 'address$i', 'phoneNumber$i');
      BankAccount bankAccount = BankAccount((1000 * i).toDouble());
      client.bankAccount = bankAccount;
      bankAccount.client = client;
      accounts.add(bankAccount);
      clients.add(client);
    }
  }

  viewMenue() {
    while (true) {
      print('''
       1-create a bank account
       2-list all the available bank accounts
       3-display the account details
       4-withdraw money
       5-deposit money.
       6-delete account
       7-exit
          select number to contenue''');
      int number = int.parse(stdin.readLineSync()!);
      switch (number) {
        case 1:
          {
            createNewAccount();
            break;
          }
        case 2:
          {
            printAllData();
            break;
          }
        case 3:
          {
            printAccountDetails();
            break;
          }
        case 4:
          {
            withdraw();
            break;
          }
        case 5:
          {
            deposit();
            break;
          }
        case 6:
          {
            deleteAccount();
            break;
          }
        case 7:
          {
            //exit();
            return;
          }
      }
    }
  }

  void printAllData() {
    for (var a in clients) {
      print("name : ${a.name}");
      print("address : ${a.address}");
      print("phoneNumber :${a.phoneNumber}");
      print("balance : ${a.bankAccount.balance}");
      print('================================');
    }
  }

  int searchAccountIdGetIndex(int accountId) {
    for (int i = 0; i < accounts.length; i++) {
      if (accounts[i].accountID == accountId) {
        return i;
      }
    }
    return -1;
  }

  BankAccount? searchAccountIdGetAccount(int accountId) {
    for (int i = 0; i < accounts.length; i++) {
      if (accounts[i].accountID == accountId) {
        return accounts[i];
      }
    }
    return null;
  }

  void printAccountDetails() {
    print("enter id : ");
    int id = int.parse(stdin.readLineSync()!);
    BankAccount? bankAccount = searchAccountIdGetAccount(id);
    if (bankAccount != null) {
      bankAccount.view();
    } else {
      print('account not available');
    }
  }

  void withdraw() {
    print("enter id : ");
    int id = int.parse(stdin.readLineSync()!);
    print("enter amount");
    double amount = double.parse(stdin.readLineSync()!);
    BankAccount? Account = searchAccountIdGetAccount(id);
    if (Account != null) {
      Account.withdraw(amount);
    } else {
      print('account not available');
    }
  }

  void deposit() {
    print("enter id : ");
    int id = int.parse(stdin.readLineSync()!);
    print("enter amount");
    double amount = double.parse(stdin.readLineSync()!);
    BankAccount? Account = searchAccountIdGetAccount(id);
    if (Account != null) {
      Account.deposit(amount);
    } else {
      print('account not available');
    }
  }

  void deleteAccount() {
    print("enter id : ");
    int id = int.parse(stdin.readLineSync()!);
    int index = searchAccountIdGetIndex(id);
    if (index != -1) {
      accounts.removeAt(index);
      clients.removeAt(index);
    } else {
      print('account not available');
    }
  }

  void createNewAccount() {
    print("enter the name : ");
    String name = stdin.readLineSync()!;
    print("enter the address : ");
    String address = stdin.readLineSync()!;
    print("enter the phone : ");
    String phoneNum = stdin.readLineSync()!;
    print("enter the balanc : ");
    double balanc = double.parse(stdin.readLineSync()!);
    print('do you want a saving account?(y/n)');
    bool savingAccount = (stdin.readLineSync()!) == 'y' ? true : false;

    Client client = Client(name, address, phoneNum);
    BankAccount bankAccount =
        savingAccount ? SavingsBankAccount(balanc) : BankAccount(balanc);
    client.bankAccount = bankAccount;
    bankAccount.client = client;
    accounts.add(bankAccount);
    clients.add(client);
    print("done ");
  }
}

void main() {
  BankingApp bankingApp = BankingApp();
  bankingApp.viewMenue();
}
