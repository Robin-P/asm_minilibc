##
## EPITECH PROJECT, 2018
## mdr
## File description:
## mdr
##

NAME	=	libasm.so

ASM	=	nasm -f elf64

CC	=	ld

RM	=	rm -f

SRCS	=	srcs/strlen.S		\
		srcs/strcmp.S		\
		srcs/strncmp.S		\
		srcs/strchr.S		\
		srcs/memset.S		\
		srcs/strcasecmp.S	\
		srcs/rindex.S		\
		srcs/strpbrk.S		\
		srcs/strcspn.S		\
		srcs/strstr.S		\
		srcs/memcpy.S		\
#               	srcs/memmove.S


OBJS	=	$(SRCS:.S=.o)

CFLAGS	=	-I include -shared

.S.o:
		@$(ASM) $< -o $@ && \
		printf "[\033[1;32mcompiled\033[0m] % 29s\n" $< | tr ' ' '.' || \
		printf "[\033[1;31mfailed\033[0m] % 31s\n" $< | tr ' ' '.'

all: 		$(NAME)

$(NAME):	$(OBJS)
		@$(CC) $(CFLAGS) $(OBJS) -o $(NAME) && \
		printf "[\033[1;36mbuilt\033[0m] % 32s\n" $(NAME) | tr ' ' '.' || \
		printf "[\033[1;31mfailed\033[0m] % 31s\n" $(NAME) | tr ' ' '.'

clean:
		@$(RM) $(OBJS) && \
		printf "[\033[1;31mdeleted\033[0m] % 30s\n" $(OBJS) | tr ' ' '.' || \
		printf "[\033[1;31mdeleted\033[0m] % 30s\n" $(OBJS) | tr ' ' '.'

fclean: 	clean
		@$(RM) $(NAME) && \
		printf "[\033[1;31mdeleted\033[0m] % 30s\n" $(NAME) | tr ' ' '.' || \
		printf "[\033[1;31mdeleted\033[0m] % 30s\n" $(NAME) | tr ' ' '.'
re:		fclean all

.PHONY: 	all clean fclean re
