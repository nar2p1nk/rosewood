import * as express from 'express';
import userRouter from './users'

const app:any = express()

app.use(express.json())
app.use(express.urlencoded(({
    extended:true
})))


app.get('/',(req:any, res:any)=>{
    res.status(200).json({"status":"Hello World"})
})

app.use('/user', userRouter)

export default app;
