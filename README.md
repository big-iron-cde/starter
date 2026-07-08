# 6502 Assembly Project

A template for 6502-based assembly language projects.

## Project Structure

```
├── src/            - Source code files (.s, .asm)
│   └── main.s      - Main entry point
├── include/        - Include files and macros
│   └── system.inc  - System definitions
├── lib/            - Library source files
├── build/          - Build artifacts
│   ├── bin/        - Compiled binaries
│   ├── obj/        - Object files
│   └── listings/   - Assembly listings
├── tools/          - Assembler, linker, emulator tools
├── scripts/        - Build and utility scripts
├── tests/          - Unit tests and test programs
├── examples/       - Example programs
└── docs/           - Project documentation

## Requirements

- [ca65](https://cc65.github.io/) assembler and ld65 linker
- [Mesen](https://www.mesen.ca/) or similar 6502 emulator for testing (optional)

## Building

```bash
make          # Build the project
make clean    # Clean build artifacts
make test     # Run tests
```

## Usage

1. Place your source files in `src/`
2. Add shared definitions to `include/`
3. Update the Makefile and `scripts/link.cfg` as needed for your target platform
4. Run `make` to build

## License

[Your License Here]
