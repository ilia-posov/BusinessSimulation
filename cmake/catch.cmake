macro(fetch_catch _test_dir)

    # Create a catch_main.cpp file if it doesn't exist
    set(CATCH_MAIN_CPP "${_test_dir}/catch_main.cpp")
    if (NOT EXISTS ${CATCH_MAIN_CPP})
        file(WRITE ${CATCH_MAIN_CPP} "#define CATCH_CONFIG_MAIN\n#include <catch.hpp>\n")
    endif()

    # Create library with Catch2 main (only once per project)
    if (NOT TARGET catch_main)
        add_library(catch_main STATIC ${CATCH_MAIN_CPP})
        target_include_directories(catch_main PUBLIC "${_test_dir}")
    endif()

    include_directories("${_test_dir}")
endmacro()