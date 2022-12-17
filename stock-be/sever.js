const express=require('express');

const app = express();
// 中間件
app.use((req,res,next)=>{
    console.log('這裡是一個中間件0');
    next();
});
app.use((req,res,next)=>{
    console.log('這裡是一個中間件1');
    next();
});


app.get('/',(request,respons)=>{
    respons.send('Hollow Express!')
    console.log('這是首夜夜夜');
});
app.get('/',(req,res,next)=>{
    console.log('這裡是一個中間件2');
    res.send('Kollow Text');
});
app.listen(3001,()=>{
    console.log('伺服器在3001運作中');
});