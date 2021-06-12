package("libwebp")

    set_homepage("https://developers.google.com/speed/webp")
    set_description("A new image format for the Web")

    set_urls("git@github.com:webmproject/libwebp.git")

    add_deps("cmake")

    on_install(function (package)
        import("package.tools.cmake").install(package)
    end)
    