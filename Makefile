.DEFAULT_GOAL := makeiso

clean:
	sudo rm -rf /tmp/archiso-tmp

makeiso:
	mkdir -p out
	sudo mkarchiso -v -o out -w /tmp/archiso-tmp .