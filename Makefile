JEKYLL_VERSION=4.2.2

update:
	docker run --rm \
		-v "${PWD}:/srv/jekyll:Z" \
		-v "${PWD}/vendor/bundle:/usr/local/bundle:Z" \
		jekyll/jekyll:$(JEKYLL_VERSION) \
		bundle update

build:
	docker run --rm \
		-v "${PWD}:/srv/jekyll:Z" \
		-v "${PWD}/vendor/bundle:/usr/local/bundle:Z" \
		jekyll/builder:$(JEKYLL_VERSION) \
		jekyll build

serve:
	docker run --rm \
		-v "${PWD}:/srv/jekyll:Z" \
		-v "${PWD}/vendor/bundle:/usr/local/bundle:Z" \
		-p [::1]:4000:4000 \
		jekyll/jekyll:$(JEKYLL_VERSION) \
		jekyll serve
