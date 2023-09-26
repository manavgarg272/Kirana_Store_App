


abstract class UseCase<Type,Params>{
   Future<Type> call(Params params) ;
}


abstract class UseCaseForNoFuture<Type,Params>{
   Type call(Params params) ;
}

abstract class UseCaseForNoParams<Type>{
  Future<Type> call();
}


