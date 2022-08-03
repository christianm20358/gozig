# Go Zig Building
This is a work in progress project aimed at using the Zig build system
to provide interoperability (and ideally cross-compilability) between 
C, Zig, and Go code. 

*Go Build Command*
```
go build -buildmode=c-shared -ldflags="-s -w" -o ./src/go-c.o ./src/main.go
```

*Zig Build Command*
```
zig build
```

After the commands are complete Zig should output an executable to zig-out/bin/gozig.

Currently the executable requires copies of the go object file in the lib, src, and project root folders. Once the object files have been copied to those folders the executable will be able to run the go code.