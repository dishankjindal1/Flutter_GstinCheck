class ApiResponse<T> {
  String? message;
  T? data;
  Status? status;

  ApiResponse.initial(this.message) : status = Status.INITIAL;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status\nData : $data\nMessage : $message";
  }
}

enum Status{INITIAL,LOADING,COMPLETED,ERROR}