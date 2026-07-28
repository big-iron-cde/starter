; Translated from src/byte.s (raw byte listing) to 6502 assembly.
; ROM maps to CPU address $8000; reset and IRQ vectors point there.
; Writes target random RAM locations in the range $0100-$3FFF, seeded from
; uninitialized RAM at $3FFC-$3FFF.

        .org $8000

reset:
        ; Capture random seed bytes from uninitialized RAM before any writes.
        LDA $3FFF       ; random high byte for address A
        STA $02
        LDA $3FFE       ; random low byte for address A
        STA $03
        LDA $3FFD       ; random high byte for address B
        STA $04
        LDA $3FFC       ; random low byte for address B
        STA $05

        ; Build random pointer A in $00-$01, clamping high byte to $01-$3F.
        LDA $02
        AND #$3F
        BNE a_high_ok
        LDA #$01        ; minimum valid high byte ($01)
a_high_ok:
        STA $01
        LDA $03
        STA $00

        ; Compute partial sum and store at random address A.
        LDY #$00
        CLC
        LDA #$05
        ADC #$0A
        ADC #$0F
        STA ($00),Y

        ; Load 4th number and add partial sum from random address A.
        LDA #$14
        ADC ($00),Y
        TAX             ; save final result

        ; Build random pointer B in $00-$01, clamping high byte to $01-$3F.
        LDA $04
        AND #$3F
        BNE b_high_ok
        LDA #$01
b_high_ok:
        STA $01
        LDA $05
        STA $00

        ; Write final result to random address B.
        TXA
        STA ($00),Y
        STP             ; halt processor

; Interrupt vectors (ROM offset $7FFC = CPU $FFFC)
        .org $FFFC
        .word reset     ; reset vector ($FFFC-$FFFD) -> $8000
        .word reset     ; IRQ/BRK vector ($FFFE-$FFFF) -> $8000
