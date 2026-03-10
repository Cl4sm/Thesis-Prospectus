void foo() {
    bar("Hello!");
}

void bar(char *unused) {
    char *name_buf = nvram_get("your_name");
    say_hello(name_buf);
}

void say_hello(char *buf) {
    char[256] cmd;
    sprintf(cmd, "echo \"Hello %s\"", buf);
    system(cmd);
}