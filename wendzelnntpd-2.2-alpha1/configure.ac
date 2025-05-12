#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([WendzelNNTPd],[2.2-alpha1])
AM_INIT_AUTOMAKE

AC_CONFIG_SRCDIR([src/main.c])

AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CC
AC_PROG_INSTALL

# Checks for header files.
AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h strings.h sys/socket.h sys/time.h syslog.h unistd.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_PID_T
AC_TYPE_SIZE_T
AC_TYPE_SSIZE_T
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T
AC_TYPE_UINT8_T

# Checks for library functions.
AC_FUNC_FORK
AC_FUNC_REALLOC
AC_CHECK_FUNCS([bzero gethostbyaddr gethostname getpass inet_ntoa memset regcomp select socket strcasecmp strdup strncasecmp strndup strstr])

AC_CONFIG_FILES([
  Makefile
  src/Makefile
])
AC_OUTPUT
