const express=require('express');

const app = express();
// 中間件
app.use((req,res,next)=>{
    console.log('這裡是一個中間件 A');
    req.mfee31='冷班';
    next();
});
app.use((req,res,next)=>{
    console.log('這裡是一個中間件 B');
    req.dt = new Date().toISOString();
    next();
});

// 路由中間件
app.get('/',(req,res,next)=>{
    console.log('這是首夜夜夜',req.mfeel31,req.dt);
    res.send('Hellow Express 9');
});
app.use((req, res, next) => {
    console.log('這裡是的一個中間件 C');
    next();
  });

app.get('/test',(req,res,next)=>{
    console.log('這是test頁面',req.dt);
    res.send('Hellow Test');
});
app.use((req,res,next)=>{
    console.log('這是404頁面');
    res.send('沒有頁面');
});
app.listen(3001,()=>{
    console.log('伺服器在3001運作中');
});