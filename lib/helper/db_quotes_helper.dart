
import 'dart:convert';

import 'package:db_miner_quotes_app/models/quotes_models.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

import '../models/quotes_api_models.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  Database? db;

  Future<void> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, "demo.db");

    db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db,int version) async {

          String query1 = "CREATE TABLE IF NOT EXISTS quotes1(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,name TEXT);";
          String query2 = "CREATE TABLE IF NOT EXISTS quotes2(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,name TEXT);";
          String query3 = "CREATE TABLE IF NOT EXISTS quotes3(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,name TEXT);";
          String query4 = "CREATE TABLE IF NOT EXISTS quotes4(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,name TEXT);";
          String query5 = "CREATE TABLE IF NOT EXISTS quotes5(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,name TEXT);";
          String query6 = "CREATE TABLE IF NOT EXISTS quotes6(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,name TEXT);";
          String query7 = "CREATE TABLE IF NOT EXISTS quotes7(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,name TEXT);";
          String query8 = "CREATE TABLE IF NOT EXISTS quotes8(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,name TEXT);";

          await db.execute(query1);
          await db.execute(query2);
          await db.execute(query3);
          await db.execute(query4);
          await db.execute(query5);
          await db.execute(query6);
          await db.execute(query7);
          await db.execute(query8);

          print("Table Create Successfully");
        }
    );
  }



  Future<int?> insert1({required String quote,required String name}) async {
    await initDB();

    String query = "INSERT INTO quotes1(quote, name) VALUES(?, ?);";
    List args = [quote, name];

    int res = await db!.rawInsert(query, args);

    print("Table inserted Successfully $res");

    return res;
  }

  Future<int?> insert2({required String quote,required String name}) async {
    await initDB();

    String query = "INSERT INTO quotes2(quote, name) VALUES(?, ?);";
    List args = [quote, name];

    int res = await db!.rawInsert(query, args);

    print("Table inserted Successfully $res");

    return res;
  }


  Future<int?> insert3({required String quote,required String name}) async {
    await initDB();

    String query = "INSERT INTO quotes3(quote, name) VALUES(?, ?);";
    List args = [quote,name];

    int res = await db!.rawInsert(query, args);

    print("Table inserted Successfully $res");

    return res;
  }


  Future<int?> insert4({required String quote,required String name}) async {
    await initDB();

    String query = "INSERT INTO quotes4(quote, name) VALUES(?, ?);";
    List args = [quote,name];

    int res = await db!.rawInsert(query, args);

    print("Table inserted Successfully $res");

    return res;
  }


  Future<int?> insert5({required String quote,required String name}) async {
    await initDB();

    String query = "INSERT INTO quotes5(quote, name) VALUES(?, ?);";
    List args = [quote,name];

    int res = await db!.rawInsert(query, args);

    print("Table inserted Successfully $res");

    return res;
  }


  Future<int?> insert6({required String quote,required String name}) async {
    await initDB();

    String query = "INSERT INTO quotes6(quote, name) VALUES(?, ?);";
    List args = [quote,name];

    int res = await db!.rawInsert(query, args);

    print("Table inserted Successfully $res");

    return res;
  }


  Future<int?> insert7({required String quote,required String name}) async {
    await initDB();

    String query = "INSERT INTO quotes7(quote, name) VALUES(?, ?);";
    List args = [quote,name];

    int res = await db!.rawInsert(query, args);

    print("Table inserted Successfully $res");

    return res;
  }


  Future<int?> insert8({required String quote,required String name}) async {
    await initDB();

    String query = "INSERT INTO quotes8(quote, name) VALUES(?, ?);";
    List args = [quote,name];

    int res = await db!.rawInsert(query, args);

    print("Table inserted Successfully $res");

    return res;
  }


  // fetch data

  Future<List<QUOTES>> fetchAllQuotes1() async {

    await initDB();

    String query = "SELECT * FROM quotes1;";

    List<Map<String , dynamic>> allRecords = await db!.rawQuery(query);

    List<QUOTES> allQuotes = allRecords.map((e) => QUOTES.fromMap(e)).toList();

    // print("Table fetched Successfully $allQuotes");

    return allQuotes;
  }


  Future<List<QUOTES>> fetchAllQuotes2() async {

    await initDB();

    String query = "SELECT * FROM quotes2;";

    List<Map<String , dynamic>> allRecords = await db!.rawQuery(query);

    List<QUOTES> allQuotes = allRecords.map((e) => QUOTES.fromMap(e)).toList();

    // print("Table fetched Successfully $allQuotes");

    return allQuotes;
  }




  Future<List<QUOTES>> fetchAllQuotes3() async {

    await initDB();

    String query = "SELECT * FROM quotes3;";

    List<Map<String , dynamic>> allRecords = await db!.rawQuery(query);

    List<QUOTES> allQuotes = allRecords.map((e) => QUOTES.fromMap(e)).toList();

    print("Table fetched Successfully $allQuotes");

    return allQuotes;
  }


  Future<List<QUOTES>> fetchAllQuotes4() async {

    await initDB();

    String query = "SELECT * FROM quotes4;";

    List<Map<String , dynamic>> allRecords = await db!.rawQuery(query);

    List<QUOTES> allQuotes = allRecords.map((e) => QUOTES.fromMap(e)).toList();

    print("Table fetched Successfully $allQuotes");

    return allQuotes;
  }


  Future<List<QUOTES>> fetchAllQuotes5() async {

    await initDB();

    String query = "SELECT * FROM quotes5;";

    List<Map<String , dynamic>> allRecords = await db!.rawQuery(query);

    List<QUOTES> allQuotes = allRecords.map((e) => QUOTES.fromMap(e)).toList();

    print("Table fetched Successfully $allQuotes");

    return allQuotes;
  }


  Future<List<QUOTES>> fetchAllQuotes6() async {

    await initDB();

    String query = "SELECT * FROM quotes6;";

    List<Map<String , dynamic>> allRecords = await db!.rawQuery(query);

    List<QUOTES> allQuotes = allRecords.map((e) => QUOTES.fromMap(e)).toList();

    print("Table fetched Successfully $allQuotes");

    return allQuotes;
  }


  Future<List<QUOTES>> fetchAllQuotes7() async {

    await initDB();

    String query = "SELECT * FROM quotes7;";

    List<Map<String , dynamic>> allRecords = await db!.rawQuery(query);

    List<QUOTES> allQuotes = allRecords.map((e) => QUOTES.fromMap(e)).toList();

    print("Table fetched Successfully $allQuotes");

    return allQuotes;
  }


  Future<List<QUOTES>> fetchAllQuotes8() async {

    await initDB();

    String query = "SELECT * FROM quotes8;";

    List<Map<String , dynamic>> allRecords = await db!.rawQuery(query);

    List<QUOTES> allQuotes = allRecords.map((e) => QUOTES.fromMap(e)).toList();

    print("Table fetched Successfully $allQuotes");

    return allQuotes;
  }

  //
  // // api
  //
  // Future<QuotesData?> feachData1() async {
  //
  //   String api = "https://dummyjson.com/quotes";
  //
  //   http.Response res = await http.get(Uri.parse(api));
  //
  //   if(res.statusCode == 200){
  //     Map decodedData = json.decode(res.body);
  //
  //     QuotesData allquotes = QuotesData.fromRandom(data1: decodedData);
  //
  //     return allquotes;
  //   }
  // }
  //
  //
  // Future<QuotesData?> feachData2() async {
  //
  //   String api = "https://dummyjson.com/quotes";
  //
  //   http.Response res = await http.get(Uri.parse(api));
  //
  //   if(res.statusCode == 200){
  //     Map decodedData = json.decode(res.body);
  //
  //     QuotesData allquotes = QuotesData.fromRandom(data1: decodedData);
  //
  //     return allquotes;
  //   }
  // }
  //
  //
  // Future<QuotesData?> feachData3() async {
  //
  //   String api = "https://dummyjson.com/quotes";
  //
  //   http.Response res = await http.get(Uri.parse(api));
  //
  //   if(res.statusCode == 200){
  //     Map decodedData = json.decode(res.body);
  //
  //     QuotesData allquotes = QuotesData.fromRandom(data1: decodedData);
  //
  //     return allquotes;
  //   }
  // }
  //
  //
  // Future<QuotesData?> feachData4() async {
  //
  //   String api = "https://dummyjson.com/quotes";
  //
  //   http.Response res = await http.get(Uri.parse(api));
  //
  //   if(res.statusCode == 200){
  //     Map decodedData = json.decode(res.body);
  //
  //     QuotesData allquotes = QuotesData.fromRandom(data1: decodedData);
  //
  //     return allquotes;
  //   }
  // }
  //
  //
  // Future<QuotesData?> feachData5() async {
  //
  //   String api = "https://dummyjson.com/quotes";
  //
  //   http.Response res = await http.get(Uri.parse(api));
  //
  //   if(res.statusCode == 200){
  //     Map decodedData = json.decode(res.body);
  //
  //     QuotesData allquotes = QuotesData.fromRandom(data1: decodedData);
  //
  //     return allquotes;
  //   }
  // }
  //
  //
  // Future<QuotesData?> feachData6() async {
  //
  //   String api = "https://dummyjson.com/quotes";
  //
  //   http.Response res = await http.get(Uri.parse(api));
  //
  //   if(res.statusCode == 200){
  //     Map decodedData = json.decode(res.body);
  //
  //     QuotesData allquotes = QuotesData.fromRandom(data1: decodedData);
  //
  //     return allquotes;
  //   }
  // }
  //
  //
  // Future<QuotesData?> feachData7() async {
  //
  //   String api = "https://dummyjson.com/quotes";
  //
  //   http.Response res = await http.get(Uri.parse(api));
  //
  //   if(res.statusCode == 200){
  //     Map decodedData = json.decode(res.body);
  //
  //     QuotesData allquotes = QuotesData.fromRandom(data1: decodedData);
  //
  //     return allquotes;
  //   }
  // }
  //
  //
  // Future<QuotesData?> feachData8() async {
  //
  //   String api = "https://dummyjson.com/quotes";
  //
  //   http.Response res = await http.get(Uri.parse(api));
  //
  //   if(res.statusCode == 200){
  //     Map decodedData = json.decode(res.body);
  //
  //     QuotesData allquotes = QuotesData.fromRandom(data1: decodedData);
  //
  //     return allquotes;
  //   }
  // }




  // api calling


  JsonData1() async {
    String jsonData = await rootBundle.loadString("assets/json/data1.json");

    List res = jsonDecode(jsonData);

    List allQuotes = res.map((e) => QuotesData.fromPatience(data1: e)).toList();

    allQuotes.map((e) =>
        DBHelper.dbHelper.insert1(quote: e.data,name: e.name))
        .toList();
  }


  JsonData2() async {
    String jsonData = await rootBundle.loadString("assets/json/data2.json");

    List res = jsonDecode(jsonData);

    List allQuotes = res.map((e) => QuotesData.fromPatience(data1: e)).toList();

    allQuotes.map((e) =>
        DBHelper.dbHelper.insert2(quote: e.data,name: e.name))
        .toList();
  }


  JsonData3() async {
    String jsonData = await rootBundle.loadString("assets/json/data3.json");

    List res = jsonDecode(jsonData);

    List allQuotes = res.map((e) => QuotesData.fromPatience(data1: e)).toList();

    allQuotes.map((e) =>
        DBHelper.dbHelper.insert3(quote: e.data,name: e.name))
        .toList();
  }

  JsonData4() async {
    String jsonData = await rootBundle.loadString("assets/json/data4.json");

    List res = jsonDecode(jsonData);

    List allQuotes = res.map((e) => QuotesData.fromPatience(data1: e)).toList();

    allQuotes.map((e) =>
        DBHelper.dbHelper.insert4(quote: e.data,name: e.name))
        .toList();
  }







//
// //Api calling
// fetxhQuotesApi() async {
//   await initDB();
//
//   final String url = 'https://dummyjson.com/quotes';
//
//   http.Response res = await http.get(
//     Uri.parse(url),
//   );
//
//   if (res.statusCode == 200) {
//     Map decodedData = json.decode(res.body);
//
//     QuotesData quotesdata = QuotesData.fromRandom(data1: decodedData);
//
//     List quotes = quotesdata.data.map((e) => DBHelper.dbHelper
//             .insert1( e['quote'],))
//         .toList();
//   }
// }

}
