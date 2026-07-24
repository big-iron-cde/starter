; Translated from src/rom.s (raw byte listing) to 6502 assembly.
; ROM maps to CPU address $8000; reset and IRQ vectors point there.

        .org $8000

reset:
        CLC             ; clear carry flag
        LDA #$05        ; A = $05
        STA $4000       ; write $05 to $4000
        ADC #$0F        ; A = $05 + $0F = $14
        STA $4000       ; write $14 to $4000
        LDA #$08        ; A = $08
        STA $4010       ; write $08 to $4010
        JMP $0000       ; jump to $0000

; Interrupt vectors (ROM offset $7FFC = CPU $FFFC)
        .org $FFFC
        .word reset     ; reset vector ($FFFC-$FFFD) -> $8000
        .word reset     ; IRQ/BRK vector ($FFFE-$FFFF) -> $8000
