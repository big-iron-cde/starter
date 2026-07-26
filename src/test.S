; Translated from src/byte.s (raw byte listing) to 6502 assembly.
; ROM maps to CPU address $8000; reset and IRQ vectors point there.

        .org $8000

reset:
        LDA #$0A
        CLC
        ADC #$0A       ; ADC IMMEDIATE, not absolute
        STA $4000
        STP            ; halt processor

; Interrupt vectors (ROM offset $7FFC = CPU $FFFC)
        .org $FFFC
        .word reset     ; reset vector ($FFFC-$FFFD) -> $8000
        .word reset     ; IRQ/BRK vector ($FFFE-$FFFF) -> $8000