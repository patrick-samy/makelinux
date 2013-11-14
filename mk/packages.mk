$(foreach P,$(PACKAGES),$(eval include packages/$(P)/package.mk))

.PHONY: packages
packages: $(PACKAGE_TARGETS)
