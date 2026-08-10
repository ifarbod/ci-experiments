add_rules("mode.debug", "mode.release")

-- Disable C++ standard library modules build policy
set_policy("build.c++.modules", true)
set_policy("build.c++.modules.std", false)

target("cpp20_modules_app")
    set_kind("binary")
    set_languages("cxx26")

    -- Disable RTTI and Exceptions
    add_cxxflags("-fno-rtti", "-fno-exceptions")

    -- Source files
    add_files("*.cppm", "module.cpp")
