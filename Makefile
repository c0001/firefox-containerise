.PHONY: clean
clean:
	@bash -c "set -e; if [ -d .git ]      ; \
		then echo 'In-git-mode'       ; \
			git reset --hard HEAD ; \
			git clean -xfd .      ; \
		else \
			echo 'No method to clean in non-git-mode' ; \
			exit 1 ; \
		fi"

.PHONY: build
build: clean
	npm ci
	npm run test
	npm run build
