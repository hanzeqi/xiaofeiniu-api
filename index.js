/**
 * 小肥牛扫码点餐项目API子系统
 * 
 */
const port=8090;
const express=require('express');
const cors=require('cors');
const bodyParser=require('body-parser')
const categoryRouter=require('./routes/admin/category')
// 启动主服务器
var app=express()
app.listen(port,()=>{
    console.log("Server Listening"+port+"……");
    console.log(new Date().toLocaleString());
}); 
//cors
app.use(cors());
//body-parser
// app.use(bodyParser.urlencoded({}))  //把application/x-www-form-urlencoded格式的请求主体数据解析出来放入req.body属性
app.use(bodyParser.json());//把json格式的请求主体数据解析出来放入req.body属性

//挂载路由器
app.use('/admin/category',categoryRouter)