import * as express from 'express';
import userRouter from './users'
import * as expressSession from 'express-session'
import { PrismaSessionStore } from '@quixo3/prisma-session-store';
import {PrismaClient} from '@prisma/client';

const app:any = express()


// use json 
app.use(express.json())
app.use(express.urlencoded(({
    extended:true
})))

// use express-session
app.use(expressSession(
    {
        secret:'super duper cutie',
        cookie:{maxAge: 1000 * 60 * 60 * 60 * 8 },
        resave:false,
        saveUninitialized:true,
        store: new PrismaSessionStore(
            new PrismaClient(),
            {
            checkPeriod: 2 * 60 * 1000,  //ms
            dbRecordIdIsSessionId: true,
            dbRecordIdFunction: undefined,
            }
        )
    }
))


app.get('/',(req:any, res:any)=>{
    res.status(200).json({"status":"Hello World"})
    console.log(req.session)
})

app.use('/user', userRouter)

export default app;
