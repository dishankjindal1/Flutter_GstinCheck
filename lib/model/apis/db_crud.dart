class DBcrud<T> {
  String? query;
  T? data;
  Fn fn;

  DBcrud.create(this.query, this.data) : fn = Fn.createFn;

  DBcrud.fetch(this.query) : fn = Fn.fetchFn;

  DBcrud.insert(this.data) : fn = Fn.insertFn;

  DBcrud.delete(this.query) : fn = Fn.deleteFn;

  @override
  String toString() {
    return "Status : $fn\nData : $data\nQuery: $query";
  }
}

enum Fn { createFn, fetchFn, insertFn, deleteFn }
