#include "ght/core/version.hpp"

#include <fmt/core.h>

int main(int /*argc*/, char * /*argv*/ []) {
  fmt::print("ght version: {}\n", ght::core::version());

  return 0;

}
