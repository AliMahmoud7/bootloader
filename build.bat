nasm MyBootLoader.asm -f bin -o ./boot.bin


dd if=./boot.bin bs=512 of=./bootimage.ima