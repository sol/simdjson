#include "simdjson.h"
extern "C" {
  bool _hs_simdjson_validate_utf8(const char * payload, size_t offset, size_t length) noexcept {
    return simdjson::validate_utf8(payload + offset, length);
  }
}
