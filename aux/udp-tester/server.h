void server() {
    /* build address data structure */
    bzero((char *)&sock_in, sizeof(sock_in));
    sock_in.sin_family = AF_INET;
    sock_in.sin_addr.s_addr = INADDR_ANY;
    sock_in.sin_port = htons(port_number);

    /* setup passive open */
    if ((s = socket(PF_INET, SOCK_DGRAM, 0)) < 0){
        perror("./server: socket");exit(1);
    }
    if ((bind(s, (struct sockaddr *)&sock_in, sizeof(sock_in))) < 0){
        perror("./server: bind");exit(1);
    }

    /* wait for connection, then receive and print text */
    int rx_pkt_count = 0, seconds, size;
    struct timespec tstamp_i, tstamp_f;
    long nanoseconds;
    double time_span, bitrate, pktrate;
    printf("size_bytes,\tpkt_count,\ttime[s],\tbitrate[kbps],\tpktrate[kpps]\n");
    while(1) {
        if (len = recv(s, buf, sizeof(buf), 0)){
            clock_gettime(CLOCK_MONOTONIC, &tstamp_f);
            if(rx_pkt_count == 0){
                tstamp_i.tv_sec = tstamp_f.tv_sec;tstamp_i.tv_nsec = tstamp_f.tv_nsec;
                printf("\n");
            }
            rx_pkt_count++;
            /*-----------|#: 0 rem  |----------------*/
            if(buf[0] == '#' && buf[1] == ':' && buf[2] == ' ' && buf[3] == '0' && buf[4] == ' '){
                /* reached the end, stop */
                seconds     = tstamp_f.tv_sec - tstamp_i.tv_sec;
                nanoseconds = tstamp_f.tv_nsec - tstamp_i.tv_nsec;
                if(nanoseconds < 0)
                    seconds--;nanoseconds += 1e9;
                time_span = seconds + 1e-9*nanoseconds;
                size = 43+(int)strlen(buf);
                bitrate = (double)size*8*rx_pkt_count/(time_span*1000); /*bitrate in kbps*/
                pktrate = (double)rx_pkt_count/(time_span*1000); /*pktrate in kpps*/
                printf("%10d,\t%9d,%3d.%ld,\t%13lf,\t%13lf\n",size ,rx_pkt_count, seconds, nanoseconds, bitrate, pktrate);
                rx_pkt_count = 0;
            }
        }
    }
}
