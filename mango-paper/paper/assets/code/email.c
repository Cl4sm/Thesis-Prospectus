//R8500 httpd
int __fastcall sub_2DFC8(char *request, int a2) {
  form_parse(request, "email_enable", enable_email, 2048);
  form_parse(request, "email_smtp", smtp, 2048);
    ...
    if ( !strcmp(enable_email, "1") ) {
      acosNvramConfig_set("fw_email_email_smtp", smtp);
    }
}
  
...

//R8500 email
int __fastcall sub_9B40(int a1, char *a2, const char *a3, unsigned __int8 *a4)
{
  if ( *acosNvramConfig_get("fw_email_email_smtp") )
  {
    v37 = (const char *)acosNvramConfig_get("fw_email_email_smtp");
    strcpy(global_name, v37);
  }
}