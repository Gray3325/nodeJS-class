//Promise練習
let a = new Promise(function(resolve,reject){
    setTimeout(function(){
        resolve('洗臉');
    },1000);
});

a.then()