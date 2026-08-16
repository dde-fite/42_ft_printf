<p align="center">
	<img align="center" src="media/42_ft_printf.png">
	<h1 align="center">42_ft_printf</h1>
</p>

<p align="center">
	<img alt="moulinette passing" src="https://img.shields.io/badge/moulinette-passing-gree">
	<img alt="francinette passing" src="https://img.shields.io/badge/francinette-passing-gree">
    <img alt="score 125/100" src="https://img.shields.io/badge/125/100-g?logo=42&logoColor=white">
	<img src="https://codestats.cloud.defitero.com/api/badge/nora.defitero/interval:any/project:42_ft_printf">
</p>

<p align="center">
This work is published under the terms of <a href="LICENSE"><b>MIT license</b></a>. Hosted on <b><a href="https://codeberg.org/noradefitero/42_ft_printf">Codeberg</a></b>.
</p>

<div align="center">
    <h2>A printf replica</h2>
</div>

<div align="center">
	<img height="500" src="media/ft_printf_bonus.png">
	<img height="500" src="media/make.png">
</div>

## Features
- Implements all basic `printf` conversions.
- Fully supports all bonus features:
  - Complete handling of flags: `-`, `0`, `.`, field width, `#`, `+`, and space.
  - All possible flag combinations for each conversion.

## Requirements
The functions and Makefile are designed for use in a UNIX-like environment; any use outside this scope does not guarantee correct or efficient operation.
- Make
- GCC

## Usage

### Compiling
- Clone the repository recursively to download the submodules.
``` bash
git clone --recursive https://codeberg.org/noradefitero/42_ft_printf.git
```

- For the general section
``` bash
make
```

- For the bonus section.
``` bash
make bonus
```

### Using it as a static library
After installation is complete, the libft.a file will appear. This static library can be used in any project.s

You can include the library by including libft.h and libft.a as in the example:

- First include the header file in your C or header files.
``` h
#include "ft_printf.h"

// or for bonus
#include "ft_printf_bonus.h"
```

- Then compile using the library
``` bash
gcc main.c libftprintf.a
```

## Got any suggestions?
If you find any errors or have any new ideas for improving this repository, feel free to open an Issue or Pull Request, or contact me at my email address: nora@defitero.com
