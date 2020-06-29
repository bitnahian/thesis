create table t(id int primary key, a int, b int, key(a));
create table ct(a int, b int, key(a) using clustered columnstore, shard key(a));

explain select * from t,ct where t.id = ct.b;