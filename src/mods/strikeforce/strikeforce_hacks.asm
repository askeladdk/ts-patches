%include "macros/patch.inc"
%include "macros/datatypes.inc"
%include "TiberianSun.inc"

sstring str_DTALong, "Tiberian Sun: Strikeforce"
sstring str_DTAGameWindow, "Tiberian Sun: Strikeforce (Game Window)"
sstring str_LanguageDLLNotFound, "Language.dll not found, please start SFLauncher.exe and click Save in the Options menu."
sstring str_DTAAlreadyRunning, "Tiberian Sun: Strikeforce is already running!"
sstring str_MPMapsINI, "MPMAPS.INI"
sstring str_MoviesMIX, "MOVIES.MIX"

; String references
@SET 0x00472567, push str_DTALong
@SET 0x0047256C, push str_LanguageDLLNotFound
@SET 0x005FF2C0, {cmp edx, str_DTALong}
@SET 0x005FF2C8, push str_DTALong
@SET 0x005FF2D9, push str_DTALong
@SET 0x005FF3AA, {cmp ecx, str_DTALong}
@SET 0x005FF3B2, push str_DTALong
@SET 0x005FF3C3, push str_DTALong
@SET 0x005FF4EC, push str_DTALong
@SET 0x006861ED, {mov dword [esp+48h], str_DTALong} ; dword ptr
@SET 0x00686215, push str_DTALong
@SET 0x0068621A, push str_DTALong
@SET 0x006862BD, push str_DTALong
@SET 0x006862C2, push str_DTALong
@SET 0x005EE8B0, push str_MPMapsINI
@SET 0x005EEB82, push str_MPMapsINI
@SET 0x0044ECC5, push str_MoviesMIX
@SET 0x004E4543, push str_MoviesMIX


; change droppod infantry to G1
@SET 0x0070FEF4, {db 0x47, 0x31}
@SET 0x0070FEF8, {db 0x47, 0x31}


; cyborgs play death animation instead of exploding
@SET 0x004D2728, {db 0xEB}


; Remove hardcoded values

; NAWALL
@SET 0x00710DA4, {db 0x90,0x90,0x90,0x90,0x90,0x90}
; GAWALL
@SET 0x00710DAC, {db 0x90,0x90,0x90,0x90,0x90,0x90}
; GAFSDF
@SET 0x00710DB4, {db 0x90,0x90,0x90,0x90,0x90,0x90}
; HMEC
@SET 0x00706A8C, {db 0x90,0x90,0x90,0x90}
; 155MM
@SET 0x00715e78, {db 0x90,0x90,0x90,0x90,0x90}
; ARTYHE
@SET 0x00714C70, {db 0x90,0x90,0x90,0x90,0x90,0x90}


; Thin lasers
@SET 0x006715F0, {db 0xC2, 0x08, 0x00}


; Stopped units revert to guard mode
@SET 0x00494AB5, {db 0xEB, 0x2C}
