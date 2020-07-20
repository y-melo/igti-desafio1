import 'dart:convert';

class Account {
  var id;
  var agencia;
  var conta;
  var name;
  var balance;

  Account(this.id, this.agencia, this.conta, this.name, this.balance);

  factory Account.fromJson(dynamic json) => Account(
      json['id'] as int,
      json['agencia'] as int,
      json['conta'] as int,
      json['name'] as String,
      json['balance'] as double);

  @override
  String toString() => '{${this.id},${this.agencia},${this.conta},${this.name},${this.balance}}';
}

// More methods
class AccountHandler {
  static List<Account> accountList(String json) {
    List<Account> accountList = new List<Account>();
    var _accountJson = jsonDecode(json);
    for (int i; i < _accountJson.length; i++) {
      var account = new Account(_accountJson['id'], _accountJson['agencia'],
          _accountJson['conta'], _accountJson['name'], _accountJson['balance']);
      accountList.add(account);
    }
    return accountList;
  }
}
