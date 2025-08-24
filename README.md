# Assembly Codes 🔧

![GitHub License](https://img.shields.io/github/license/H0NEYP0T-466/Assembly_Codes?style=for-the-badge&color=brightgreen)
![GitHub Stars](https://img.shields.io/github/stars/H0NEYP0T-466/Assembly_Codes?style=for-the-badge&color=yellow)
![GitHub Forks](https://img.shields.io/github/forks/H0NEYP0T-466/Assembly_Codes?style=for-the-badge&color=blue)
![Contributions Welcome](https://img.shields.io/badge/Contributions-Welcome-brightgreen?style=for-the-badge)
![GitHub Issues](https://img.shields.io/github/issues/H0NEYP0T-466/Assembly_Codes?style=for-the-badge&color=red)

A comprehensive collection of Assembly language practical exercises and programs covering fundamental concepts in x86 assembly programming. This repository contains well-documented assembly code examples that demonstrate various programming techniques, from basic I/O operations to advanced arithmetic computations and pattern generation.

## 🔗 Links

- [📚 Installation](#-installation)
- [🐛 Issues](https://github.com/H0NEYP0T-466/Assembly_Codes/issues)
- [🤝 Contributing](./CONTRIBUTING.md)
- [⚖️ License](./LICENSE)

## 📑 Table of Contents

- [🚀 Installation](#-installation)
- [💻 Usage](#-usage)
- [✨ Features](#-features)
- [📁 Project Structure](#-project-structure)
- [🤝 Contributing](#-contributing)
- [⚖️ License](#️-license)
- [🗺️ Roadmap](#️-roadmap)
- [🙏 Acknowledgements](#-acknowledgements)
- [🛠️ Built With](#️-built-with)

## 🚀 Installation

### Prerequisites

- **MASM (Microsoft Macro Assembler)** - For assembling x86 assembly code
- **DOSBox** - For running 16-bit DOS programs on modern systems
- **Text Editor** - Any text editor or IDE with assembly syntax highlighting

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/H0NEYP0T-466/Assembly_Codes.git
   cd Assembly_Codes
   ```

2. **Install MASM and DOSBox**
   - Download and install [DOSBox](https://www.dosbox.com/)
   - Download MASM32 or use MASM from Visual Studio

3. **Set up DOSBox environment**
   ```bash
   # In DOSBox, mount your directory
   mount C: /path/to/Assembly_Codes
   C:
   ```

4. **Compile and run a program**
   ```bash
   # Assemble
   masm filename.asm
   # Link
   link filename.obj
   # Run
   filename.exe
   ```

## 💻 Usage

### Basic Example - Hello World

```assembly
.MODEL SMALL
.STACK 100H

.DATA
    string1 DB 'Hello, World!$', 0
    newline DB 0DH, 0AH, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV DX, OFFSET string1
    MOV AH, 09H
    INT 21H
    MOV AH, 4CH
    INT 21H
MAIN ENDP

END MAIN
```

### Arithmetic Operations Example

```assembly
; Addition of two numbers
mov ah, 1          ; DOS function for character input
int 21h            ; Get first number
sub al, '0'        ; Convert ASCII to number
mov var1, al       ; Store first number

mov ah, 1          ; Get second number
int 21h
sub al, '0'        ; Convert ASCII to number
mov var2, al       ; Store second number

mov al, var1       ; Load first number
add al, var2       ; Add second number
add al, '0'        ; Convert back to ASCII
mov result, al     ; Store result
```

### Command Line Usage

```bash
# Compile any practical file
masm Pratical#X_task#Y.asm

# Link the object file
link Pratical#X_task#Y.obj

# Execute the program
Pratical#X_task#Y.exe
```

## ✨ Features

- 📚 **55 Assembly Programs** - Comprehensive collection covering all basic to advanced assembly concepts
- 🔢 **Arithmetic Operations** - Addition, subtraction, multiplication with user input
- 📝 **String Manipulation** - String printing, character counting, and text processing
- 🔄 **Loop Constructions** - Various loop implementations and pattern generation
- 📥 **Input/Output Operations** - User interaction through DOS interrupts
- 🧮 **Mathematical Expressions** - Complex expression evaluation (A = B+C-D*E)
- 🎨 **Pattern Generation** - Number patterns and visual outputs
- 📊 **Character Analysis** - Uppercase letter counting and text analysis
- 🔧 **Modular Programming** - Use of procedures and functions
- 💡 **Well-Commented Code** - Clear explanations for learning purposes

## 📁 Project Structure

```
Assembly_Codes/
├── 📄 README.md                    # Project documentation
├── ⚖️ LICENSE                      # MIT License
├── 🤝 CONTRIBUTING.md              # Contribution guidelines
│
├── 🧮 Fundamental Concepts         # Basic Assembly Programming
│   ├── Pratical#1_task#1.asm      # Basic assembly structure
│   ├── Pratical#1_task#2.asm      # Simple operations
│   ├── Pratical#3_task#1.asm      # String output operations
│   ├── Pratical#3_task#2.asm      # Multiple string handling
│   ├── Pratical#3_task#3.asm      # Advanced string operations
│   ├── Pratical#4_task#1.asm      # Input/Output operations
│   ├── Pratical#4_task#2.asm      # Character processing
│   └── Pratical#4_task#3.asm      # Data manipulation
│
├── 🔢 Arithmetic Operations        # Mathematical Computations
│   ├── Pratical#5_task#1.asm      # Basic arithmetic
│   ├── Pratical#5_task#2.asm      # Multi-digit operations
│   ├── Pratical#5_task#3.asm      # Arithmetic expressions
│   ├── Pratical#6_task#1.asm      # Addition operations
│   ├── Pratical#6_task#2.asm      # Subtraction operations
│   ├── Pratical#6_task#3.asm      # Multiplication
│   ├── Pratical#6_task#4.asm      # Complex calculations
│   ├── Pratical#7_task#1.asm      # Multiple input handling
│   ├── Pratical#7_task#2.asm      # Addition with user input
│   └── Pratical#7_task#3.asm      # Expression evaluation (A=B+C-D*E)
│
├── 🔄 Loop & Control Structures    # Flow Control
│   ├── Pratical#8_task#1.asm      # Basic loops
│   ├── Pratical#8_task#2.asm      # Nested loops
│   ├── Pratical#8_task#3.asm      # Conditional structures
│   ├── Pratical#9_task#1.asm      # Pattern generation
│   ├── Pratical#9_task#2.asm      # Character counting
│   └── Pratical#9_task#3.asm      # Advanced patterns
│
├── 🎯 Advanced Programming         # Complex Operations
│   ├── Pratical#10_task#1.asm     # Advanced loops
│   ├── Pratical#10_task#2.asm     # String processing
│   ├── Pratical#10_task#3.asm     # Data validation
│   ├── Pratical#11_task#1.asm     # Procedure implementation
│   ├── Pratical#11_task#2.asm     # Function calls
│   ├── Pratical#11_task#3.asm     # Modular programming
│   ├── Pratical#12_task#1.asm     # Advanced procedures
│   ├── Pratical#12_task#2.asm     # Stack operations
│   └── Pratical#12_task#3.asm     # Memory management
│
├── 📚 Additional Examples          # Supplementary Programs
│   ├── add_two_numbers.asm        # Simple addition example
│   ├── capital_small_small_capital.asm # Case conversion
│   ├── coal_theory.asm            # Theoretical implementation
│   ├── countdown.asm              # Countdown timer
│   ├── div-2-3.asm               # Division operations
│   ├── equal_greater_lesser.asm   # Comparison operations
│   ├── even_odd.asm              # Even/odd determination
│   ├── print_char.asm            # Character output
│   ├── print_digit.asm           # Digit printing
│   ├── print_string.asm          # String output
│   └── space.asm                 # Spacing and formatting
│
├── 🧪 Practice Files              # Development Exercises
│   ├── 29-jan-2025.asm          # Recent practice
│   ├── 29-jan-205.asm           # Practice variations
│   ├── 29-jan-25.asm            # Date-based exercises
│   ├── class task.asm           # Classroom assignments
│   ├── question_1.asm           # Problem set 1
│   ├── question_2.asm           # Problem set 2
│   ├── task.asm                 # General tasks
│   └── task1.asm                # Initial task
│
└── 📊 Total: 55 Assembly Files    # Complete collection
```

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guidelines](./CONTRIBUTING.md) for details on:

- 🍴 How to fork and contribute
- 📝 Code style and formatting rules
- 🐛 Bug report guidelines
- ✨ Feature request process
- 🧪 Testing procedures

## ⚖️ License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

## 🗺️ Roadmap

### ✅ Current Features
- [x] Basic I/O operations with DOS interrupts
- [x] Arithmetic operations (addition, subtraction, multiplication)
- [x] String manipulation and character processing
- [x] Loop constructions and pattern generation
- [x] Modular programming with procedures
- [x] User input validation and processing

### 🚧 Planned Features
- [ ] Advanced mathematical operations (division, modulo)
- [ ] File I/O operations
- [ ] Graphics mode programming
- [ ] Interrupt handling examples
- [ ] Memory management techniques
- [ ] Advanced data structures

### 🔮 Future Vision
- [ ] 32-bit assembly examples
- [ ] NASM syntax alternatives
- [ ] Linux assembly equivalents
- [ ] Interactive assembly learning modules
- [ ] Automated testing framework
- [ ] Web-based assembly simulator integration

## 🙏 Acknowledgements

- 🏫 **Educational Institution** - For providing the practical framework
- 📚 **Assembly Language Community** - For continuous learning resources
- 🛠️ **MASM Development Team** - For the excellent assembler
- 🎯 **DOS Legacy** - For the interrupt system that makes these examples possible
- 👥 **Open Source Community** - For inspiration and best practices

## 🛠️ Built With

- **[Assembly Language (x86)](https://en.wikipedia.org/wiki/X86_assembly_language)** - Low-level programming language
- **[MASM (Microsoft Macro Assembler)](https://docs.microsoft.com/en-us/cpp/assembler/masm/)** - Assembler for x86 processors
- **[DOS Interrupts](https://en.wikipedia.org/wiki/DOS_API)** - System calls for I/O operations
- **[16-bit x86 Architecture](https://en.wikipedia.org/wiki/X86-16)** - Target processor architecture
- **[DOSBox](https://www.dosbox.com/)** - DOS emulator for modern systems

---

<div align="center">

**Made with ❤️ by [H0NEYP0T-466](https://github.com/H0NEYP0T-466)**

</div>