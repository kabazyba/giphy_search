class Response<T> {
  Status status;
  T data;
  String message;

  Response.loading(this.message) : status = Status.loading;

  Response.completed(this.data) : status = Status.completed;

  Response.error(this.message) : status = Status.error;

  Response.none() : status = Status.none;
  Response.unauthorized() : status = Status.unauthorized;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { loading, completed, error, none, unauthorized }
