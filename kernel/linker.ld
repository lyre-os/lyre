ENTRY(main)

SECTIONS {
    . = 0xffffffff80200000;

    /* Name required by spec. */
    .stivale2hdr : ALIGN(4K) {
        KEEP(*(.stivale2hdr))
    }

    /* Actual kernel. */
    .text : ALIGN(4K) {
        *(.text*)
    }

    .rodata : ALIGN(4K) {
        *(.rodata*)
    }

    .data : ALIGN(4K) {
        *(.data*)
    }

    .drivers : ALIGN(4K) {
        drivers_start = .;
        *(.drivers*)
        drivers_end = .;
    }

    .bss : ALIGN(4K) {
        *(.bss*)
        *(COMMON)
        . = ALIGN(4K);
        kernelTop = .;
    }
}

