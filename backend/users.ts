import * as express from 'express'
import { PrismaClient } from '@prisma/client'
import {v4 as uuidv4} from 'uuid'
import * as moment from 'moment'


const userRouter = express.Router()
const prisma = new PrismaClient()


userRouter.get('/', async(req,res)=>{

    const allUsers = await prisma.users.findMany()

    res.status(200).json({'all users': allUsers})
})

userRouter.post('/create', async(req,res)=>{

    const userId = uuidv4()
    const userData = req.body.user
    const datenow = moment().toISOString()


   const createdUser = await prisma.users.create({
        data:{
            user_id:userId,
            email_address:userData.emailAddress,
            username:userData.username,
            password:userData.password,
            actived:false,
            signup_date:datenow,
        }
    })

    res.status(200).json({"all users":createdUser})
})



export default userRouter
