# Include the nanopb provided Makefile rules
# include ../../extra/nanopb.mk


# Build rule for the protocol
simple.pb.c: simple.proto
#	$(PROTOC) $(PROTOC_OPTS) --nanopb_out=. simple.proto
	protoc --nanopb_out=. simple.proto
	
simple_pb3.py: simple.proto
#	$(PROTOC) $(PROTOC_OPTS) --python_out=. simple.proto
	protoc --python_out=. simple.proto
	
all: simple.pb.c simple_pb2.py

clean: 
	rm -f simple simple_pb2.py simple.pb.c simple.pb.h
	echo Clean done
