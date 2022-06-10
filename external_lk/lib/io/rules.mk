LOCAL_DIR := $(GET_LOCAL_DIR)

MODULE := $(LOCAL_DIR)

MODULE_DEPS := \

ifeq (false,$(call TOBOOL,$(WITHOUT_CONSOLE)))
MODULE_DEPS += lib/cbuf
MODULE_SRCS += $(LOCAL_DIR)/console.c

CONSOLE_CALLBACK_DISABLES_SERIAL ?= true
ifeq (true,$(call TOBOOL,$(CONSOLE_CALLBACK_DISABLES_SERIAL)))
MODULE_DEFINES += CONSOLE_CALLBACK_DISABLES_SERIAL=1
endif

endif

MODULE_SRCS += \
   $(LOCAL_DIR)/io.c \

include make/module.mk