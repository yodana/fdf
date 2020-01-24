NAME = fdf

SRC_PATH = ./srcs/
INC_PATH = ./inc/
OBJ_PATH = ./obj/
LIB_PATH = ./libft/

SRC_NAME = main.c

INC_NAME = fdf.h
LIB_NAME = libft.a

OBJ_NAME = $(SRC_NAME:.c=.o)

INC = $(addprefix $(INC_PATH), $(INC_NAME))
SRC = $(addprefix $(SRC_PATH), $(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH), $(OBJ_NAME))
LIB = $(addprefix $(LIB_PATH), $(LIB_NAME))

CFLAGS = -Wall -Wextra -Werror
CC = gcc -g


_GREY=$ \033[30m
_RED=$ \033[31m
_GREEN=$ \033[32m
_YELLOW=$ \033[33m
_BLUE=$ \033[34m
_PURPLE=$ \033[35m
_CYAN=$ \033[36m
_WHITE=$ \033[37m
_END=$ \033[0m


.PHONY: all clean fclean re norme

all: $(LIB) $(OBJ_PATH) $(NAME)

$(OBJ_PATH):
	mkdir $@

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	$(CC) $(CFLAGS) -o $@ -c $<

$(NAME): $(LIB) $(INC) $(OBJ)
	$(CC) $(CFLAGS) $(SRC) $(LIB) ./minilibx_macos/libmlx.a -o $(NAME) -framework OpenGL -framework Appkit
	echo "\n✅ $(_GREEN)$(NAME) created$(_END)"

$(LIB): FORCE
	$(MAKE) -C libft all

FORCE:

clean:
	$(MAKE) -C libft clean
	$(RM) -r $(OBJ_PATH)
	echo "❌ $(_RED)OBJECT FILES DELETED  $(_END)"

fclean: clean
	$(MAKE) -C libft fclean
	$(RM) $(NAME)
	echo "❌ $(_RED)$(NAME) DELETED $(_END)"

re: fclean all