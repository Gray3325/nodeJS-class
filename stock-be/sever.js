
const express = require("express");
const app = express();

require("dotenv").config();
const mysql2 = require("mysql2/promise");

console.log('check env', process.env.DB_USER);
let pool = mysql2.createPool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    // 限制pool連線數的上限
    connectionLimit: 10,
});

// 允許跨源存取
// 預設是全部開放
// 也可以做部分限制，參考 npm cors 的文件
const cors = require('cors');
app.use(cors());

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
// 中間件
app.use((req, res, next) => {
    console.log("這裡是一個中間件 A");
    req.mfeel31 = "冷班";
    next();
});
app.use((req, res, next) => {
    console.log("這裡是一個中間件 B");
    req.dt = new Date().toISOString();
    next();
});

// 路由中間件
// get, post, put, patch, delete, option, head
app.get("/", (req, res, next) => {
    console.log("這是首夜夜夜", req.mfeel31, req.dt);
    res.send("Hellow Express 9");
});

app.get("/api", (req, res, next) => {
    res.json({
        name: 333,
        body: "balballb",
    });
});
app.get("/api/stocks", async (req, res, next) => {
    // let results = await connection.query('SELECT * FROM stocks');
    // let data = results[0];
    let [data] = await pool.query("SELECT * FROM stocks");
    console.log("這是api/stocks");
    res.json(data);
});
app.get('/api/stock/:stockId',async(req,res,next)=>{
    console.log(req.params.stockId);
    let [data] = await pool.query("SELECT * FROM stocks_prices WHERE stock_id=?",req.params.stockId);
    console.log("這是api/stocks");
    res.json(data);
})
// TODO:完成insert

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
