add_rules("mode.debug", "mode.release")

-- Disable C++ standard library modules build policy
-- set_policy("build.c++.modules", true)
set_policy("build.c++.modules.std", false)

set_policy("build.c++.modules.hide_dependencies", true)

target("cpp20_modules_app")
    set_kind("binary")
    set_languages("cxx26")

    on_config(function (target)
        local cc = target:tool("cc") or "clang"
        local ok, outdata = os.iorunv(cc, {"--version"})
        if ok and outdata and outdata:find("Apple clang", 1, true) then
            -- xcode doesn't ship clang-scan-deps sadly
            target:set("policy", "build.c++.modules.clang.fallbackscanner", true)
            print("using fallback xmake scanner")
        end
    end)

    -- on_config(function (target)
    --     local cc = target:tool("cc")
    --     if cc and cc:find("Xcode.app", 1, true) then
    --         target:set("policy", "build.c++.modules.clang.fallbackscanner", true)
    --         print("using fallback xmake scanner, second method")
    --     end
    -- end)

    -- Disable RTTI and Exceptions
    add_cxxflags("-fno-rtti", "-fno-exceptions")
    add_cxxflags("-fcxx-modules")

    add_files("module.cpp")
    add_files("*.cppm")
