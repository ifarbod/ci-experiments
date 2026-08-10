import mods;

extern "C" int printf(const char* format, ...);

int main()
{
    auto result = mods::get_module1_value() + mods::get_module2_value();
    printf("Result from C++20 modules: %d\n", result);
    return 0;
}
