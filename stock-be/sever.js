
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
    //從前端拿到目前是要第幾頁,預設要是在第一頁,用或的邏輯就可以達到預設值
    const page =req.query.page || 1;
    // 總筆數？
    let [results]=await pool.execute('SELECT COUNT(*) AS total FROM stock_prices WHERE stock_id=?',[req.params.stockId]);
    const total =results[0].total;
    // 共幾頁
    const perPage=5;
    const totalPage=Math.ceil(total / perPage);
    //  計算 offset, limit (一頁有幾筆)
    const limit =perPage;
    const offset =perPage*(page-1);
    // TODO: 根據 offset, limit 去取得資料
    let [data] =await pool.execute('SELECT * FROM stock_prices WHERE stock_id=? ORDER BY date ')
    // TODO: 把資料回覆給前端
    res.json({
        pagination:{
            perPage,
            totalPages,
            page,
        },
        data
    })
    // 會用 prepared statement 的方式來避免發生 sql injection
    // pool.query vs pool.execute
    // let [data] = await pool.execute('SELECT * FROM stock_prices WHERE stock_id=?', [req.params.stockId]);
    // res.json(data);

    let [data] = await pool.query("SELECT * FROM stocks_prices WHERE stock_id=?",[req.params.stockId]);
    console.log("這是api/stocks");
    res.json(data);
})
// 完成insert

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
