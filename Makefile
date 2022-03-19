.DEFAULT_GOAL := makeiso

clean:
	sudo rm -rf /tmp/archiso-tmp
	rm -rf repo

makeiso:
	mkdir -p repo
	if cd plymouth-git; then git pull; else git clone https://aur.archlinux.org/plymouth-git.git; fi
	cd plymouth-git && \
	makepkg -sf && \
	repo-add ../repo/repo.db.tar.gz plymouth-git-*.pkg.tar.zst && \
	cp plymouth-git-*.pkg.tar.zst ../repo/
	mkdir -p out
	sudo mkarchiso -v -o out -w /tmp/archiso-tmp .