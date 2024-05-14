import * as express from 'express'

const app:any = express()

app.get('/',(req:any, res:any)=>{
    res.status(200).json({"status":"Hello World"})
})

export default app;
