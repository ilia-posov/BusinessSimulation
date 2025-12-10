macro(fetch_catch _test_dir)
    set(CATCH_HEADER "${_test_dir}/catch.hpp")

    if (NOT EXISTS ${CATCH_HEADER})
        set(CATCH_URL "https://raw.githubusercontent.com/catchorg/Catch2/de6fe184a9ac1a06895cdd1c9b437f0a0bdf14ad/single_include/catch2/catch.hpp")
        file(DOWNLOAD ${CATCH_URL} ${CATCH_HEADER} SHOW_PROGRESS)
        unset(CATCH_URL)
    endif ()

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