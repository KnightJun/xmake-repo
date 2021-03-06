package("OwlKeyLog")

    set_description("keyboard and mouse hook")

    add_urls("git@github.com:knightjun/OwlKeyLog.git")

    on_install(function (package)
        if package:config("shared") then
            package:add("PATH", "bin")
        end
        import("package.tools.xmake").install(package)
    end)
