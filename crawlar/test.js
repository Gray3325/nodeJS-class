const mysql2 = require('mysql2/promise');
(async()=>{
    const connection = await mysql2.createConnection({
        host:'127.0.0.1',
        // port:0080,
        user:'admin',
        password:'',
        database:'stock_mfee31'
    });

    let [data,field]=await connection.query('SELECT * FROM `stocks`');
    // let data=result[0];
    console.log(data);

    connection.end();
})();