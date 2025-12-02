# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dde-fite <dde-fite@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/15 21:44:11 by dde-fite          #+#    #+#              #
#    Updated: 2025/12/02 22:08:48 by dde-fite         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
# *                          FT_PRINTF by dde-fite                           * #
# **************************************************************************** #

# ******************************** VARIABLES  ******************************** #
SHELL := /bin/bash

# FILES
NAME			= libftprintf.a
SRC_FILES		= ft_printf.c writers_switch.c \
				utils/variadic_getter.c \
				conversions/int_conversion.c conversions/char_conversion.c conversions/uint_conversion.c conversions/str_conversion.c conversions/hex_conversion.c conversions/ptr_conversion.c

SRCB_FILES		:= ft_printf_bonus.c argument_getters_bonus.c writers_switch_bonus.c \
				utils/printing_helpers_bonus.c utils/variadic_getter_bonus.c utils/number_helpers_bonus.c \
				conversions/int_conversion_bonus.c conversions/char_conversion_bonus.c conversions/uint_conversion_bonus.c conversions/str_conversion_bonus.c conversions/hex_conversion_bonus.c conversions/ptr_conversion_bonus.c
SRC_FOLDER		= src
SRCB_FOLDER		= srcb
INCLUDE_FOLDER	= include
BUILD_FOLDER	= build
LIBFT_FOLDER	= libft
SRC				:= $(addprefix $(SRC_FOLDER)/, $(SRC_FILES))
OBJ				:= $(patsubst $(SRC_FOLDER)/%.c,$(BUILD_FOLDER)/%.o,$(SRC))
SRCB			:= $(addprefix $(SRCB_FOLDER)/, $(SRCB_FILES))
OBJB			:= $(patsubst $(SRCB_FOLDER)/%.c,$(BUILD_FOLDER)/%.o,$(SRCB))
TOTAL			:= $(words $(SRC))
TOTALB			:= $(words $(SRCB))

# GCC COMPILER
CC				= cc
CFLAGS			= -Wall -Werror -Wextra -c -I$(INCLUDE_FOLDER) -I${LIBFT_FOLDER} -O3 -march=native -fno-semantic-interposition -fno-plt

# AR LIBRARY
AR				= ar
AFLAGS			= rs

# COMMANDS
RM				= rm
MKDIR			= mkdir
CP				= cp

# COLORS
GREEN			:= \033[1;32m
BLUE			:= \033[1;34m
YELLOW			:= \033[1;33m
PURPLE			:= \033[1;35m
CYAN			:= \033[1;36m
RED				:= \033[1;31m
RESET			:= \033[0m

# BAR
BAR_LEN			:= 100

# ********************************** RULES  ********************************** #

all: ${NAME}

${NAME}: ${LIBFT_FOLDER}/libft.a ${SRC}
	@echo -e "\n${PURPLE}"
	@echo " ░▒▓████████▓▒░▒▓████████▓▒           ░▒▓███████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░▒▓████████▓▒░▒▓████████▓▒░ "
	@echo " ░▒▓█▓▒░         ░▒▓█▓▒░              ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░        "
	@echo " ░▒▓█▓▒░         ░▒▓█▓▒░              ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░        "
	@echo " ░▒▓██████▓▒░    ░▒▓█▓▒░              ░▒▓███████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓██████▓▒░   "
	@echo " ░▒▓█▓▒░         ░▒▓█▓▒░              ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░        "
	@echo " ░▒▓█▓▒░         ░▒▓█▓▒░              ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░        "
	@echo " ░▒▓█▓▒░         ░▒▓█▓▒░  ░▒▓████▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░        "
	@echo -e "${RED}"
	@echo "                                                 by dde-fite                                                  "
	@echo -e "${RESET}Creating build folder if does not exist ...\n"
	@${MKDIR} -p ${BUILD_FOLDER}
	@${MKDIR} -p ${dir $(OBJ)}
	@echo -e "Compiling ft_printf files ...\n${YELLOW}"
	@count=0; \
	for file in ${SRC_FILES}; do \
		${CC} ${CFLAGS} -o ${BUILD_FOLDER}/$${file%.c}.o ${SRC_FOLDER}/$$file; \
		count=$$((count + 1)); \
		progress=$$((count * 100 / ${TOTAL})); \
		hashes_len=$$((progress * ${BAR_LEN} / 100)); \
		hashes=$$(printf '%0.s#' $$(seq 1 $$hashes_len)); \
		spaces_len=$$((BAR_LEN - hashes_len)); \
		spaces=$$(printf '%0.s ' $$(seq 1 $$spaces_len)); \
		printf "\r[%s%s] %d%%" "$$hashes" "$$spaces" "$$progress"; \
	done; \
	echo
	@echo -e "${RESET}\nCloning libft binary ...\n"
	@${CP} ${LIBFT_FOLDER}/libft.a ${NAME}
	@echo "Archiving objects in ${NAME} ..."
	@echo ""
	@${AR} ${AFLAGS} ${NAME} ${OBJ}
	@echo -e "${GREEN}Process completed :)${RESET}\n"

bonus: .bonus
	@echo "Bonus done."

.bonus: ${LIBFT_FOLDER}/libft.a ${SRCB}
	@echo -e "\n${PURPLE}"
	@echo " ░▒▓████████▓▒░▒▓████████▓▒           ░▒▓███████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░▒▓████████▓▒░▒▓████████▓▒░ "
	@echo " ░▒▓█▓▒░         ░▒▓█▓▒░              ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░        "
	@echo " ░▒▓█▓▒░         ░▒▓█▓▒░              ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░        "
	@echo " ░▒▓██████▓▒░    ░▒▓█▓▒░              ░▒▓███████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓██████▓▒░   "
	@echo " ░▒▓█▓▒░         ░▒▓█▓▒░              ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░        "
	@echo " ░▒▓█▓▒░         ░▒▓█▓▒░              ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░        "
	@echo " ░▒▓█▓▒░         ░▒▓█▓▒░  ░▒▓████▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░   ░▒▓█▓▒░        "
	@echo -e "${CYAN}                                                                                  _ __                        "
	@echo "                                                                           \ /   ( /  )                   \ / "
	@echo "                                                                          --X--   /--< __ _ _   , , (    --X--"
	@echo "                                                                           / \   /___/(_)/ / /_(_/_/_)_   / \ "
	@echo -e "${RED}"
	@echo "                                                 by dde-fite                                                  "
	@echo -e "${RESET}Creating build folder if does not exist ...\n"
	@${MKDIR} -p ${BUILD_FOLDER}
	@${MKDIR} -p ${dir $(OBJB)}
	@echo -e "Compiling ft_printf files ...\n${YELLOW}"
	@count=0; \
	for file in ${SRCB_FILES}; do \
		${CC} ${CFLAGS} -o ${BUILD_FOLDER}/$${file%.c}.o ${SRCB_FOLDER}/$$file; \
		count=$$((count + 1)); \
		progress=$$((count * 100 / ${TOTALB})); \
		hashes_len=$$((progress * ${BAR_LEN} / 100)); \
		hashes=$$(printf '%0.s#' $$(seq 1 $$hashes_len)); \
		spaces_len=$$((BAR_LEN - hashes_len)); \
		spaces=$$(printf '%0.s ' $$(seq 1 $$spaces_len)); \
		printf "\r[%s%s] %d%%" "$$hashes" "$$spaces" "$$progress"; \
	done; \
	echo
	@echo -e "${RESET}\nCloning libft binary ...\n"
	@${CP} ${LIBFT_FOLDER}/libft.a ${NAME}
	@echo "Archiving objects in ${NAME} ..."
	@echo ""
	@${AR} ${AFLAGS} ${NAME} ${OBJB}
	@echo -e "${GREEN}Process completed :)${RESET}\n"
	@touch .bonus

# Libft

${LIBFT_FOLDER}/libft.a:
	@echo -e "${GREEN}--------------LIBFT-COMPILATION---------------"
	@${MAKE} -C ${LIBFT_FOLDER} all
	@echo -e "${GREEN}-----------END-OF-LIBFT-COMPILATION-----------${RESET}\n"

update_modules:
	@echo "Updating submodules ..."
	@git submodule init
	@git submodule update --recursive --remote
	@echo "Submodules successfully updated"

get_libft: update_modules

# Cleaning

clean:
	@echo "Deleting ${BUILD_FOLDER} and cleaning libft ..."
	@echo ""
	@${RM} -rf ${BUILD_FOLDER}
	@${MAKE} -C ${LIBFT_FOLDER} clean

fclean: clean
	@echo "Deleting binary file (${NAME}) and libft.a ..."
	@echo ""
	@${RM} -f ${NAME}
	@${MAKE} -C ${LIBFT_FOLDER} fclean
	@${RM} -f ${NAME} .bonus

re: fclean all

.PHONY: all clean fclean re update_modules get_libft bonus
