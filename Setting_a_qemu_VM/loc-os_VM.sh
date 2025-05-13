#!/bin/bash

# Simple QEMU Script for loc-OS on Lubuntu
# VM specs: 1GB RAM, 3 CPU cores

# Set your local ISO path here
ISO_PATH="../../../OS_installation/Loc-OS-23-LXDE-x86_64.iso"  # <-- CHANGE THIS to your loc-OS ISO path

# VM settings
VM_NAME="loc-os-vm"
RAM_MB=1024
CPU_CORES=3
DISK_IMG="$VM_NAME.img"

# Check if QEMU is installed
if ! command -v qemu-system-x86_64 &> /dev/null; then
    echo "QEMU is not installed. Installing required packages..."
    sudo apt update
    sudo apt install -y qemu-system-x86 qemu-utils
fi

# Create disk image if it doesn't exist
if [ ! -f "$DISK_IMG" ]; then
    echo "Creating disk image (8GB)..."
    qemu-img create -f qcow2 "$DISK_IMG" 8G
    mv ./VM_images/"$DIS_IMG"
fi

# Check if ISO exists
if [ ! -f "$ISO_PATH" ]; then
    echo "ERROR: ISO file not found at $ISO_PATH"
    echo "Please edit this script and set the correct path to your loc-OS ISO"
    exit 1
fi

# Check if KVM is available on this Lubuntu system
KVM_FLAGS=""
if [ -e /dev/kvm ] && [ -w /dev/kvm ]; then
    echo "KVM acceleration enabled"
    KVM_FLAGS="-enable-kvm"
else
    echo "WARNING: KVM acceleration not available. VM will run slower."
    echo "To enable KVM, run: sudo apt install qemu-kvm"
    echo "and ensure your user is in the kvm group: sudo adduser $USER kvm"
fi

# Start the VM
echo "Starting loc-OS VM with $RAM_MB MB RAM and $CPU_CORES CPU cores..."
qemu-system-x86_64 \
    -name "$VM_NAME" \
    -m "$RAM_MB" \
    -smp "$CPU_CORES" \
    $KVM_FLAGS \
    -drive file="$DISK_IMG",format=qcow2 \
    -cdrom "$ISO_PATH" \
    -boot d \
    -device virtio-net,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::2222-:22

# Create a simple script to boot without the ISO after installation
cat > ./Tests_VM/boot-installed.sh << EOF
#!/bin/bash
qemu-system-x86_64 \\ 
    -name "$VM_NAME" \\
    -m $RAM_MB \\
    -smp $CPU_CORES \\
    $KVM_FLAGS \\
    -drive file="../$DISK_IMG",format=qcow2 \\
    -boot c \\
    -device virtio-net,netdev=net0 \\
    -netdev user,id=net0,hostfwd=tcp::2222-:22
EOF

echo "VM shutdown."
echo "To run the installed system (without ISO), use: ./boot-installed.sh"
