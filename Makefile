# Include the nanopb provided Makefile rules
# include ../../extra/nanopb.mk
	
mb_protocol_pb2.py: mb_protocol.proto
#	$(PROTOC) $(PROTOC_OPTS) --python_out=. simple.proto
	protoc --python_out=. mb_protocol.proto mb_protocol_answers.proto mb_protocol_commands.proto mb_protocol_enums.proto

all: mb_protocol_pb2.py

clean: 
	rm -f mb_protocol_pb2.py mb_protocol_answers_pb2.py mb_protocol_commands_pb2.py mb_protocol_enums_pb2.py
	echo Clean done
