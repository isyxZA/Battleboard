///@param datatype the type of data being sent. (ex. buffer_u8)
///@param data the data being sent that works with the data type.
///@param ... ...
function net_write_server() {

	//Finds the start of the buffer.
	buffer_seek(global.cbuffer,buffer_seek_start,0);

	//Writes the given data to the buffer.
	var ac = argument_count;
	var a;
	for (a=0;a<ac;a+=2){
		var ab = a+1;
		buffer_write(global.cbuffer,argument[a],argument[ab]);
	}

	//Sends the data to the server.
	network_send_packet(global.clientSocket,global.cbuffer,buffer_tell(global.cbuffer));
}
