OBJS := $(patsubst %.cpp, %.o, $(shell find src -type f -name "*.cpp"))
INCLUDE := include
HFILE := $(wildcard $(INCLUDE)/*.hpp)
LIBNAME := Llist
LIB := $(LIBNAME).a
INC_FLAG := -I $(INCLUDE) -g3 -Weverything -Wno-gnu -march=native -Wno-c++98-compat -Wno-padded -Wnon-virtual-dtor -Wno-weak-vtables
OBJ_FLAG := -g3 -Weverything -Wno-gnu -march=native
DEBUG_FLAGS := -O0
CXX := @clang++
CXXFLAGS := -std=c++20 -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi" -DLIBCXX_ENABLE_INCOMPLETE_FEATURES=ON

all: $(LIB)

$(LIB): $(OBJS)
	ar rcs $@ $^
	@printf "\033[32m[  DONE  ]\033[0m  Created library: $@\n"

%.o: %.cpp $(HFILE)
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(INC_FLAG) && printf "\033[32m[  DONE  ]\033[0m  $< \n\e[0m" || printf "\033[91;5m[  FAIL  ]\033[25m  $< \n\e[0m"

debug: CXXFLAGS += $(DEBUG_FLAGS)
debug: $(LIB)

clean:
	@$(RM) $(OBJS)
	@printf "\033[32m[  DONE  ]\033[0m  Cleaned *o\n"

fclean: clean
	@$(RM) $(LIB)
	@printf "\033[32m[  DONE  ]\033[0m  Cleaned $(LIB)\n"

re: fclean all

.PHONY: all clean fclean re debug
