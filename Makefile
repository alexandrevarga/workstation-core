STOW_DIR := stow-packages
TARGET_DIR := $(HOME)
STOW_CMD := stow --dir=$(STOW_DIR) --target=$(TARGET_DIR) --restow -v

CORE_PACKAGES := git

.PHONY: core terminal desktop all help clean

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

core: $(CORE_PACKAGES) ## Deploy core packages

all: core ## Deploy the complete ecosystem

.PHONY: $(CORE_PACKAGES)
$(CORE_PACKAGES):
	@$(STOW_CMD) $@

clean: ## Remove all public symlinks
	stow --dir=$(STOW_DIR) --target=$(TARGET_DIR) -D -v $(CORE_PACKAGES)
