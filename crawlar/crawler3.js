// axios await 版本
// 把 query string 抽出來當變數，用 params 的方式去設定

const axios = require('axios');
const fs = require('fs/promises');

let p = new Promise((resolve, reject) => {
    // error-first callback
    fs.readFile('readFile.txt', 'utf-8', (err, data) => {
        if (err) {
            // 如果 err 有值，表示有錯誤發生
            // 這裡應該要處理錯誤
            reject(err);
            // console.error('發生錯誤了', err);
        } else {
            // 進來這裡，表示 err 是空的 (可能是 null)
            resolve(data);
            // console.log('成功讀到資料:', data);
        }
    });
});

(async () => {
  try {
    let dataFile = await p;
    console.log(dataFile);
    let response = await axios.get(`http://54.71.133.152:3000/stocks`, {
      params: {
        stockNo:dataFile,
        date:'202211',
        // date,
      },
    });

    console.log('await', response.data);
  } catch (e) {
    console.error(e);
  }
})();