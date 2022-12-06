import "package:dio/dio.dart";
class UserServices {
 late Dio dio;
 UserServices(){
BaseOptions options = BaseOptions(
 //https://pub.dev/documentation/dio/latest/dio/RequestOptions-class.html
//Demander l'URL de base
baseUrl : "https://jsonplaceholder.typicode.com/",
//Indique si la réception des données de réponse lorsque le code d'état http échoue. La valeur par défaut est true 
receiveDataWhenStatusError:true,
//Délai d'expiration en millisecondes pour l'ouverture de l'URL. Dio lèvera le DioError avec le type DioErrorType.connectTimeout à l'expiration du délai.
connectTimeout: 30*1000,
//Délai d'attente en millisecondes pour la réception des données.
receiveTimeout: 30*1000,
);
dio = Dio(options);
 }
Future<List<dynamic>> getAllUsers() async {
try {
 //https://pub.dev/documentation/dio/latest/dio/Response-class.html
 //Response décrit les informations de réponse http.
 Response response = await dio.get('users');
 print (response.data.toString());
 return response.data;
}catch (e) {
 print (e.toString());
 return [];
}
}
} 
