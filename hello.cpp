#include <fstream>
#include <iostream>
#include <string>
#include <sys/utsname.h>

static const char* get_arch()
{
#if defined(__x86_64__)
	return "x86_64";
#elif defined(__aarch64__)
	return "aarch64";
#elif defined(__loongarch64)
	return "loongarch64";
#elif defined(__mips64) && defined(__MIPSEL__)
	return "mips64el";
#elif defined(__i386__)
	return "i386";
#else
	return "unknown";
#endif
}

static std::string get_os_name()
{
	std::ifstream file("/etc/os-release");
	std::string line;
	while (std::getline(file, line))
	{
		if (line.rfind("PRETTY_NAME=", 0) == 0)
		{
			std::string value = line.substr(std::string("PRETTY_NAME=").length());
			if (value.size() >= 2 && value.front() == '"' && value.back() == '"')
				return value.substr(1, value.size() - 2);
			return value;
		}
	}
	return "unknown";
}

auto main() -> int
{
	std::cout << "hello world" << std::endl;
	std::cout << "OS: " << get_os_name() << " (" << get_arch() << ")" << std::endl;

	struct utsname uname_pointer;
	uname(&uname_pointer);

	printf("System name - %s \n", uname_pointer.sysname);
	printf("Nodename    - %s \n", uname_pointer.nodename);
	printf("Release     - %s \n", uname_pointer.release);
	printf("Version     - %s \n", uname_pointer.version);
	printf("Machine     - %s \n", uname_pointer.machine);
	printf("Domain name - %s \n", uname_pointer.domainname);

	return 0;
}
