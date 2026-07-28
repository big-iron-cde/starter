; Translated from src/byte.s (raw byte listing) to 6502 assembly.
; ROM maps to CPU address $8000; reset and IRQ vectors point there.
; Writes target random RAM locations in pages $02 and $03, offset by a
; 1-byte PRNG state maintained at $0400.

        .org $8000

reset:
        LDA $0400       ; read previous PRNG state from RAM
        CLC             ; clear carry for clean addition
        ADC #$25        ; advance state (period 256 in 8 bits)
        STA $0400       ; write updated state back to RAM
        TAX             ; X = new pseudo-random offset ($00-$FF)

        CLC             ; clear carry flag
        LDA #$05        ; A = $05 (1st number)
        ADC #$0A        ; A = $05 + $0A = $0F (add 2nd number)
        ADC #$0F        ; A = $0F + $0F = $1E (add 3rd number)
        STA $0200,X     ; write partial sum to random $0200-$02FF
        ADC #$14        ; A = $1E + $14 = $32 (add 4th number)
        STA $0300,X     ; write final result to random $0300-$03FF
        STP             ; halt processor

; Interrupt vectors (ROM offset $7FFC = CPU $FFFC)
        .org $FFFC
        .word reset     ; reset vector ($FFFC-$FFFD) -> $8000
        .word reset     ; IRQ/BRK vector ($FFFE-$FFFF) -> $8000
