#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <stdlib.h>
#include <strings.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <math.h>
#include <stdbool.h>

#define SERVER_PORT 5432
#define MAX_LINE 256

struct hostent *hp;
struct sockaddr_in sock_in;
char *host;
char buf[MAX_LINE], buf_aux[MAX_LINE];
int s, len, packet_len, no_of_packets, tgt_bw, time_limit, port_number=SERVER_PORT;
bool pkt_mode = false;
#include "client.h"
#include "server.h"

int main(int argc, char * argv[]){
    int opt;
    bool isclient = false, isserver = false;
    char *help_txt = "l: length\t[22]\nb: target bandwidth in mbps\t[10]\nt: time in sec\t[10]\n"
    "s: use as a server\nc: use as client, pass server ip\t[localhost]\nk: packet count\t[100]\np: server port number (used in both modes)\t[5432]\nh: display help\n";
    if(argc == 1){
        printf("%s", help_txt);
    }
    while((opt = getopt(argc, argv, ":l:b:t:sc:k:p:h")) != -1){
        switch(opt){
            case 'l':
                packet_len = atoi(optarg);
                /* printf("length: %s\n", optarg); */break;
            case 'b':
                tgt_bw = atoi(optarg);
                /* printf("bandwidth: %s\n", optarg); */break;
            case 't':
                time_limit = atoi(optarg);
                /* printf("time: %s\n", optarg); */break;
            case 's':
                isserver = true;
                /* printf("-- SERVER --\n"); */break;
            case 'c':
                host = optarg;
                isclient = true;
                /* printf("server IP: %s\n", optarg); */break;
            case 'k':
                pkt_mode = true;
                no_of_packets = atoi(optarg);
                /* printf("packet count: %s\n", optarg); */break;
            case 'p':
                port_number = atoi(optarg);break;
            case ':':
                printf("option(%c) needs a value\n", opt);
            case 'h':
                printf("\n%s", help_txt);break;
            case '?':
                printf("unknown option: %c\n", optopt);break;
        }
    }
    if(isclient && !isserver)
        client();
    else if(!isclient && isserver)
        server();
    else if(!isclient && !isserver)
        printf("Please choose either server or client\n");
    else
        printf("Both client and server cant be started at same time\n");
    return 0;
}
