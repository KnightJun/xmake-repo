package("RobinLog")
    add_urls("git@github.com:knightjun/RobinLog.git")

    add_deps("spdlog")
    on_install(function (package)
        if package:config("shared") then
            package:add("PATH", "bin")
        end
        import("package.tools.xmake").install(package)
    end)
