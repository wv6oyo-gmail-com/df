df - Dave's Forth is my port of jonesforth to the TI lm3s6965. Lots of
     the colon words are taken from C. H. Ting's "Inside F83" and
     eforth code found on the WWW.

     I've left most of jones's comment in the source code. Who ever
     Jones is, he wrote a very nice treatise on the workings of
     forth. Understanding forth should make anybody a better
     programmer. 




testing with qemu
-----------------

qemu-system-arm -M lm3s6965evb -kernel df.axf -nographic 

qemu-system-arm -M lm3s6965evb -kernel df.axf -nographic -s -S

