const express = require("express");

const app = express();

const mysql2 = require('mysql2/promise');
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
// 中間件
app.use((req, res, next) => {
    console.log("這裡是一個中間件 A");
    req.mfee31 = "冷班";
    next();
});
app.use((req, res, next) => {
    console.log("這裡是一個中間件 B");
    req.dt = new Date().toISOString();
    next();
});

// 路由中間件
app.get("/", (req, res, next) => {
    console.log("這是首夜夜夜", req.mfeel31, req.dt);
    res.send("Hellow Express 9");
});

// localhost:3001/
// app.use(express.static('./static'));
// localhost:3001/2048/
// 設定 express 處理靜態檔案
// -> express 內建 -> 不需要安裝任何東西
app.use("/2048", express.static("./2048"));
app.use((req, res, next) => {
    console.log("這裡是的一個中間件 C");
    next();
});
app.get("/api", (req, res, next) => {
    res.json({
        name: 333,
        body: "balballb",
    });
});

app.get("/test", (req, res, next) => {
    console.log("這是test頁面", req.dt);
    res.send("Hellow Test");
});
app.use((req, res, next) => {
    console.log("這是404頁面");
    res.send("沒有頁面");
});
app.listen(3001, () => {
    console.log("伺服器在3001運作中");
});
