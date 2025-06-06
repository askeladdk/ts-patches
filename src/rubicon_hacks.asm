%include "macros/patch.inc"
%include "macros/datatypes.inc"
%include "TiberianSun.inc"

; Change bullet trailer separation
@SET 0x004447C5, {db 0x02}

; Increase max. bounces of elastic projectiles [commented out, causes issues on high bridges]
;@SET 0x00445516, {db 0x04}

; Change the distribution of cluster weapons [only inner radius changed for now]
;@SET 0x004465D6, {db 0x02} ; outer spread radius in leptons
@SET 0x004465DB, {db 0x00} ; inner spread radius in leptons
;@SET 0x004465EA, {db 0x01} ; [bool] should clusters hit the center of the cell?

; Increase Ion Storm warning speech frequency
@SET 0x004ED5AA, {db 0x4E, 0x01}

; Decrease subterranean horizontal movement speed
@SET 0x006D8A9E, {db 0x29}

; "Overlay tiberium fix thing, 4th etc"
@SET 0x00644DF9, {mov dword [esi+0ACh], 0Ch}

;; Rules.ini key, WalkFrames= default value
@SET 0x0065B9E6, {mov byte [esi+4D0h], 1} ;byte ptr
@SET 0x0065BF3D, {mov [esi+21h], eax}

; Building selection box color change when affected by limpet from palette index yellow (5) to
; orange (6). Used with unit selection box (select.shp) color change for limpet affected frame.
@SET 0x0062B2E4, {mov dword [esp+1Ch], 0x06}
@SET 0x0062C0C1, {mov edi, 0x06}


;
; The following patches will not be included in Vinifera compatible builds.
;
%ifndef VINIFERA

sstring src_RubiconLong, "Tiberian Sun: Rubicon"
sstring str_LanguageDLLNotFound, "Language.dll not found, please start Rubicon.exe and click Save in the Options menu."

; String references
@SET 0x00472567, push src_RubiconLong
@SET 0x0047256C, push str_LanguageDLLNotFound
@SET 0x005FF2C0, {cmp edx, src_RubiconLong}
@SET 0x005FF2C8, push src_RubiconLong
@SET 0x005FF2D9, push src_RubiconLong
@SET 0x005FF3AA, {cmp ecx, src_RubiconLong}
@SET 0x005FF3B2, push src_RubiconLong
@SET 0x005FF3C3, push src_RubiconLong
@SET 0x005FF4EC, push src_RubiconLong
@SET 0x006861ED, {mov dword [esp+48h], src_RubiconLong}
@SET 0x00686215, push src_RubiconLong
@SET 0x0068621A, push src_RubiconLong
@SET 0x006862BD, push src_RubiconLong
@SET 0x006862C2, push src_RubiconLong

; Remove framework mode mmt/mms loading
@LJMP 0x004F5182, 0x004F528C    ; jmp loc_4F528C

;; IsScoreShuffle on by default
@SET 0x005899F1, {mov byte [eax+35h], 1} ;byte ptr
@SET 0x005899F5, nop
@SET 0x005899F6, nop
@SET 0x005899F7, nop

; Set global variable byte containing side ID to load files for
@SET 0x004E2CFA, {mov byte [0x7E2500], al}
@SET 0x004E2CFF, nop
@SET 0x004E2D00, {add esp, 4}
@SJMP 0x004E2D03, 0x004E2D13 ; jmp short
@SET 0x004E2D05, nop

; Load sidebar MIX files for new sides properly (for saved games)
@SET 0x005D6C4F, {mov cl, [eax+1D91h]}
@CLEAR 0x005D6C55, 0x90, 0x005D6C58

; Load sidebar MIX files for new sides properly
@SET 0x005DD798, {mov cl, byte [0x007E2500]}
@CLEAR 0x005DD79E, 0x90, 0x005DD7A2

; Erase NAWALL and GAWALL hardcoding
@SET 0x00710DA4, {db 0,0,0,0,0,0}
@SET 0x00710DAC, {db 0,0,0,0,0,0}

; Erase GAFSDF, HMEC, 155mm and ARTYHE hardcoding
@SET 0x00710DB4, {db 0,0,0,0,0,0}
@SET 0x00706A8C, {db 0,0,0,0}
@SET 0x00715E78, {db 0,0,0,0,0}
@SET 0x00714C70, {db 0,0,0,0,0,0}

; Load speech MIX files for new sides properly (for saved games)
@SET 0x005D6DCE, {xor ecx, ecx}
@SET 0x005D6DD0, {mov cl, [eax+1D91h]}
@CLEAR 0x005D6DD6, 0x90, 0x005D6DDB

; Load speech MIX files for new sides properly
; Defaults SpeechSide to our hijacked player side value
hack 0x005DD6FB
    mov  eax, [Scen]
    xor  ecx, ecx
    mov  cl, byte [0x007E2500] ; PlayerSide (was Session.IsGDI)
    mov  [eax+0x1E44], ecx ; set SpeechSide
    jmp  0x005DD784        ; go back to game code for initializing side

%endif
