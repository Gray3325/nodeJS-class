const mysql2 = require('mysql2/promise');
// let dotenv=require('dotenv');
require('dotenv').config;
(async()=>{
    let connection;
    try{
        connection = await mysql2.createConnection({
        host:process.env.DB_host,
        // port:DB_port,
        user:process.env.DB_user,
        password:process.env.DB_password,
        database:process.env.DB_database,
    });

    let [data,fields]=await connection.query('SELECT * FROM `stocks`');
    // let data=result[0];
    console.log(data);
    }catch(e){
        console.error(e);
    }finally{
        if(connection){
            connection.end();
        }
    }
})();
