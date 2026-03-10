// R6400 /usr/sbin/httpd
int __fastcall sub_6F800(char *a1, int a2)
{
  sub_18764(a1, "iserver_passcode", v11, 2048);
  strcpy(v10, v11);
  v4 = acosNvramConfig_set("iserver_remote_passcode", v10);
  acosNvramConfig_save(v4);
  system("killall -SIGUSR1 dlnad");
}

...

// R6400 /usr/sbin/dlnad
int main(int argc, const char **argv, const char **envp)
{
  v10 = acosNvramConfig_get("iserver_remote_passcode");
  sprintf(v11, "echo \"NoDeviceName\r\n%s\" > /tmp/shares/forked_daapd.remote", v10);
  system(v11);
}
