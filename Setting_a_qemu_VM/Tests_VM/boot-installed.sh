#!/bin/bash
qemu-system-x86_64 \\ 
    -name "loc-os-vm" \\
    -m 1024 \\
    -smp 3 \\
    $KVM_FLAGS \\
    -drive file="../VM_images/loc-os-vm",format=qcow2 \\
    -boot c \\
    -device virtio-net,netdev=net0 \\
    -netdev user,id=net0,hostfwd=tcp::2222-:22

