class BaseResponse<T>{}
class Successful<T> extends BaseResponse<T> {
    T data;
    Successful(this.data);
}
class Failed<T> extends BaseResponse<T> {
  Failed(this.message);
  String message;
}