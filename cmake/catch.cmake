include(FetchContent)

macro(fetch_catch)
    FetchContent_Declare(
            Catch2
            URL https://github.com/catchorg/Catch2/archive/refs/tags/v3.11.0.tar.gz
            URL_HASH SHA256=82fa1cb59dc28bab220935923f7469b997b259eb192fb9355db62da03c2a3137
    )
    FetchContent_MakeAvailable(Catch2)
endmacro()