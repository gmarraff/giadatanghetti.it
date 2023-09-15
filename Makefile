JEKYLL_VERSION=4.2.2
ENV=development

update:
	docker run --rm \
		-v "${PWD}:/srv/jekyll:Z" \
		-v "${PWD}/vendor/bundle:/usr/local/bundle:Z" \
		jekyll/jekyll:$(JEKYLL_VERSION) \
		bundle update

build:
	rm -rf ${PWD}/_site && docker run --rm \
		-v "${PWD}:/srv/jekyll:Z" \
		-v "${PWD}/vendor/bundle:/usr/local/bundle:Z" \
		-e JEKYLL_ENV=$(ENV) \
		jekyll/builder:$(JEKYLL_VERSION) \
		jekyll build

serve:
	docker run --rm \
		-v "${PWD}:/srv/jekyll:Z" \
		-v "${PWD}/vendor/bundle:/usr/local/bundle:Z" \
		-e JEKYLL_ENV=$(ENV) \
		-p 4000:4000 \
		jekyll/jekyll:$(JEKYLL_VERSION) \
		jekyll serve
