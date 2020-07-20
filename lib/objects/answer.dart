import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Answer {
  var selectHandler;
  List accountsJson = [
    {
      "id": 1,
      "agencia": 10,
      "conta": 1001,
      "name": "Maria Roberta Fernandes",
      "balance": 587
    },
    {
      "id": 2,
      "agencia": 10,
      "conta": 1002,
      "name": "Gustavo Falcao Oliveira",
      "balance": 396
    },
    {
      "id": 3,
      "agencia": 10,
      "conta": 1003,
      "name": "Fernando Carlos Silva",
      "balance": 500
    },
    {
      "id": 4,
      "agencia": 10,
      "conta": 1004,
      "name": "Aline Batista Bernardes",
      "balance": 321
    },
    {
      "id": 5,
      "agencia": 10,
      "conta": 1005,
      "name": "Ivo Jose da Costa",
      "balance": 987
    },
    {
      "id": 6,
      "agencia": 10,
      "conta": 1006,
      "name": "Carlos Eduardo Lino",
      "balance": 3
    },
    {
      "id": 7,
      "agencia": 10,
      "conta": 1007,
      "name": "Henrique Santos Ferreira",
      "balance": 505
    },
    {
      "id": 8,
      "agencia": 10,
      "conta": 1008,
      "name": "Priscila Alves da Cunha",
      "balance": 1
    },
    {
      "id": 9,
      "agencia": 10,
      "conta": 1009,
      "name": "Luis Eduardo Nunes",
      "balance": 658
    },
    {
      "id": 10,
      "agencia": 10,
      "conta": 1010,
      "name": "Silvana Souto Costa",
      "balance": 1023
    },
    {
      "id": 11,
      "agencia": 10,
      "conta": 1011,
      "name": "Julia Maria Alves",
      "balance": 985
    },
    {
      "id": 12,
      "agencia": 10,
      "conta": 1012,
      "name": "Bernardo Almeida Alves",
      "balance": 842
    },
    {
      "id": 13,
      "agencia": 10,
      "conta": 1013,
      "name": "Lucas Andrade Barbosa",
      "balance": 753
    },
    {
      "id": 14,
      "agencia": 10,
      "conta": 1014,
      "name": "Fernanda Barbosa Ferreira",
      "balance": 951
    },
    {
      "id": 15,
      "agencia": 10,
      "conta": 1015,
      "name": "Caroline Aparecida da Cunha",
      "balance": 126
    },
    {
      "id": 16,
      "agencia": 10,
      "conta": 1016,
      "name": "Ivo Barros",
      "balance": 324
    },
    {
      "id": 17,
      "agencia": 10,
      "conta": 1017,
      "name": "Augusto Batista",
      "balance": 326
    },
    {
      "id": 18,
      "agencia": 10,
      "conta": 1018,
      "name": "Vania Borges Moreira",
      "balance": 634
    },
    {
      "id": 19,
      "agencia": 10,
      "conta": 1019,
      "name": "Valdete Macedo Souto",
      "balance": 426
    },
    {
      "id": 20,
      "agencia": 10,
      "conta": 1020,
      "name": "Jose Luis Borges",
      "balance": 153
    },
    {
      "id": 21,
      "agencia": 10,
      "conta": 1021,
      "name": "Marcelo Campos",
      "balance": 854
    },
    {
      "id": 22,
      "agencia": 10,
      "conta": 1022,
      "name": "Pedro Augusto Cardoso",
      "balance": 651
    },
    {
      "id": 23,
      "agencia": 10,
      "conta": 1023,
      "name": "Brena Martinho Carvalho ",
      "balance": 358
    },
    {
      "id": 24,
      "agencia": 10,
      "conta": 1024,
      "name": "Pedro Castro",
      "balance": 1985
    },
    {
      "id": 25,
      "agencia": 10,
      "conta": 1025,
      "name": "Camila Santini Costa",
      "balance": 1874
    },
    {
      "id": 26,
      "agencia": 10,
      "conta": 1026,
      "name": "Alessandra Albergaria Dias",
      "balance": 1254
    },
    {
      "id": 27,
      "agencia": 10,
      "conta": 1027,
      "name": "Giovanna Silva Dias",
      "balance": 9852
    },
    {
      "id": 28,
      "agencia": 10,
      "conta": 1028,
      "name": "Maria Fernanda Gomes",
      "balance": 45
    },
    {
      "id": 29,
      "agencia": 10,
      "conta": 1029,
      "name": "Maria Luiza Nunes",
      "balance": 658
    },
    {
      "id": 30,
      "agencia": 10,
      "conta": 1030,
      "name": "Luiza Duarte",
      "balance": 452
    },
    {
      "id": 31,
      "agencia": 25,
      "conta": 3001,
      "name": "Roberta Nunes",
      "balance": 458
    },
    {
      "id": 32,
      "agencia": 25,
      "conta": 3002,
      "name": "Roberta Miranda",
      "balance": 985
    },
    {
      "id": 33,
      "agencia": 25,
      "conta": 3003,
      "name": "Guilherme Zanin Freitas",
      "balance": 3265
    },
    {
      "id": 34,
      "agencia": 25,
      "conta": 3004,
      "name": "Guilherme Ferreira Silva",
      "balance": 2154
    },
    {
      "id": 35,
      "agencia": 25,
      "conta": 3005,
      "name": "Mario Augusto Fernandes",
      "balance": 456
    },
    {
      "id": 36,
      "agencia": 25,
      "conta": 3006,
      "name": "Luis Eduardo Ferreira",
      "balance": 981
    },
    {
      "id": 37,
      "agencia": 25,
      "conta": 3007,
      "name": "Claudia Ferreira Garcia",
      "balance": 854
    },
    {
      "id": 38,
      "agencia": 25,
      "conta": 3008,
      "name": "Wagner Silva e Silva",
      "balance": 568
    },
    {
      "id": 39,
      "agencia": 25,
      "conta": 3009,
      "name": "Daniel Henrique Gomes",
      "balance": 548
    },
    {
      "id": 40,
      "agencia": 25,
      "conta": 3010,
      "name": "Lucas Cavalcanti Gonçalves",
      "balance": 474
    },
    {
      "id": 41,
      "agencia": 25,
      "conta": 3011,
      "name": "Thiago Oliveira Lima",
      "balance": 658
    },
    {
      "id": 42,
      "agencia": 25,
      "conta": 3012,
      "name": "Rogeiro Olveira Lopes",
      "balance": 125
    },
    {
      "id": 43,
      "agencia": 25,
      "conta": 3013,
      "name": "Carlos Moniz Machado",
      "balance": 365
    },
    {
      "id": 44,
      "agencia": 25,
      "conta": 3014,
      "name": "Rafael Henrique Marques",
      "balance": 489
    },
    {
      "id": 45,
      "agencia": 25,
      "conta": 3015,
      "name": "Maira Imai Marques",
      "balance": 965
    },
    {
      "id": 46,
      "agencia": 25,
      "conta": 3016,
      "name": "Lucas Portugal Vieira",
      "balance": 236
    },
    {
      "id": 47,
      "agencia": 25,
      "conta": 3017,
      "name": "Gustavo Teixeira",
      "balance": 452
    },
    {
      "id": 48,
      "agencia": 25,
      "conta": 3018,
      "name": "Cristina Souza",
      "balance": 986
    },
    {
      "id": 49,
      "agencia": 25,
      "conta": 3019,
      "name": "Ana Marta Soares",
      "balance": 698
    },
    {
      "id": 50,
      "agencia": 25,
      "conta": 3020,
      "name": "Ana Maria Santos",
      "balance": 965
    },
    {
      "id": 51,
      "agencia": 25,
      "conta": 3021,
      "name": "Alberto Santana",
      "balance": 452
    },
    {
      "id": 52,
      "agencia": 25,
      "conta": 3022,
      "name": "Felipe Ribeiro",
      "balance": 365
    },
    {
      "id": 53,
      "agencia": 25,
      "conta": 3023,
      "name": "Henrique Bernardo Rocha",
      "balance": 265
    },
    {
      "id": 54,
      "agencia": 25,
      "conta": 3024,
      "name": "Breno Reis",
      "balance": 241
    },
    {
      "id": 55,
      "agencia": 25,
      "conta": 3025,
      "name": "Eduardo Olvieira",
      "balance": 852
    },
    {
      "id": 56,
      "agencia": 25,
      "conta": 3026,
      "name": "Luis Eduardo Ramos",
      "balance": 562
    },
    {
      "id": 57,
      "agencia": 25,
      "conta": 3027,
      "name": "Marcia Pereira",
      "balance": 65
    },
    {
      "id": 58,
      "agencia": 25,
      "conta": 3028,
      "name": "Gabriel Gomes Nascimento",
      "balance": 325
    },
    {
      "id": 59,
      "agencia": 25,
      "conta": 3029,
      "name": "Victor Moura",
      "balance": 965
    },
    {
      "id": 60,
      "agencia": 25,
      "conta": 3030,
      "name": "Ana Maria Silva",
      "balance": 5
    },
    {
      "id": 61,
      "agencia": 47,
      "conta": 2201,
      "name": "Jorge Ivan Jimenez",
      "balance": 36
    },
    {
      "id": 62,
      "agencia": 47,
      "conta": 2202,
      "name": "Pedro Luis Fragoso",
      "balance": 45
    },
    {
      "id": 63,
      "agencia": 47,
      "conta": 2203,
      "name": "Gesiane Leticia Alves",
      "balance": 98
    },
    {
      "id": 64,
      "agencia": 47,
      "conta": 2204,
      "name": "Glaucio de Souza",
      "balance": 1
    },
    {
      "id": 65,
      "agencia": 47,
      "conta": 2205,
      "name": "Richard Greeson",
      "balance": 189
    },
    {
      "id": 66,
      "agencia": 47,
      "conta": 2206,
      "name": "Roberto Lopes Ramos",
      "balance": 120
    },
    {
      "id": 67,
      "agencia": 47,
      "conta": 2207,
      "name": "Frederico Saito Rocha Costa",
      "balance": 110
    },
    {
      "id": 68,
      "agencia": 47,
      "conta": 2208,
      "name": "Garin da Silva",
      "balance": 658
    },
    {
      "id": 69,
      "agencia": 47,
      "conta": 2209,
      "name": "Franciele dos Santos Saraiva",
      "balance": 521
    },
    {
      "id": 70,
      "agencia": 47,
      "conta": 2210,
      "name": "Carlos Henrique Soares",
      "balance": 136
    },
    {
      "id": 71,
      "agencia": 47,
      "conta": 2211,
      "name": "Wellington Oliveira Filho",
      "balance": 215
    },
    {
      "id": 72,
      "agencia": 47,
      "conta": 2212,
      "name": "Gabriela da Rosa Bulla",
      "balance": 425
    },
    {
      "id": 73,
      "agencia": 47,
      "conta": 2213,
      "name": "Paola Silva Boff",
      "balance": 452
    },
    {
      "id": 74,
      "agencia": 47,
      "conta": 2214,
      "name": "Bruna Caroline Silva de Castro",
      "balance": 658
    },
    {
      "id": 75,
      "agencia": 47,
      "conta": 2215,
      "name": "Michele Cigolini Pulsy",
      "balance": 452
    },
    {
      "id": 76,
      "agencia": 47,
      "conta": 2216,
      "name": "Eduardo Renan do Nascimento",
      "balance": 235
    },
    {
      "id": 77,
      "agencia": 47,
      "conta": 2217,
      "name": "Julie Martin",
      "balance": 456
    },
    {
      "id": 78,
      "agencia": 47,
      "conta": 2218,
      "name": "Ricardo Antonio Garcia",
      "balance": 987
    },
    {
      "id": 79,
      "agencia": 47,
      "conta": 2219,
      "name": "Belisa Maria de Aguiar",
      "balance": 265
    },
    {
      "id": 80,
      "agencia": 47,
      "conta": 2220,
      "name": "Ariana Pereira",
      "balance": 125
    },
    {
      "id": 81,
      "agencia": 47,
      "conta": 2221,
      "name": "Guilherme Geraldo Aguiar",
      "balance": 3265
    },
    {
      "id": 82,
      "agencia": 47,
      "conta": 2222,
      "name": "Eduardo Renan do Nascimento",
      "balance": 111
    },
    {
      "id": 83,
      "agencia": 47,
      "conta": 2223,
      "name": "Gabriela Camila Silva de Lima",
      "balance": 214
    },
    {
      "id": 84,
      "agencia": 47,
      "conta": 2224,
      "name": "Ana Carolina de Melo Santos",
      "balance": 421
    },
    {
      "id": 85,
      "agencia": 47,
      "conta": 2225,
      "name": "Ana Katia dos Santos Dourado",
      "balance": 652
    },
    {
      "id": 86,
      "agencia": 47,
      "conta": 2226,
      "name": "Mauricio Jose da Silva",
      "balance": 326
    },
    {
      "id": 87,
      "agencia": 47,
      "conta": 2227,
      "name": "Ana Paula Sena Silva",
      "balance": 325
    },
    {
      "id": 88,
      "agencia": 47,
      "conta": 2228,
      "name": "Maria Eduarda de Jesus Santos",
      "balance": 253
    },
    {
      "id": 89,
      "agencia": 47,
      "conta": 2229,
      "name": "Angela Cardozo da Silva",
      "balance": 523
    },
    {
      "id": 90,
      "agencia": 47,
      "conta": 2230,
      "name": "Ariadne Fernanda de Freitas",
      "balance": 587
    },
    {
      "id": 91,
      "agencia": 33,
      "conta": 9101,
      "name": "Denner Saborido de Oliveira",
      "balance": 584
    },
    {
      "id": 92,
      "agencia": 33,
      "conta": 9102,
      "name": "Bruno Alvares",
      "balance": 654
    },
    {
      "id": 93,
      "agencia": 33,
      "conta": 9103,
      "name": "Marcelo Santos da Silva",
      "balance": 256
    },
    {
      "id": 94,
      "agencia": 33,
      "conta": 9104,
      "name": "Utai Oliveira",
      "balance": 125
    },
    {
      "id": 95,
      "agencia": 33,
      "conta": 9105,
      "name": "Priscila Milagres Godinho",
      "balance": 145
    },
    {
      "id": 96,
      "agencia": 33,
      "conta": 9106,
      "name": "Paulo Dias Macedo Neto",
      "balance": 941
    },
    {
      "id": 97,
      "agencia": 33,
      "conta": 9107,
      "name": "Flavio Luis Moreira Pereira",
      "balance": 854
    },
    {
      "id": 98,
      "agencia": 33,
      "conta": 9108,
      "name": "Arthur Marcos Calazans Belo",
      "balance": 456
    },
    {
      "id": 99,
      "agencia": 33,
      "conta": 9109,
      "name": "Ana Carolina de Melo Santos",
      "balance": 874
    },
    {
      "id": 100,
      "agencia": 33,
      "conta": 9110,
      "name": "Ricardo Camacho",
      "balance": 325
    },
    {
      "id": 101,
      "agencia": 33,
      "conta": 9111,
      "name": "Thiago Menezes",
      "balance": 65
    },
    {
      "id": 102,
      "agencia": 33,
      "conta": 9112,
      "name": "Luis Fernando Toscani",
      "balance": 45
    },
    {
      "id": 103,
      "agencia": 33,
      "conta": 9113,
      "name": "Ingrid Martinez Martins",
      "balance": 22
    },
    {
      "id": 104,
      "agencia": 33,
      "conta": 9114,
      "name": "Itamir Carvalho Junior",
      "balance": 42
    },
    {
      "id": 105,
      "agencia": 33,
      "conta": 9115,
      "name": "Gabriela Correa Alves",
      "balance": 125
    },
    {
      "id": 106,
      "agencia": 33,
      "conta": 9116,
      "name": "Vander Lucio Siqueira",
      "balance": 965
    },
    {
      "id": 107,
      "agencia": 33,
      "conta": 9117,
      "name": "Taisa Viturino da Silva",
      "balance": 745
    },
    {
      "id": 108,
      "agencia": 33,
      "conta": 9118,
      "name": "Norberto Gustavo da Costa",
      "balance": 895
    },
    {
      "id": 109,
      "agencia": 33,
      "conta": 9119,
      "name": "Vanessa do Carmo Martins",
      "balance": 311
    },
    {
      "id": 110,
      "agencia": 33,
      "conta": 9120,
      "name": "Rosa Maria Sandoval",
      "balance": 985
    },
    {
      "id": 111,
      "agencia": 33,
      "conta": 9121,
      "name": "Brunno Leonardo Melo de Oliveira",
      "balance": 568
    },
    {
      "id": 112,
      "agencia": 33,
      "conta": 9122,
      "name": "Raissa de Almeida Lima",
      "balance": 875
    },
    {
      "id": 113,
      "agencia": 33,
      "conta": 9123,
      "name": "Glaucio de Souza",
      "balance": 2354
    },
    {
      "id": 114,
      "agencia": 33,
      "conta": 9124,
      "name": "Julio Cezar Santos",
      "balance": 56
    },
    {
      "id": 115,
      "agencia": 33,
      "conta": 9125,
      "name": "Danilo de Souza",
      "balance": 98
    },
    {
      "id": 116,
      "agencia": 33,
      "conta": 9126,
      "name": "Diego Luiz Siqueira Teixeira",
      "balance": 89
    },
    {
      "id": 117,
      "agencia": 33,
      "conta": 9127,
      "name": "Ariana de Cesare Pereira",
      "balance": 126
    },
    {
      "id": 118,
      "agencia": 33,
      "conta": 9128,
      "name": "Eduardo Renan Ferreira",
      "balance": 658
    },
    {
      "id": 119,
      "agencia": 33,
      "conta": 9129,
      "name": "Nivaldo Soares do Santos",
      "balance": 754
    },
    {
      "id": 120,
      "agencia": 33,
      "conta": 9130,
      "name": "Moises Castillo",
      "balance": 857
    }
  ];
  Answer(this.selectHandler);

  @override
  String toString() {
    return "Question $selectHandler was choosen.";
  }

  String giveAnswer() {
    StringBuffer answer = new StringBuffer();
    answer.write("Question " + this.selectHandler.toString() + " : ");
    switch (this.selectHandler) {
      case 0:
        var balanceSum = 0;
        accountsJson.forEach((element) {
          balanceSum += element['balance'];
        });
        answer.write("Sum is: " + balanceSum.toString());
        break;
      case 1:
        var result = 0;
        accountsJson.forEach((element) {
          if (element['balance'] >= 100) {
            result += 1;
          }
        });
        answer.write("Num of Acc qt \$100 is: " + result.toString());
        break;
      case 2:
        var result = 0;
        accountsJson.forEach((element) {
          if (element['agencia'] == 33 && element['balance'] >= 100) {
            result += 1;
          }
        });
        answer.write("Num of Acc Ag 33 qt \$100 is: " + result.toString());
        break;
      case 3:
        var result = 0;
        var biggest = 0;
        accountsJson.forEach((element) {
          if (biggest < element['balance']) {
            biggest = element['balance'];
            result = element['agencia'];
          }
        });
        answer.write("Ag with more \$ :" + result.toString());
        break;
      case 4:
        var result = 0;
        var lowest = accountsJson[0]['balance'];
        accountsJson.forEach((element) {
          if (lowest > element['balance']) {
            lowest = element['balance'];
            result = element['agencia'];
          }
        });
        answer.write("Ag with less \$ :" + result.toString());
        break;
      case 5:
        // soma dos clientes com maior saldo
        var result;
        var listOfAgencies = [];
        var mapBiggestBalance = [];
        accountsJson.forEach((element) {
          listOfAgencies.add(element['agencia']);
        });
        mapBiggestBalance
            .where((element){ element['agencia'] == listOfAgencies[0]});
        // accountsJson.forEach((element) {
        //   if (mapBiggestBalance.contains(element['agencia'])) {
        //     // updata
        //     mapBiggestBalance.up
        //   } else {
        //     mapBiggestBalance
        //         .add({'ag': element['agencia'], 'balance': element['balance']});
        //   }
        // });
        // mapBiggestBalance
        //     .add({'ag': element['agencia'], 'balance': element['balance']});
        // result = listOfAgencies.toSet().toList();
        result = mapBiggestBalance.toString();
        answer.write("..." + result.toString());
        break;
      case 6:
        var balanceSum = 0;
        accountsJson.forEach((element) {
          balanceSum += element['balance'];
        });
        answer.write("Not Implemented Yet." + balanceSum.toString());
        break;
      case 7:
        var balanceSum = 0;
        accountsJson.forEach((element) {
          balanceSum += element['balance'];
        });
        answer.write("Not Implemented Yet." + balanceSum.toString());
        break;
      case 8:
        var balanceSum = 0;
        accountsJson.forEach((element) {
          balanceSum += element['balance'];
        });
        answer.write("Not Implemented Yet." + balanceSum.toString());
        break;
      case 9:
        var balanceSum = 0;
        accountsJson.forEach((element) {
          balanceSum += element['balance'];
        });
        answer.write("Not Implemented Yet." + balanceSum.toString());
        break;
      case 10:
        var balanceSum = 0;
        accountsJson.forEach((element) {
          balanceSum += element['balance'];
        });
        answer.write("Not Implemented Yet." + balanceSum.toString());
        break;
      case 11:
        var balanceSum = 0;
        accountsJson.forEach((element) {
          balanceSum += element['balance'];
        });
        answer.write("Not Implemented Yet." + balanceSum.toString());
        break;
      default:
    }

    return answer.toString();
  }

  Future<List> getAccounts() async {
    final _accountApi = "/api/accounts";
    var _host = "http://192.168.0.45:3090";
    var _uri = _host + _accountApi;
    final response = await http.get(_uri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data as List;
      return result;
    }

    throw "Could not get Api from " + _uri;
  }
}
