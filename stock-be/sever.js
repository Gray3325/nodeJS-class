const express=require('express');

const app = express();
app.get('/',(request,respons)=>{
    respons.send('Hollow Express!')
});
app.listen(3001,()=>{
    console.log('伺服器在3001運作中');
});