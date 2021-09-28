///@param socket the player socket to send the data
///@param datatype the type of data being sent. (ex. buffer_u8)
///@param data the data being sent that works with the data type.
///@param ... ...
function net_write_client() {

	//Finds the start of the buffer.
	buffer_seek(global.sbuffer,buffer_seek_start,0);

	//Writes the given data to the buffer.
	var ac = argument_count;
	var a;
	for (a=1;a<ac;a+=2){
		var ab = a+1;
		buffer_write(global.sbuffer,argument[a],argument[ab]);
	}

	//Sends the data to the client.
	network_send_packet(argument[0],global.sbuffer,buffer_tell(global.sbuffer));
}
