KDIR := /lib/modules/$(shell uname -r)/build
KBUILD_EXTRA_SYMBOLS := /opt/stack/kvm-kmod/Module.symvers

obj-m += security_monitor.o

default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules

userspace:
	$(CC) netlink_user.c -o netlink_user

clean:
	rm -rf *.o *.ko *.mod.* *.cmd .module* modules* Module* .*.cmd .tmp* netlink_user
