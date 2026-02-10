TARGET := bienvenue
MODULE := fonction-bienvenue

CXX = g++ -c
LD = g++ -o
RM = rm -f

CXXFLAGS = -Wall -std=c++11
LDFLAGS =

$(info Fabrication du programme : $(TARGET))

# Règle principale
all : $(TARGET)

# Règle pour générer l'exécutable
$(TARGET): $(TARGET).o $(MODULE).o
	$(LD) $@ $(LDFLAGS) $^

# Règle pour compiler bienvenue.cpp en bienvenue.o
$(TARGET).o: $(TARGET).cpp $(MODULE).h
	$(CXX) $(CXXFLAGS) $<

# Règle pour compiler fonction-bienvenue.cpp en fonction-bienvenue.o
$(MODULE).o: $(MODULE).cpp $(MODULE).h
	$(CXX) $(CXXFLAGS) $<

# Nettoyage des fichiers objets
.PHONY: clean

clean:
	$(RM) *.o

# Nettoyage complet : suppression des objets et de l'exécutable
cleanall:
	$(RM) *.o $(TARGET)

# Reconstruire le projet (nettoyage + compilation)
rebuild: clean all

