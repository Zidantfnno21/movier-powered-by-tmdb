import 'dart:convert';

List<int> convertStringIdsToIntIds(String data){
  try{
    List<dynamic> parsedList = jsonDecode(data);

    List<int> intList = parsedList.map((e) => e as int).toList();

    return intList;
  }catch(e){
    print('Error converting string to List<int>: $e');
    return [];
  }
}