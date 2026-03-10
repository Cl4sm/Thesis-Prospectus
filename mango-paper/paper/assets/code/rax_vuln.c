char* sub_10FF8(char *http_req, int req_len, int a3, char *a4)
{
  char *result;
  char ua[256];
  char cmd[508];

  memset(ua, 0, sizeof(ua));
  memset(cmd, 0, sizeof(cmd));
  if (req_len > 9)
  {
    http_req[req_len] = 0;
    result = strstr(http_req, "User-Agent: ");
    if (result)
    {
      sscanf(&result[12], "%255[^\r\n]", ua);
      sprintf(cmd, "pudil -i %s \"%s\"", a4, ua);
      system(cmd);
    }
  }
}
