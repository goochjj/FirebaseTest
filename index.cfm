<cfscript>
 loadPaths = DirectoryList(ExpandPath("/FirebaseTest/lib/"), "no", "path", "*.jar");
 jl = createObject("component", "javaloader.JavaLoader").init(loadPaths);
 accountKey = createobject("java", "java.io.FileInputStream").init(ExpandPath("/FirebaseTest/serviceAccountKey.json"));
 options = jl.create("com.google.firebase.FirebaseOptions$Builder").init().setServiceAccount(accountKey).setDatabaseUrl("wss://developer-api.nest.com").build();

 jl.create("com.google.firebase.FirebaseApp").initializeApp(options);
</cfscript>
