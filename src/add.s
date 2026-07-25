0x0000   0xA9   ; LDA immediate — load first number
0x0001   0x08   ; Value: $08
0x0002   0x18   ; CLC — clear carry flag
0x0003   0x69   ; ADC immediate — add second number
0x0004   0x0A   ; Value: $0A
0x0005   0x8D   ; STA absolute — store result
0x0006   0x00   ; Address low byte: $00
0x0007   0x40   ; Address high byte: $40 (target: $4000)
0x0008   0xDB   ; STP — halt processor
0x7FFC   0x00   ; Reset vector low byte
0x7FFD   0x80   ; Reset vector high byte ($8000)
0x7FFE   0x00   ; IRQ/BRK vector low byte
0x7FFF   0x80   ; IRQ/BRK vector high byte ($8000)