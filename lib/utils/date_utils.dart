import 'package:intl/intl.dart';

class GoDateUtils {
   String fromTimestampToDate(int millis) {
    var dt = DateTime.fromMillisecondsSinceEpoch(millis);

// 12 Hour format:
    var d12 = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    return d12;
  }
}
