import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_server/http_server.dart';


main(){
  
  var vd = new VirtualDirectory('web');
  vd.jailRoot = false;
  vd.followLinks = true;
  
  HttpServer.bind('0.0.0.0', 8000).then((server) {
    server.listen((HttpRequest request) {
      
      if (request.uri.query == ""){
        vd.serveRequest(request);
      } else {
        
        http.read("https://graph.facebook.com/woven").then((fbData){
                        
                var fbObj = JSON.decode(fbData);
                var resp = { 'about': fbObj['about'], 'name': fbObj['name'], 'www': fbObj['website'] };
                HttpResponse response = request.response;
                response.write(JSON.encode(fbData));
                response.close();
              });
      }
      
    });

  });
  
}
