const mysql=require('mysql');

var pool=mysql.createPool({
    host:'127.0.0.1:8090',
    port:3306,
    name:'root',
    password:'',
    connectionLimit:15
})

module.exports=pool;