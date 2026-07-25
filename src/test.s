0x0000   0xA9   ; LDA immediate — load test value
0x0001   0x55   ; Value: $55
0x0002   0x8D   ; STA absolute — store to RAM
0x0003   0x00   ; Address low byte: $00
0x0004   0x02   ; Address high byte: $02 (target: $0200)
0x0005   0xA9   ; LDA immediate — clear A
0x0006   0x00   ; Value: $00
0x0007   0xAD   ; LDA absolute — read back from RAM
0x0008   0x00   ; Address low byte: $00
0x0009   0x02   ; Address high byte: $02 (source: $0200)
0x000A   0x8D   ; STA absolute — write result to $4000
0x000B   0x00   ; Address low byte: $00
0x000C   0x40   ; Address high byte: $40 (target: $4000)
0x000D   0xDB   ; STP — halt processor
0x7FFC   0x00   ; Reset vector low byte
0x7FFD   0x80   ; Reset vector high byte ($8000)
0x7FFE   0x00   ; IRQ/BRK vector low byte
0x7FFF   0x80   ; IRQ/BRK vector high byte ($8000)
