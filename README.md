Lonely Planet CouchDB tools
===========================

Just a bunch of useful scripts the [dev/ops team](http://lplabs.com) at [Lonely Planet](http://www.lonelyplanet.com) find useful for deploying and doing sysadmin type tasks on our CouchDB servers. Who knows, maybe someone else might find them useful as well.

Any issues, or feedback hit up [Julian Doherty](mailto:julian.doherty@lonelyplanet.com.au)/[@madlep](http://twitter.com/madlep)

Heres the goodies you get:

 * `add_couch_user` - Prompts you for a server username/password, then allows you to add other users. Basically automates what [the security page](http://wiki.apache.org/couchdb/Security_Features_Overview) describes for setting up user security.
 * `compact_couch` - For a given server URL, runs database compaction for all databases, runs view compaction for all design docs in all databases, and runs view cleanup for all databases.
 * `replicate_couch` - triggers push replication between local source and remote target server for multiple DBs.
 
user/passwords can be configured in a separate .yml file which can be secured separately and only exposed to the user that runs the script (to keep the paranoid ops folks happy)