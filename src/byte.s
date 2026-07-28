0x0000   0xAD   ; LDA absolute — read random offset from uninitialized RAM
0x0001   0xFF   ; Address low byte: $FF
0x0002   0x3F   ; Address high byte: $3F (source: $3FFF)
0x0003   0xAA   ; TAX — transfer random offset to index register X
0x0004   0x18   ; CLC — clear carry flag
0x0005   0xA9   ; LDA immediate — load 1st number
0x0006   0x05   ; Value: $05
0x0007   0x69   ; ADC immediate — add 2nd number
0x0008   0x0A   ; Value: $0A
0x0009   0x69   ; ADC immediate — add 3rd number
0x000A   0x0F   ; Value: $0F
0x000B   0x9D   ; STA absolute,X — store partial sum to random location in page $02
0x000C   0x00   ; Base address low byte: $00
0x000D   0x02   ; Base address high byte: $02 (target: $0200 + X)
0x000E   0x69   ; ADC immediate — add 4th number (A still holds partial sum)
0x000F   0x14   ; Value: $14
0x0010   0x9D   ; STA absolute,X — store final result to random location in page $03
0x0011   0x00   ; Base address low byte: $00
0x0012   0x03   ; Base address high byte: $03 (target: $0300 + X)
0x0013   0xDB   ; STP — halt processor
0x7FFC   0x00   ; Reset vector low byte
0x7FFD   0x80   ; Reset vector high byte ($8000)
0x7FFE   0x00   ; IRQ/BRK vector low byte
0x7FFF   0x80   ; IRQ/BRK vector high byte ($8000)
