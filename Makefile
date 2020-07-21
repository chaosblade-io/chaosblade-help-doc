.PHONY: build clean

BLADE_SRC_ROOT=`pwd`

GO_ENV=CGO_ENABLED=1
GO_MODULE=GO111MODULE=on
GO=env $(GO_ENV) $(GO_MODULE) go

UNAME := $(shell uname)

ifeq ($(BLADE_VERSION), )
	BLADE_VERSION=0.6.0
endif

BUILD_TARGET=target
BUILD_TARGET_FOR_JAVA_CPLUS=build-target
BUILD_TARGET_DIR_NAME=chaosblade-$(BLADE_VERSION)
BUILD_TARGET_PKG_DIR=$(BUILD_TARGET)/chaosblade-$(BLADE_VERSION)
BUILD_TARGET_BIN=$(BUILD_TARGET_PKG_DIR)/bin
BUILD_IMAGE_PATH=build/image/blade
# cache downloaded file
BUILD_TARGET_CACHE=$(BUILD_TARGET)/cache

OS_YAML_FILE_NAME=chaosblade-docker-spec-$(BLADE_VERSION).yaml
OS_YAML_FILE_PATH=$(BUILD_TARGET_BIN)/$(OS_YAML_FILE_NAME)

ifeq ($(GOOS), linux)
	GO_FLAGS=-ldflags="-linkmode external -extldflags -static"
endif

# chaosblade-exec-os
BLADE_EXEC_OS_PROJECT=https://github.com/chaosblade-io/chaosblade-exec-os.git
BLADE_EXEC_OS_BRANCH=feature_auto_doc

# chaosblade-exec-docker
BLADE_EXEC_DOCKER_PROJECT=https://github.com/chaosblade-io/chaosblade-exec-docker.git
BLADE_EXEC_DOCKER_BRANCH=feature_auto_doc

# chaosblade-exec-kubernetes
BLADE_OPERATOR_PROJECT=https://github.com/chaosblade-io/chaosblade-operator.git
BLADE_OPERATOR_BRANCH=feature_auto_doc

# chaosblade-exec-jvm
BLADE_EXEC_JVM_PROJECT=https://github.com/chaosblade-io/chaosblade-exec-jvm.git
BLADE_EXEC_JVM_BRANCH=feature_auto_doc

# chaosblade-exec-cplus
BLADE_EXEC_CPLUS_PROJECT=https://github.com/chaosblade-io/chaosblade-exec-cplus.git
BLADE_EXEC_CPLUS_BRANCH=master

# create dir or download necessary file
pre_build:mkdir_build_target
	rm -rf $(BUILD_TARGET_PKG_DIR) $(BUILD_TARGET_PKG_FILE_PATH)
	mkdir -p $(BUILD_TARGET_BIN) $(BUILD_TARGET_LIB)

# create cache dir
mkdir_build_target:
ifneq ($(BUILD_TARGET_CACHE), $(wildcard $(BUILD_TARGET_CACHE)))
	mkdir -p $(BUILD_TARGET_CACHE)
endif

# build os
build_os:
ifneq ($(BUILD_TARGET_CACHE)/chaosblade-exec-os, $(wildcard $(BUILD_TARGET_CACHE)/chaosblade-exec-os))
	git clone -b $(BLADE_EXEC_OS_BRANCH) $(BLADE_EXEC_OS_PROJECT) $(BUILD_TARGET_CACHE)/chaosblade-exec-os
else
ifdef ALERTMSG
	$(error $(ALERTMSG))
endif
	git -C $(BUILD_TARGET_CACHE)/chaosblade-exec-os pull origin $(BLADE_EXEC_OS_BRANCH)
endif
	make -C $(BUILD_TARGET_CACHE)/chaosblade-exec-os pre_build build_yaml
	cp $(BUILD_TARGET_CACHE)/chaosblade-exec-os/$(BUILD_TARGET_BIN)/* $(BUILD_TARGET_BIN)

build_docker:
ifneq ($(BUILD_TARGET_CACHE)/chaosblade-exec-docker, $(wildcard $(BUILD_TARGET_CACHE)/chaosblade-exec-docker))
	git clone -b $(BLADE_EXEC_DOCKER_BRANCH) $(BLADE_EXEC_DOCKER_PROJECT) $(BUILD_TARGET_CACHE)/chaosblade-exec-docker
else
	git -C $(BUILD_TARGET_CACHE)/chaosblade-exec-docker pull origin $(BLADE_EXEC_DOCKER_BRANCH)
endif
	make -C $(BUILD_TARGET_CACHE)/chaosblade-exec-docker pre_build build_yaml
	cp $(BUILD_TARGET_CACHE)/chaosblade-exec-docker/$(BUILD_TARGET_BIN)/* $(BUILD_TARGET_BIN)

build_kubernetes:
ifneq ($(BUILD_TARGET_CACHE)/chaosblade-operator, $(wildcard $(BUILD_TARGET_CACHE)/chaosblade-operator))
	git clone -b $(BLADE_OPERATOR_BRANCH) $(BLADE_OPERATOR_PROJECT) $(BUILD_TARGET_CACHE)/chaosblade-operator
else
	git -C $(BUILD_TARGET_CACHE)/chaosblade-operator pull origin $(BLADE_OPERATOR_BRANCH)
endif
	make -C $(BUILD_TARGET_CACHE)/chaosblade-operator pre_build build_yaml
	cp $(BUILD_TARGET_CACHE)/chaosblade-operator/$(BUILD_TARGET_BIN)/* $(BUILD_TARGET_BIN)

build_java:
ifneq ($(BUILD_TARGET_CACHE)/chaosblade-exec-jvm, $(wildcard $(BUILD_TARGET_CACHE)/chaosblade-exec-jvm))
	git clone -b $(BLADE_EXEC_JVM_BRANCH) $(BLADE_EXEC_JVM_PROJECT) $(BUILD_TARGET_CACHE)/chaosblade-exec-jvm
else
ifdef ALERTMSG
	$(error $(ALERTMSG))
endif
	git -C $(BUILD_TARGET_CACHE)/chaosblade-exec-jvm pull origin $(BLADE_EXEC_JVM_BRANCH)
endif
	make -C $(BUILD_TARGET_CACHE)/chaosblade-exec-jvm build_java
	cp -R $(BUILD_TARGET_CACHE)/chaosblade-exec-jvm/plugins/chaosblade-jvm-spec-${BLADE_VERSION}.yaml $(BUILD_TARGET_BIN)

build_cplus:
ifneq ($(BUILD_TARGET_CACHE)/chaosblade-exec-cplus, $(wildcard $(BUILD_TARGET_CACHE)/chaosblade-exec-cplus))
	git clone -b $(BLADE_EXEC_CPLUS_BRANCH) $(BLADE_EXEC_CPLUS_PROJECT) $(BUILD_TARGET_CACHE)/chaosblade-exec-cplus
else
ifdef ALERTMSG
	$(error $(ALERTMSG))
endif
	git -C $(BUILD_TARGET_CACHE)/chaosblade-exec-cplus pull origin $(BLADE_EXEC_CPLUS_BRANCH)
endif
	make -C $(BUILD_TARGET_CACHE)/chaosblade-exec-cplus pre_build build_yaml
	cp -R $(BUILD_TARGET_CACHE)/chaosblade-exec-cplus/$(BUILD_TARGET_FOR_JAVA_CPLUS)/$(BUILD_TARGET_DIR_NAME)/* $(BUILD_TARGET_PKG_DIR)

build: pre_build build_os build_docker build_kubernetes build_java build_cplus build_yaml
	$(GO) run build/doc/generateDoc.go

build_yaml:
	$(GO) run build/spec.go

# clean all build result
clean:
	go clean ./...
	rm -rf $(BUILD_TARGET)
	rm -rf $(BUILD_IMAGE_PATH)/$(BUILD_TARGET_DIR_NAME)
