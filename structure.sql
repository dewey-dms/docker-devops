

create 'dewey_users' , 'description' , 'params', 'history'
create 'dewey_files' , 'description' , 'params', 'history'


create external table dewey_users (
key string,
login string,
name string,
surname string,
is_add  boolean,
is_change boolean,
is_delete boolean,
operation_date timestamp
)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' 
WITH SERDEPROPERTIES 
("hbase.columns.mapping" =":key,description:login,description:name,description:surname,params:is_add, params:is_change, params:is_delete,history:operation_date")
TBLPROPERTIES("hbase.table.name" = "dewey_users")


create external table dewey_files (
key string,
filename string,
extension string,
parent string,
is_add boolean,
is_change boolean,
is_delete boolean,
is_clone boolean,
operation_date timestamp
)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' 
WITH SERDEPROPERTIES 
("hbase.columns.mapping" =":key,description:filename,description:extension,params:parent, params:is_add, params:is_change,params:is_delete,params:is_clone, history:operation_date")
TBLPROPERTIES("hbase.table.name" = "dewey_files")


