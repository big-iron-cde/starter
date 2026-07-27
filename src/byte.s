0x0000   0x18   ; CLC — clear carry flag
0x0001   0xA9   ; LDA immediate — load 1st number
0x0002   0x05   ; Value: $05
0x0003   0x69   ; ADC immediate — add 2nd number
0x0004   0x0A   ; Value: $0A
0x0005   0x69   ; ADC immediate — add 3rd number
0x0006   0x0F   ; Value: $0F
0x0007   0x8D   ; STA absolute — store partial sum to RAM
0x0008   0x00   ; Address low byte: $00
0x0009   0x02   ; Address high byte: $02 (target: $0200)
0x000A   0xA9   ; LDA immediate — load 4th number
0x000B   0x14   ; Value: $14
0x000C   0x6D   ; ADC absolute — add partial sum from RAM
0x000D   0x00   ; Address low byte: $00
0x000E   0x02   ; Address high byte: $02 (source: $0200)
0x000F   0x8D   ; STA absolute — write final result
0x0010   0x00   ; Address low byte: $00
0x0011   0x40   ; Address high byte: $40 (target: $4000)
0x0012   0xDB   ; STP — halt processor
0x7FFC   0x00   ; Reset vector low byte
0x7FFD   0x80   ; Reset vector high byte ($8000)
0x7FFE   0x00   ; IRQ/BRK vector low byte
0x7FFF   0x80   ; IRQ/BRK vector high byte ($8000)
