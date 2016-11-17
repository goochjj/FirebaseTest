component{

	this.name 					 = "Firebasetest";
	this.mappings[ "/FirebaseTest" ] = getDirectoryFromPath( getCurrentTemplatePath() );
	this.mappings[ "/javaloader" ]   = getDirectoryFromPath( getCurrentTemplatePath()&"/JavaLoader/javaloader" );
	/*this.javaSettings 			 = { loadPaths = [ "/FirebaseTest/lib" ] };*/
	this.applicationTimeout		 = createTimeSpan( 0, 1, 0, 0 );

	function onApplicationStart(){
	  var loadPaths = DirectoryList(ExpandPath("./lib/"), "no", "path", "*.jar");
          arrayAppend(loadPaths, ExpandPath("./JavaLoader/support/cfcdynamicproxy/lib/cfcdynamicproxy.jar"));

          Application.loader = createObject("component", "javaloader.JavaLoader").init(loadPaths, true);
          var accountKey = createobject("java", "java.io.FileInputStream").init(ExpandPath("/FirebaseTest/serviceAccountKey.json"));
          var options = Application.loader.create("com.google.firebase.FirebaseOptions$Builder").init().setServiceAccount(accountKey).setDatabaseUrl("https://mydb.firebaseio.com/").build();

          Application.firebaseApp = Application.loader.create("com.google.firebase.FirebaseApp").initializeApp(options);
          Application.announcements = Application.loader.create("com.google.firebase.database.FirebaseDatabase").getInstance().getReference("announcements");
	  Application.CFCProxy = Application.loader.create("com.compoundtheory.coldfusion.cfc.CFCDynamicProxy");
	  Application.AnnouncementsData = new ValueEventListener();
	  var delegate = Application.CFCProxy.createInstance( Application.AnnouncementsData, [ "com.google.firebase.database.ValueEventListener" ] );
          Application.announcements.addListenerForSingleValueEvent(delegate);


		return true;
	}

	function onAplicationStop(){
	}

	function onRequestStart( required targetPage ){

		if( structKeyExists( url, "reinit" ) ){ onApplicationStart(); }

		return true;
	}

}
