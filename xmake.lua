add_rules("mode.debug", "mode.release")

-- Disable C++ standard library modules build policy
-- set_policy("build.c++.modules", true)
set_policy("build.c++.modules.std", false)

set_policy("build.c++.modules.hide_dependencies", true)

target("cpp20_modules_app")
    set_kind("binary")
    set_languages("cxx26")

    add_cxxflags("-fno-rtti", "-fno-exceptions")
    add_cxxflags("-fcxx-modules") -- needed for xcode clang only

    add_files("*.cpp")
    add_files("*.cppm")
