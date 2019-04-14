.PHONY: clean distclean default

#compiler definition c or c++
CC=gcc
CXX=c++

#flag definition
CFLAGS=-g -Wall
CXXFLAGS=-Wall -std=c++11

#Executable program
TARGETC=crun
TARGETCPP=cpprun

#Identify OS
UNAME_S := $(shell uname -s)

RM=Del
ifeq ($(UNAME_S),Linux)
	RM=rm
endif
ifeq ($(UNAME_S),Darwin)
	RM=rm
endif

#default action on make command
default: $(TARGETC) $(TARGETCPP)

$(TARGETC): #Insert c files
	$(CC) $(CFLAGS) -o $@ $^

$(TARGETCPP): #Insert cpp files
	$(CXX) $(CXXFLAGS) -o $@ $^

#Clean directory
clean:
ifeq ($(RM),Del)
	$(RM) #Insert generated files inside " " for windows
endif
ifeq ($(RM),rm)
	$(RM) #Insert generated files for MacOS and Linux
endif

distclean: clean
ifeq ($(RM),Del)
	$(RM) #Insert executable files inside " " for windows
endif
ifeq ($(RM),rm)
	$(RM) #Insert executable files for MacOS and Linux
endif
