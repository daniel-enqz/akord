redis-cli shutdown
echo "Previous redis-server closed✅"
read -p 'ENTER to create redis-server---> ' upstreamVar

redis-server
echo "New redis-server open✅"

x-terminal-emulator
