0x0000   0xAD   ; LDA absolute — read random seed high byte for address A
0x0001   0xFF   ; Address low byte: $FF
0x0002   0x3F   ; Address high byte: $3F (source: $3FFF)
0x0003   0x85   ; STA zero page — stash seed high A
0x0004   0x02   ; Zero-page address: $02
0x0005   0xAD   ; LDA absolute — read random seed low byte for address A
0x0006   0xFE   ; Address low byte: $FE
0x0007   0x3F   ; Address high byte: $3F (source: $3FFE)
0x0008   0x85   ; STA zero page — stash seed low A
0x0009   0x03   ; Zero-page address: $03
0x000A   0xAD   ; LDA absolute — read random seed high byte for address B
0x000B   0xFD   ; Address low byte: $FD
0x000C   0x3F   ; Address high byte: $3F (source: $3FFD)
0x000D   0x85   ; STA zero page — stash seed high B
0x000E   0x04   ; Zero-page address: $04
0x000F   0xAD   ; LDA absolute — read random seed low byte for address B
0x0010   0xFC   ; Address low byte: $FC
0x0011   0x3F   ; Address high byte: $3F (source: $3FFC)
0x0012   0x85   ; STA zero page — stash seed low B
0x0013   0x05   ; Zero-page address: $05
0x0014   0xA5   ; LDA zero page — load seed high A
0x0015   0x02   ; Zero-page address: $02
0x0016   0x29   ; AND immediate — clamp high byte to $00-$3F
0x0017   0x3F   ; Value: $3F
0x0018   0xD0   ; BNE relative — skip default if result is non-zero
0x0019   0x02   ; Branch offset: +2 bytes
0x001A   0xA9   ; LDA immediate — use $01 as minimum valid high byte
0x001B   0x01   ; Value: $01
0x001C   0x85   ; STA zero page — set high byte of pointer A
0x001D   0x01   ; Zero-page address: $01
0x001E   0xA5   ; LDA zero page — load seed low A
0x001F   0x03   ; Zero-page address: $03
0x0020   0x85   ; STA zero page — set low byte of pointer A
0x0021   0x00   ; Zero-page address: $00
0x0022   0xA0   ; LDY immediate — clear index register
0x0023   0x00   ; Value: $00
0x0024   0x18   ; CLC — clear carry flag
0x0025   0xA9   ; LDA immediate — load 1st number
0x0026   0x05   ; Value: $05
0x0027   0x69   ; ADC immediate — add 2nd number
0x0028   0x0A   ; Value: $0A
0x0029   0x69   ; ADC immediate — add 3rd number
0x002A   0x0F   ; Value: $0F
0x002B   0x91   ; STA indirect,Y — store partial sum to random RAM location A
0x002C   0x00   ; Zero-page pointer address: $00
0x002D   0xA9   ; LDA immediate — load 4th number
0x002E   0x14   ; Value: $14
0x002F   0x71   ; ADC indirect,Y — add partial sum from random RAM location A
0x0030   0x00   ; Zero-page pointer address: $00
0x0031   0xAA   ; TAX — save final result in X
0x0032   0xA5   ; LDA zero page — load seed high B
0x0033   0x04   ; Zero-page address: $04
0x0034   0x29   ; AND immediate — clamp high byte to $00-$3F
0x0035   0x3F   ; Value: $3F
0x0036   0xD0   ; BNE relative — skip default if result is non-zero
0x0037   0x02   ; Branch offset: +2 bytes
0x0038   0xA9   ; LDA immediate — use $01 as minimum valid high byte
0x0039   0x01   ; Value: $01
0x003A   0x85   ; STA zero page — set high byte of pointer B
0x003B   0x01   ; Zero-page address: $01
0x003C   0xA5   ; LDA zero page — load seed low B
0x003D   0x05   ; Zero-page address: $05
0x003E   0x85   ; STA zero page — set low byte of pointer B
0x003F   0x00   ; Zero-page address: $00
0x0040   0x8A   ; TXA — restore final result
0x0041   0x91   ; STA indirect,Y — write final result to random RAM location B
0x0042   0x00   ; Zero-page pointer address: $00
0x0043   0xDB   ; STP — halt processor
0x7FFC   0x00   ; Reset vector low byte
0x7FFD   0x80   ; Reset vector high byte ($8000)
0x7FFE   0x00   ; IRQ/BRK vector low byte
0x7FFF   0x80   ; IRQ/BRK vector high byte ($8000)
