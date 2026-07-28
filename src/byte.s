0x0000   0xAD   ; LDA absolute — read PRNG state from RAM
0x0001   0x00   ; Address low byte: $00
0x0002   0x04   ; Address high byte: $04 (source: $0400)
0x0003   0x18   ; CLC — clear carry for clean addition
0x0004   0x69   ; ADC immediate — advance PRNG state
0x0005   0x25   ; Value: $25 (period 256 with 8-bit addition)
0x0006   0x8D   ; STA absolute — write updated PRNG state back to RAM
0x0007   0x00   ; Address low byte: $00
0x0008   0x04   ; Address high byte: $04 (target: $0400)
0x0009   0xAA   ; TAX — transfer updated state to index register X
0x000A   0x18   ; CLC — clear carry flag
0x000B   0xA9   ; LDA immediate — load 1st number
0x000C   0x05   ; Value: $05
0x000D   0x69   ; ADC immediate — add 2nd number
0x000E   0x0A   ; Value: $0A
0x000F   0x69   ; ADC immediate — add 3rd number
0x0010   0x0F   ; Value: $0F
0x0011   0x9D   ; STA absolute,X — store partial sum to random location in page $02
0x0012   0x00   ; Base address low byte: $00
0x0013   0x02   ; Base address high byte: $02 (target: $0200 + X)
0x0014   0x69   ; ADC immediate — add 4th number (A still holds partial sum)
0x0015   0x14   ; Value: $14
0x0016   0x9D   ; STA absolute,X — store final result to random location in page $03
0x0017   0x00   ; Base address low byte: $00
0x0018   0x03   ; Base address high byte: $03 (target: $0300 + X)
0x0019   0xDB   ; STP — halt processor
0x7FFC   0x00   ; Reset vector low byte
0x7FFD   0x80   ; Reset vector high byte ($8000)
0x7FFE   0x00   ; IRQ/BRK vector low byte
0x7FFF   0x80   ; IRQ/BRK vector high byte ($8000)
