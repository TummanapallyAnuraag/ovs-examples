# IPERF like tool for generating UDP packets

> Written in C

## Images:

[wireshark](docs/wireshark.png)

[server](docs/server.png)

[client](docs/client.png)

## Usage:

- ./udp-tester

```
l: length	[22]
b: target bandwidth in mbps	[10]
t: time in sec	[10]
s: use as a server
c: use as client, pass server ip	[localhost]
k: packet count	[100]
p: server port number (used in both modes)	[5432]
h: display help
Please choose either server or client
```

- As a Server (similar to IPERF UDP SERVER)

```
./udp-tester -s 
```

- As a client (similar to IPERF UDP CLIENT), where server ip is `127.0.0.1`, UDP packet length is `22+42 = 64`, target bandwidth of `1 Mbps` and for a duration of `5 sec`

```
./udp-tester -c 127.0.0.1 -l 22 -b 1 -t 5
```


