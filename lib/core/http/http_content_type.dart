enum HttpContentType {
  json,
  form,
  multipart_from,
}

const CONTENT_TYPE_JSON = 'application/json';
const CONTENT_TYPE_FORM = 'application/x-www-form-urlencoded';
const CONTENT_TYPE_MULTIPART_FORM = 'multipart/form-data';

const List<String> HttpContentTypes = [
  CONTENT_TYPE_JSON,
  CONTENT_TYPE_FORM,
  CONTENT_TYPE_MULTIPART_FORM
];
