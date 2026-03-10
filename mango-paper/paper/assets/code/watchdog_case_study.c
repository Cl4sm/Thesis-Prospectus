int main(int argc, char **argv, char **envp)
{
  // ...
  if ( argc >= 3 && !strncasecmp(argv[1], &dword_400D54, 2) )
  {
    sprintf(v13, "modprobe softdog soft_margin=%s", argv[2]);
    system(v13);
  }
  // ...
}
