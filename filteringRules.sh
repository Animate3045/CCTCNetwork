sudo iptables -L # by default, lists out the filter table 
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT ## both need to happen for incoming ssh

sudo iptables -A INPUT -p tcp --sport 22 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT ## both needed for outgoing ssh

sudo iptables -A INPUT -p tcp -m multiport --ports 6010,6011,6012 -j ACCEPT 
sudo iptables -A OUTPUT -p tcp -m multiport --ports 6010,6011,6012 -j ACCEPT ## X11 forwarding

sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP ##make sure you put the rules in before the drop policy, otherwise you're hung

##block to blue host 3
sudo iptables -I INPUT -s 172.16.82.112 -j DROP
sudo iptable -I OUTPUT -d 172.16.82.112 -j DROP

##allow traffic from DMZ
sudo iptables -A INPUT -s 172.16.40.10 -j ACCEPT
sudo iptables -A OUTPUT -d 172.16.40.10 -j ACCEPT

sudo nft add rule ip CCTC INPUT tcp sport {21-23, 80} accept
sudo nft add rule ip CCTC OUTPUT tcp dport {21-23, 80} accept

iptables -t mangle -A POSTROUTING -o eth0 -j TTL --ttl-set 128
iptables -t mangle -A POSTROUTING -o eth0 -j DSCP --set-dscp 26

##===============================================================##
#prep shutdown in case you fuck up
sudo shutdown -r 5
##===============================================================##
#cancel shutdown if it works
sudo shutdown -c
##===============================================================##
## on T1
#allow new and established traffic to/from via SSH (22) TELNET (23) and RDP (3389)

sudo iptables -A INPUT -p tcp -m multiport --ports 22,23,3389 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --ports 22,23,3389 -m state --state NEW,ESTABLISHED -j ACCEPT

sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP

sudo iptables -A INPUT -p tcp -m multiport --ports 80 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --ports 80 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p udp -m multiport --ports 4444,6579 -j ACCEPT
sudo iptables -A OUTPUT -p udp -m multiport --ports 4444,6579 -j ACCEPT
sudo iptables -A INPUT -p tcp -m multiport --ports 4444,6579 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --ports 4444,6579 -j ACCEPT
sudo iptables -A INPUT -s 10.10.0.40 -p icmp -m icmp --icmp-type 8 -j ACCEPT
sudo iptables -A OUTPUT -d 10.10.0.40 -p icmp -m icmp --icmp-type 0 -j ACCEPT
sudo iptables -A INPUT -s 10.10.0.40 -p icmp -m icmp --icmp-type 0 -j ACCEPT
sudo iptables -A OUTPUT -d 10.10.0.40 -p icmp -m icmp --icmp-type 8 -j ACCEPT






for i in {1..254}: do 


sudo iptables -A INPUT -p tcp -m multiport --ports 22,23,3389 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --ports 22,23,3389 -m state --state NEW,ESTABLISHED -j ACCEPT

sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP

sudo iptables -A INPUT -p tcp -m multiport --ports 80 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --ports 80 -m state --state NEW,ESTABLISHED -j ACCEPT
