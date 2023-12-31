
-include config.mk

CXXFLAGS += -MMD -MP -Ilib
LIBS += -lsdk_m2m -lsdk_aos -lm2mgen -lxsd_mtrsvc -lxsd -lcoap -ldtls -lcommon -lappfw

EXE = aos_neutral_app

SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)
DEPS = $(SRCS:.cpp=.d)

all: $(EXE)

$(EXE): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS) $(LIBS)

-include $(DEPS)

clean:
	rm -f $(EXE) $(OBJS) $(DEPS) *.aos

.PHONY: all clean

