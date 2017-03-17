TODO
====

- ~~Check sizes in -[BSONDocument _appendNumber]~~
- Clean up comments
- ~~Transfer ownership of buffer in -[BSONDocument dataValue]~~
- Writing to a stream
- Run the tests with instrumentation to check for memory leaks
- Support new BSON Type, Decimal128 (bson_decimal128_t) along with the following
    new functions and helpers:
    * bson_decimal128_to_string()
    * bson_decimal128_from_string()
    * bson_iter_decimal128()
    * bson_iter_overwrite_decimal128()
    * BSON_ITER_HOLDS_DECIMAL128()
    * bson_append_decimal128()
    * BSON_APPEND_DECIMAL128()
    * BCON_DECIMAL128()
