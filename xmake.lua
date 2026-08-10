add_rules("mode.debug", "mode.release")

-- Disable C++ standard library modules build policy
set_policy("build.c++.modules", true)
set_policy("build.c++.modules.std", false)

set_policy("build.c++.modules.hide_dependencies", true)

target("cpp20_modules_app")
    set_kind("binary")
    set_languages("cxx20")

    -- Disable RTTI and Exceptions
    add_cxxflags("-fno-rtti", "-fno-exceptions")

    add_files("module.cpp", {cxxflags = {"-fcxx-modules", "-fmodules"}})
    add_files("*.cppm", {cxxflags = {"-fcxx-modules", "-fmodules"}})
