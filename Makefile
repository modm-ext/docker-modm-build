TARGET_IMAGES = avr cortex-m risc-v
IMAGES = base $(TARGET_IMAGES)
PUSH_LIST = $(addprefix push-, $(IMAGES))

.PHONY: all $(IMAGES) $(PUSH_LIST)

all: $(IMAGES)

$(TARGET_IMAGES): base

# TODO: Put in a single rule...
base: base.Dockerfile
	docker build --tag modm/modm-build:$@ --file $< .
avr: avr.Dockerfile
	docker build --tag modm/modm-build:$@ --file $< .
cortex-m: cortex-m.Dockerfile
	docker build --tag modm/modm-build:$@ --file $< .
risc-v: risc-v.Dockerfile
	docker build --tag modm/modm-build:$@ --file $< .

$(PUSH_LIST):
	docker push modm/modm-build:$(@:push-%=%)

push: $(PUSH_LIST)
