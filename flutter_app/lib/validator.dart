

import 'dart:async';

mixin Validators{

  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if(data.contains('@')){
        sink.add(data);
      }else{
        sink.addError('Inavid email');
      }
    },
    /*handleError: (error, stackTrace, sink) {
    },
    handleDone: (sink) {

    },*/
  );

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if(data.length > 4)
        sink.add(data);
      else
        sink.addError('Password length should be more than 4');
    },
  );




}