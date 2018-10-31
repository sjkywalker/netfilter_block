all: netfilter_block

netfilter_block: netfilter_block.o
	g++ -g -o netfilter_block netfilter_block.o -lnetfilter_queue

netfilter_block.o:
	g++ -c -g -o netfilter_block.o main.cpp

clean:
	rm -r netfilter_block
	rm -r netfilter_block.o

