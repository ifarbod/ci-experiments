import module1;
import module2;

extern "C" int printf(const char* format, ...);

int main()
{
    auto result = get_module1_value() + get_module2_value();
    printf("Result from C++20 modules: %d\n", result);
    return 0;
}
