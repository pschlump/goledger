// OK++
// Catches and looks for a "revert" - if any other error occures then it will fail.
// Revert in this case is the expected retult.
export default async promise => {
	try {
		await promise;
	} catch (error) {
		const tankEmpty = error.message.search('out of gas') >= 0;
		const badCode = error.message.search('invalid opcode') >= 0;
		console.log ( "PJS 1 - error= ->"+error+"<-" );
		console.log ( "PJS 1 - revert="+revert );
		if ( (""+error) == "Error: VM Exception while processing transaction: revert" ) {
			// console.log ( "PJS 1 - early return - revert occured" )
		} else {
			assert(tankEmpty || badCode, "Expected revert error, got ->" + error + "<-.");
		}
		return;
	}
	assert.fail('Expected revert not caught.');
};
