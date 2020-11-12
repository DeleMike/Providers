///Logs out info to the console
class Log {
  final String tagName;
  final String message;

  Log({this.tagName, this.message}){
    print('TAG: $tagName, Message: $message');
  }  
}