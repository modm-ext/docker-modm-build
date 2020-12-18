TARGET_IMAGES = avr cortex-m risc-v
IMAGES = base $(TARGET_IMAGES)
PUSH_LIST = $(addprefix push-, $(IMAGES))

DATE := $(shell date +%F)

.PHONY: all $(IMAGES) $(PUSH_LIST)

all: $(IMAGES)

date:
	echo $(DATE)

$(TARGET_IMAGES): base

# TODO: Put in a single rule...
base: base.Dockerfile
	docker build --tag ghcr.io/modm-ext/modm-build-$@:$(DATE) --file $< .
	docker tag ghcr.io/modm-ext/modm-build-$@:$(DATE) ghcr.io/modm-ext/modm-build-$@:latest
avr: avr.Dockerfile
	docker build --tag ghcr.io/modm-ext/modm-build-$@:$(DATE) --file $< .
	docker tag ghcr.io/modm-ext/modm-build-$@:$(DATE) ghcr.io/modm-ext/modm-build-$@:latest
cortex-m: cortex-m.Dockerfile
	docker build --tag ghcr.io/modm-ext/modm-build-$@:$(DATE) --file $< .
	docker tag ghcr.io/modm-ext/modm-build-$@:$(DATE) ghcr.io/modm-ext/modm-build-$@:latest
risc-v: risc-v.Dockerfile
	docker build --tag ghcr.io/modm-ext/modm-build-$@:$(DATE) --file $< .
	docker tag ghcr.io/modm-ext/modm-build-$@:$(DATE) ghcr.io/modm-ext/modm-build-$@:latest

$(PUSH_LIST):
	docker push ghcr.io/modm-ext/modm-build-$(@:push-%=%):$(DATE)
	docker push ghcr.io/modm-ext/modm-build-$(@:push-%=%):latest

push: $(PUSH_LIST)
