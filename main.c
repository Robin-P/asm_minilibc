#include <stdio.h>

size_t strlen(const char *);
int strcmp(const char *, const char *);
int strcasecmp(const char *, const char *);
int strncmp(const char *, const char *, size_t);
char *strchr(const char *, int);
char *rindex(const char *, int);
void *memset(void *, int, size_t);
void *memcpy(void *, const void *, size_t);
void *memmove(void *, const void *, size_t);
size_t strcspn(const char *, const char *);
char *strpbrk(const char *s, const char *accept);
char *strstr(const char *, const char *);

int main(int argc, char *argv[])
{
	char a[] = "abab";
	char empty[] = "";
	char mem[20] = "";

	printf("-- LEN --\n");
	printf("Len '%s' : %d\n", empty, strlen(empty));
	printf("Len '%s' : %d\n", argv[1], strlen(argv[1]));

	printf("\n-- STRCMP --\n");
	printf("Strcmp '%s' et '%s' : %d\n", argv[1], a, strcmp(argv[1], a));
	printf("Strcmp '%s' et '%s' : %d\n", a, argv[1], strcmp(a, argv[1]));
	printf("Strcmp '%s' et '%s' : %d\n", empty, a, strcmp(empty, a));

	printf("\n-- STRNCMP --\n");
	printf("Strncmp '%s' et '%s' - 15 : %d\n", argv[1], a, strncmp(argv[1], a, 15));
	printf("Strncmp '%s' et '%s' - 5 : %d\n", argv[1], a, strncmp(argv[1], a, 5));
	printf("Strncmp '%s' et '%s' - 2 : %d\n", argv[1], a, strncmp(argv[1], a, 2));
	printf("Strncmp '%s' et '%s' - 0 : %d\n", argv[1], a, strncmp(argv[1], a, 0));

	printf("\n-- STRCHR --\n");
	printf("   -> string start at  : %p\n\n", a);
	printf("Strchr '%c' dans '%s' : %p\n", 'b', a, strchr(a, 'b'));
	printf("Strchr '%c' dans '%s' : %p\n", 'a', a, strchr(a, 'a'));
	printf("Strchr '%c' dans '%s' : %p\n", 'z', a, strchr(a, 'z'));

	printf("\n-- RINDEX --\n");
	printf("   -> string start at  : %p\n", a);
	printf("   -> string  end  at  : %p\n\n", a + strlen(a));
	printf("Rindex '%c' dans '%s' : %p\n", 'b', a, rindex(a, 'b'));
	printf("Rindex '%c' dans '%s' : %p\n", 'a', a, rindex(a, 'a'));
	printf("Rindex '%c' dans '%s' : %p\n", 'z', a, rindex(a, 'z'));

	printf("\n-- MEMSET --\n");
	printf("Memset '%s' prend %d char '%c' :", mem, 7, 'a');
	printf(" %s\n" , memset(mem, 'a', 7));
	printf("Memset '%s' prend %d char '%c' :", mem, 3, '0');
	printf(" %s\n", memset(mem, '0', 3));
	printf("Memset '%s' prend %d char '%c' :", mem, 2, 'z');
	printf(" %s\n", memset(mem, 'z', 2));

	char lol[] = "stackoverflow";
	char *lol_1, *lol_2;
	lol_1 = lol;
	lol_2 = lol;

	printf("\n-- MEMCPY --\n");
	char b[] = "mlk";
	char c[] = "poi";
	char d[] = "jhnls";
	char move[] = "abcde";

	printf("Memcpy '%s' prend %d char de '%s' :", a, 2, b);
	printf(" %s\n" , memcpy(a, b, 2));
	printf("Memcpy '%s' prend %d char de '%s' :", a, 3, c);
	printf(" %s\n", memcpy(a, c, 3));
	printf("Memcpy '%s' prend %d char de '%s' :", a, 2, b);
	printf(" %s\n", memcpy(a, b, 2));
	printf("Memcpy '%s' prend %d char de '%s' :", a, 5, c);
	printf(" %s\n", memcpy(a, c, 5));
	printf("Memcpy '%s' prend %d char de '%s' :", d, 7, c);
	printf(" %s\n", memcpy(d, c, 7));
	printf("Memcpy '%s' prend %d char de '%s' :", lol_1 + 5, 7, lol_1);
	printf(" %s\n", memcpy(lol_1 + 5, lol_1, 7));

	printf("\n-- MEMMOVE --\n");
	memcpy(b, "mlk", 3);
	memcpy(c, "poi", 3);
	memcpy(d, "jhnls", 3);
	memcpy(move, "abcde\0", 6);
	printf("Memmove '%s' prend %d char de '%s' :", a, 2, b);
	printf(" %s\n", memmove(a, b, 2));
	printf("Memmove '%s' prend %d char de '%s' :", a, 3, c);
	printf(" %s\n", memmove(a, c, 3));
	printf("Memmove '%s' prend %d char de '%s' :", a, 2, b);
	printf(" %s\n", memmove(a, b, 2));
	printf("Memmove '%s' prend %d char de '%s' :", a, 5, c);
	printf(" %s\n", memmove(a, c, 5));
	printf("Memmove '%s' prend %d char de '%s' :", d, 7, c);
	printf(" %s\n", memmove(d, c, 7));
	printf("Memmove '%s' prend %d char de '%s' :", lol_1 + 5, 7, lol_1);
	printf(" %s\n", memmove(lol_2 + 5, lol_2, 7));

	printf("\n-- STRCASECMP --\n");
	memcpy(a, "aBdE\0", 5);
	printf("Strcasecmp '%s' et '%s' : %d\n", argv[1], a, strcasecmp(argv[1], a));
	printf("Strcasecmp '%s' et '%s' : %d\n", a, argv[1], strcasecmp(a, argv[1]));
	printf("Strcasecmp '%s' et '%s' : %d\n", empty, a, strcasecmp(empty, a));

	printf("\n-- STRCSPN --\n");
	memcpy(a, "abcd\0", 5);
	printf("Strcspn '%s' et '%s' : %d\n", argv[1], a, strcspn(argv[1], a));
	printf("Strcspn '%s' et '%s' : %d\n", a, argv[1], strcspn(a, argv[1]));
	printf("Strcspn '%s' et '%s' : %d\n", empty, a, strcspn(empty, a));

	printf("\n-- STRPBRK --\n");
	memcpy(a, "abcd\0", 5);
	printf("Strpbrk '%s' et '%s' : %s\n", argv[1], a, strpbrk(argv[1], a));
	printf("Strpbrk '%s' et '%s' : %s\n", a, argv[1], strpbrk(a, argv[1]));
	printf("Strpbrk '%s' et '%s' : %s\n", empty, a, strpbrk(empty, a));
	printf("Strpbrk '%s' et '%s' : %s\n", a, empty, strpbrk(a, empty));

	printf("\n-- STRSTR --\n");
	printf("Strstr '%s' dans '%s' : %s\n", a, argv[1], strstr(argv[1], a));
	printf("Strstr '%s' dans '%s' : %s\n", argv[1], a, strstr(a, argv[1]));
	printf("Strstr '%s' dans '%s' : %s\n", a, empty, strstr(empty, a));
	printf("Strstr '%s' dans '%s' : %s\n", empty, a, strstr(a, empty));
	printf("Strstr '%s' dans '%s' : %s\n", empty, empty, strstr(empty, empty));
	return 0;
}
