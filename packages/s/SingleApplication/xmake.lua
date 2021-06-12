package("SingleApplication")

    set_homepage("https://github.com/itay-grudev/SingleApplication")
    set_description("This is a replacement of the QtSingleApplication for Qt5 and Qt6.")

    set_urls("https://github.com/itay-grudev/SingleApplication/archive/$(version).zip",
             "git@github.com:itay-grudev/SingleApplication.git")
    add_versions("v3.2.0", "CFA796530C8E16B35E591BB85CEAF7DD02CB965EAC7A394DBBD857ED1CEFB9BA")

    add_deps("cmake")

    on_install(function (package)
        import("detect.sdks.find_qt")
        -- find qt sdk
        qt = assert(find_qt(nil, {verbose = true}), "Qt SDK not found!")
        local configs = {
            "-DCMAKE_PREFIX_PATH="..path.join(qt.sdkdir, "lib/cmake/Qt5"),
            "-DQAPPLICATION_CLASS=QApplication"
            }
        import("package.tools.cmake").install(package, configs)
        
        os.cp("SingleApplication", package:installdir("include"))
        os.cp("singleapplication.h", package:installdir("include"))
    end)