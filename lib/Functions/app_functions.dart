class AppFunctions{

  //format dateTime
  static String getDataFormat1(DateTime date){

    return "${date.day}/${date.month}/${date.year}";

  }

  //parse string
  static String getParsedString(String text,{int  length = 12}){

    return text.length>length?"${text.substring(0,length)}...":text;
  }

  
}