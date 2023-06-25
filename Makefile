.PHONY: setup
setup:
	mix setup

.PHONY: serve
serve:
	mix phx.server

.PHONY: clean
clean:
	rm -r _build
