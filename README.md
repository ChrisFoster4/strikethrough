The equivalent of https://saijogeorge.com/strikethrough-text-generator/ written in x86-64 NASM  

Requires a 64 bit x86-64 CPU and a Linux based OS   

Dependencies:  
nasm, GNU ld and GNU make  
Install on Debian based systems with:  
```
sudo apt update && sudo apt install -y nasm binutils make
```

To build run:  
```
make build
```
  
To run:  
```
./strikethough
```
Then type your string and press enter
