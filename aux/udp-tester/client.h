void client(){
    /* translate host name into peer's IP address */
    hp = gethostbyname(host);
    if (!hp) {
        fprintf(stderr, "./client: unknown host: %s\n", host);
        exit(1);
    }
    /* build address data structure */
    bzero((char *)&sock_in, sizeof(sock_in));
    sock_in.sin_family = AF_INET;
    bcopy(hp->h_addr, (char *)&sock_in.sin_addr, hp->h_length);
    sock_in.sin_port = htons(port_number);
    /* active open */
    if ((s = socket(PF_INET, SOCK_DGRAM, 0)) < 0) {
        perror("./client: socket");
        exit(1);
    }
    if (connect(s, (struct sockaddr *)&sock_in, sizeof(sock_in)) < 0) {
        perror("./client: connect");
        close(s);
        exit(1);
    }
    char format[10];
    sprintf(format, "%s%ds", "%-", packet_len-1);/* format: %-10s */

    struct timespec T;
    double frac, intgr, interval;
    long prog_time_correction;
    prog_time_correction = 152293;   /* hand calc. using wireshark data */

    if(pkt_mode){
        interval = (double) 8*(packet_len+42)*no_of_packets/(1e6*tgt_bw*(no_of_packets-1));
    }else{
        no_of_packets = (int) tgt_bw*1e6*time_limit/(8*(packet_len+42));
        interval = (double) time_limit/(no_of_packets - 1);
    }

    frac =modf(interval, &intgr);
    frac = frac*1e9;
    T.tv_sec = (long) intgr;
    T.tv_nsec = (long) frac - prog_time_correction;
    T.tv_nsec = (long) frac;
    // T.tv_sec = 0;T.tv_nsec = 0;
    printf("Req. Interval = %f sec\n", interval);
    printf("Sleeping %ld.%09ld sec, every packet\n", T.tv_sec, T.tv_nsec);
    printf("Sending %d # of pkts\n", no_of_packets);

    no_of_packets--;
    sprintf(buf, "#:!0 rem");
    sprintf(buf, format , buf);
    sprintf(buf_aux, "#: 0 rem");
    sprintf(buf_aux, format , buf_aux);
    buf[MAX_LINE-1] = '\0';
    buf_aux[MAX_LINE-1] = '\0';
    len = strlen(buf) + 1;
    send(s, buf, len, 0);
    while (no_of_packets-- > 1) {
        nanosleep(&T, NULL);
        send(s, buf, len, 0);
    }
    send(s, buf_aux, len, 0);
}
