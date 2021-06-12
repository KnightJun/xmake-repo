package("fervor")
    add_urls("https://github.com/knightjun/fervor.git")
    add_deps("zlib")
    on_install(function (package)
        if package:config("shared") then
            package:add("PATH", "bin")
        end
        import("package.tools.xmake").install(package)
    end)
