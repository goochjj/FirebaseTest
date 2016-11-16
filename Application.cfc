component{

	this.name 					 = "Firebasetest";
	this.mappings[ "/FirebaseTest" ] = getDirectoryFromPath( getCurrentTemplatePath() );
	this.mappings[ "/javaloader" ]   = getDirectoryFromPath( getCurrentTemplatePath()&"/JavaLoader/javaloader" );
	/*this.javaSettings 			 = { loadPaths = [ "/FirebaseTest/lib" ] };*/
	this.applicationTimeout		 = createTimeSpan( 0, 1, 0, 0 );

	function onApplicationStart(){


		return true;
	}

	function onAplicationStop(){
	}

	function onRequestStart( required targetPage ){

		if( structKeyExists( url, "reinit" ) ){ onApplicationStart(); }

		return true;
	}

}
