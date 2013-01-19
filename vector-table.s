	.text
	.thumb
	.global vector_table	
	.section .vector_table
	
vector_table:
        .word     0x20000800            @ initial stack pointer
        .word     initForth+1           @ reset handler
        .word     NMI_Handler+1         @ NMI handler
        .word     HardFault_Handler+1
        .word     MemManage_Handler+1
        .word     BusFault_Handler
        .word     UsageFault_Handler
        .word     0
        .word     0
        .word     0
        .word     0
        .word     SVC_Handler
        .word     DebugMon_Handler
        .word     0
        .word     PendSV_Handler
        .word     SysTick_Handler

@	.skip 300
	
@ Default interrupt handlers.

	.thumb
	.align 3
	.section .forth
	
NMI_Handler:		nop
	                nop
HardFault_Handler:	nop
MemManage_Handler:	nop
BusFault_Handler:	nop
UsageFault_Handler:	nop
SVC_Handler:		nop
DebugMon_Handler:	nop
PendSV_Handler:		nop
SysTick_Handler:	nop
			b	.

