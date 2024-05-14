import express from 'express'

const app = express()

console.log(typeof app)

const port:Number = 8080

app.get('/',(req:any, res:any)=>{
    res.json({"status":"Hello World"})
})

app.listen(port,()=>{
    console.log(`app listening on port ${port}`);
    
})
