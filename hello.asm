;
;  Produces a 1,536 bytes executable on Windows 10
;  That is too god damn large
;

extern ExitProcess, GetStdHandle, WriteConsoleA

section .n
    msg db "Hello, World!",10

; <entry point>
Start:
    ; GetStdHandle(in A1)
    push -11           ; A1 - STD_OUTPUT_HANDLE
    call GetStdHandle  ; Puts in eax

    ; WriteConsole(in A1, in A2, in A3, out A4, reserved A5 )
    push 0             ; A5 - Don't care (reserved argument)
                       ; A4 - Don't care ("number of chars written")
    push 14            ; A3 - Length ("number of chars to write")
    push msg           ; A2 - String (buffer pointer)
    push eax           ; A1 - Console output handle (from GetStdHandle)
    call WriteConsoleA

    ; ExitProcess(in A1)
    push 0             ; A1 - Exit code
    call ExitProcess