TARGET_IMAGES = avr cortex-m risc-v cortex-m-openocd
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
	cat $< | sed "s/modm-build-base:TAG/modm-build-base:$(DATE)/g" | \
	docker build --tag ghcr.io/modm-ext/modm-build-$@:$(DATE) -
	docker tag ghcr.io/modm-ext/modm-build-$@:$(DATE) ghcr.io/modm-ext/modm-build-$@:testing
cortex-m: cortex-m.Dockerfile
	cat $< | sed "s/modm-build-base:TAG/modm-build-base:$(DATE)/g" | \
	docker build --tag ghcr.io/modm-ext/modm-build-$@:$(DATE) -
	docker tag ghcr.io/modm-ext/modm-build-$@:$(DATE) ghcr.io/modm-ext/modm-build-$@:testing
cortex-m-openocd: cortex-m-openocd.Dockerfile cortex-m
	cat $< | sed "s/modm-build-cortex-m:TAG/modm-build-cortex-m:$(DATE)/g" | \
	docker build --tag ghcr.io/modm-ext/modm-build-$@:$(DATE) -
	docker tag ghcr.io/modm-ext/modm-build-$@:$(DATE) ghcr.io/modm-ext/modm-build-$@:testing
risc-v: risc-v.Dockerfile
	cat $< | sed "s/modm-build-base:TAG/modm-build-base:$(DATE)/g" | \
	docker build --tag ghcr.io/modm-ext/modm-build-$@:$(DATE) -
	docker tag ghcr.io/modm-ext/modm-build-$@:$(DATE) ghcr.io/modm-ext/modm-build-$@:testing

$(PUSH_LIST):
	docker push ghcr.io/modm-ext/modm-build-$(@:push-%=%):$(DATE)
	docker push ghcr.io/modm-ext/modm-build-$(@:push-%=%):latest

push: $(PUSH_LIST)
