; main.s - Main entry point for 6502 program

.include "system.inc"

.segment "CODE"

reset:
    sei             ; Disable interrupts
    cld             ; Clear decimal mode
    ldx #$FF
    txs             ; Initialize stack pointer

    ; Initialize system
    jsr init_system

    ; Main loop
main_loop:
    jsr update
    jsr draw
    jmp main_loop

update:
    ; TODO: Add update logic here
    rts

draw:
    ; TODO: Add draw logic here
    rts

nmi_handler:
    ; TODO: Handle NMI (VBlank)
    rti

irq_handler:
    ; TODO: Handle IRQ
    rti

.segment "VECTORS"
    .word nmi_handler   ; NMI vector
    .word reset         ; Reset vector
    .word irq_handler   ; IRQ/BRK vector

