; Translated from src/byte.s (raw byte listing) to 6502 assembly.
; ROM maps to CPU address $8000; reset and IRQ vectors point there.

        .org $8000

reset:
        CLC             ; clear carry flag
        LDA #$05        ; A = $05 (1st number)
        ADC #$0A        ; A = $05 + $0A = $0F (add 2nd number)
        ADC #$0F        ; A = $0F + $0F = $1E (add 3rd number)
        TAX             ; X = $1E (partial sum becomes index)
        STA $0200,X     ; RAM $021E = $1E (stash partial sum at calculated location)
        LDA #$14        ; A = $14 (load 4th number)
        ADC $0200,X     ; A = $14 + $1E = $32 (add partial sum from calculated RAM location)
        TAY             ; Y = $32 (final result becomes index)
        STA $4000,Y     ; write $32 to calculated location $4032 (final result)
        STP             ; halt processor

; Interrupt vectors (ROM offset $7FFC = CPU $FFFC)
        .org $FFFC
        .word reset     ; reset vector ($FFFC-$FFFD) -> $8000
        .word reset     ; IRQ/BRK vector ($FFFE-$FFFF) -> $8000
