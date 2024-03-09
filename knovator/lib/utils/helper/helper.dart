
import 'package:intl/intl.dart';
  
   String formatDate({required date, String? formateCode}) {
   
    return DateFormat(formateCode ?? "dd-MM-yyy")
        .format(DateTime.parse(date.toString()));
  }