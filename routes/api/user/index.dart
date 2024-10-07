import 'package:dart_frog/dart_frog.dart';

import '../../../domain/user.dart';

Response onRequest(RequestContext context) {
  const user = User(uid: 1, name: 'Николай', lastname: 'Орлов');


  return switch (context.request.method) {
    HttpMethod.get => Response.json(body: user.toJson()),
    _ => Response.json(statusCode: 501, body: 'Not implemented')
  };
}
