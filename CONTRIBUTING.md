# Contributing to Assembly Codes 🤝

Thank you for your interest in contributing to the Assembly Codes project! This document provides guidelines and instructions for contributing to this educational repository.

## 📋 Table of Contents

- [🍴 Getting Started](#-getting-started)
- [📝 Code Style Guidelines](#-code-style-guidelines)
- [🐛 Bug Reports](#-bug-reports)
- [✨ Feature Requests](#-feature-requests)
- [🧪 Testing Guidelines](#-testing-guidelines)
- [📚 Documentation Updates](#-documentation-updates)
- [🔄 Pull Request Process](#-pull-request-process)

## 🍴 Getting Started

### Fork and Clone

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/Assembly_Codes.git
   cd Assembly_Codes
   ```
3. **Add the original repository** as upstream:
   ```bash
   git remote add upstream https://github.com/H0NEYP0T-466/Assembly_Codes.git
   ```
4. **Create a new branch** for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```

### Development Setup

1. **Install required tools:**
   - MASM (Microsoft Macro Assembler)
   - DOSBox or compatible DOS environment
   - Text editor with assembly syntax highlighting

2. **Test your setup:**
   ```bash
   # In DOSBox
   masm Pratical#3_task#1.asm
   link Pratical#3_task#1.obj
   Pratical#3_task#1.exe
   ```

## 📝 Code Style Guidelines

### Assembly Code Standards

1. **File Naming Convention:**
   - Follow the pattern: `Pratical#X_task#Y.asm`
   - Use lowercase for directives when consistent with existing code
   - Example: `Pratical#13_task#1.asm`

2. **Code Structure:**
   ```assembly
   .MODEL SMALL
   .STACK 100H
   
   .DATA
       ; Data declarations with descriptive names
       prompt DB 'Enter value: $'
       result DB ?
   
   .CODE
   MAIN PROC
       ; Clear, commented code
       MOV AX, @DATA
       MOV DS, AX
       
       ; Your program logic here
       
       ; Program exit
       MOV AH, 4CH
       INT 21H
   MAIN ENDP
   
   END MAIN
   ```

3. **Commenting Standards:**
   - Add comments for complex operations
   - Use meaningful variable names
   - Include a brief description at the top of each file
   - Comment DOS interrupt usage

4. **Code Quality:**
   - Use consistent indentation (4 spaces or tabs)
   - Keep lines under 80 characters when possible
   - Use meaningful labels and variable names
   - Follow existing code patterns in the repository

### Documentation Standards

- Use clear, concise language
- Include code examples where appropriate
- Add emojis for section headers (maintain consistency)
- Keep README.md table of contents updated
- Document any new features or changes

## 🐛 Bug Reports

When reporting bugs, please include:

1. **Assembly file name** where the bug occurs
2. **Expected behavior** vs **actual behavior**
3. **Steps to reproduce** the issue
4. **Environment details:**
   - Operating system
   - Assembler version (MASM/NASM)
   - DOSBox version if applicable

### Bug Report Template

```markdown
**Bug Description:**
Brief description of the issue

**File:** Pratical#X_task#Y.asm

**Expected Behavior:**
What should happen

**Actual Behavior:**
What actually happens

**Steps to Reproduce:**
1. Assemble the file with...
2. Run the program...
3. Input...

**Environment:**
- OS: [Windows/Linux/MacOS]
- Assembler: [MASM/NASM version]
- DOSBox: [version if applicable]
```

## ✨ Feature Requests

We welcome feature requests! Please provide:

1. **Clear description** of the proposed feature
2. **Use case** - why this feature would be valuable
3. **Implementation ideas** (if you have any)
4. **Examples** of similar features in other projects

### Types of Contributions Welcome

- 📚 **New practical exercises** covering advanced topics
- 🔧 **Code improvements** and optimizations
- 📖 **Documentation enhancements**
- 🎯 **Additional examples** for existing concepts
- 🧪 **Testing utilities** for assembly programs
- 🌐 **Cross-platform compatibility** improvements

## 🧪 Testing Guidelines

### Before Submitting

1. **Test your assembly code:**
   ```bash
   # Assemble without errors
   masm your_file.asm
   
   # Link successfully
   link your_file.obj
   
   # Run and verify output
   your_file.exe
   ```

2. **Verify code formatting:**
   - Check indentation consistency
   - Ensure comments are clear and helpful
   - Verify variable names are descriptive

3. **Test edge cases:**
   - Invalid input handling
   - Boundary conditions
   - Error scenarios

### Testing New Features

- Test on multiple DOS environments if possible
- Verify compatibility with existing code patterns
- Document any new dependencies or requirements

## 📚 Documentation Updates

When updating documentation:

1. **Keep README.md current:**
   - Update feature lists
   - Add new examples if applicable
   - Maintain table of contents

2. **Update this CONTRIBUTING.md** if you change:
   - Development setup process
   - Code style guidelines
   - Testing procedures

3. **Add inline comments** for complex assembly operations

## 🔄 Pull Request Process

### Before Creating a PR

1. **Sync with upstream:**
   ```bash
   git fetch upstream
   git checkout main
   git merge upstream/main
   ```

2. **Rebase your feature branch:**
   ```bash
   git checkout feature/your-feature-name
   git rebase main
   ```

3. **Test thoroughly** following the testing guidelines above

### PR Submission

1. **Create a descriptive PR title:**
   - ✨ `feat: add practical for advanced loops`
   - 🐛 `fix: correct arithmetic overflow in task #7`
   - 📚 `docs: update installation instructions`

2. **Include in your PR description:**
   - Summary of changes
   - Testing performed
   - Related issues (if any)
   - Screenshots (for documentation changes)

3. **PR Checklist:**
   - [ ] Code follows style guidelines
   - [ ] Self-review completed
   - [ ] Comments added for complex code
   - [ ] Documentation updated if needed
   - [ ] Testing performed successfully
   - [ ] No merge conflicts

### Review Process

1. **Automated checks** will run (if configured)
2. **Maintainer review** for code quality and educational value
3. **Testing** on different environments
4. **Merge** after approval

## 📞 Getting Help

- 💬 **Discussions:** Use GitHub Discussions for questions
- 🐛 **Issues:** Create an issue for bugs or feature requests
- 📧 **Direct Contact:** Reach out to maintainers for urgent matters

## 🙏 Code of Conduct

- Be respectful and inclusive
- Focus on educational value
- Help newcomers learn assembly programming
- Provide constructive feedback
- Follow GitHub's Community Guidelines

---

Thank you for contributing to Assembly Codes! Your efforts help make assembly programming more accessible to learners worldwide. 🚀