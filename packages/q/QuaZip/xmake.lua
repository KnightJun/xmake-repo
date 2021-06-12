package("QuaZip")

    set_homepage("https://github.com/stachenov/quazip")
    set_description("QuaZip is the C++ wrapper for Gilles Vollant's ZIP/UNZIP package (AKA Minizip) using Trolltech's Qt library.")

    set_urls("https://github.com/stachenov/quazip/archive/$(version).zip",
             "git@github.com:stachenov/quazip.git")
    add_versions("v1.1", "a1ebf43a74d73480db636cf6115196cd781fe94dc55274e1c7777f547b1662c5")
    
    add_deps("zlib")
    add_deps("cmake")

    on_install(function (package)
        import("detect.sdks.find_qt")
        -- find qt sdk
        qt = assert(find_qt(nil, {verbose = true}), "Qt SDK not found!")
        local configs = {
            "-DCMAKE_PREFIX_PATH="..path.join(qt.sdkdir, "lib/cmake/Qt5")
            }
        import("package.tools.cmake").install(package, configs)
    end)