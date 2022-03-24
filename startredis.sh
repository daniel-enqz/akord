redis-cli shutdown
echo "Previous redis-server closed✅" | lolcat

redis-server
echo "New redis-server open✅" | lolcat
