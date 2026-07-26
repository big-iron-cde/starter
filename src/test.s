0x0000   0xA9   ; LDA immediate — load first number
0x0001   0x05   ; Value: $05
0x0002   0x18   ; CLC — clear carry flag
0x0003   0x69   ; ADC immediate — add second number
0x0004   0x0A   ; Value: $0A
0x0005   0x8D   ; STA absolute — store result to $4000
0x0006   0x00   ; Address low byte: $00
0x0007   0x40   ; Address high byte: $40 (target: $4000)
0x0008   0x08   ; PHP — push processor status (includes carry)
0x0009   0x68   ; PLA — pull processor status into A
0x000A   0x29   ; AND immediate — isolate bit 0 (carry)
0x000B   0x01   ; Value: $01
0x000C   0x8D   ; STA absolute — store carry flag to $4001
0x000D   0x01   ; Address low byte: $01
0x000E   0x40   ; Address high byte: $40 (target: $4001)
0x000F   0xDB   ; STP — halt processor
0x7FFC   0x00   ; Reset vector low byte
0x7FFD   0x80   ; Reset vector high byte ($8000)
0x7FFE   0x00   ; IRQ/BRK vector low byte
0x7FFF   0x80   ; IRQ/BRK vector high byte ($8000)
