format PE Console
entry Start
include 'win32a.inc'
section '.data' data readable writeable
  HYI_NAHYI db 'Hello Nahui ... Gde Dolg',0
  NULL = 0
section '.code' code readable executable
  Start:
    push HYI_NAHYI
    call[printf]
    
    call [getch]
    
    push NULL
    invoke  ExitProcess,0
section '.idata' import data readable
  library kernel,'KERNEL32.DLL',\
    mvscrt, 'msvcrt.dll'
  import kernel,\
    SetConsoleTitleA, 'SetConsoleTitleA',\
    GetStdHandle, 'GetStdHandle',\
    WriteConsoleA, 'WriteConsoleA',\
    ReadConsoleA, 'ReadConsoleA',\
    ExitProcess, 'ExitProcess'    
  import mvscrt,\
    printf,'printf',\
    getch, '_getch'
