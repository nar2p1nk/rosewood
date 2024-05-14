import express from 'express';
import userRouter from './users'

const app:any = express()

app.get('/',(req:any, res:any)=>{
    res.status(200).json({"status":"Hello World"})
})

app.use('/',
        userRouter
       )

export default app;
