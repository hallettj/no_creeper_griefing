.PHONY: all

datapack_files := $(shell find datapack/)

all: no_creeper_griefing.zip

no_creeper_griefing.zip: $(datapack_files)
	cd datapack && zip -r ../$@ *
