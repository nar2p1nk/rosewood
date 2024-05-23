import * as express from 'express'
import { PrismaClient } from '@prisma/client'
import {v4 as uuidv4} from 'uuid'
import * as moment from 'moment'


const userRouter = express.Router()
const prisma = new PrismaClient()

// get all users

userRouter.get('/', async(req,res)=>{

    const allUsers = await prisma.users.findMany()

    res.status(200).json({'all users': allUsers})
})

// find specific user by username

userRouter.get('/find',async(req,res)=>{
    const singleUser = await prisma.users.findFirst(({
        where:{username:req.body.username}
    }))
    res.status(200).json({"user":singleUser})
})

// create user

userRouter.post('/create', async(req,res)=>{

    // get data from json api
    const userData = req.body.user

    //check if username or email already exist

    if(await prisma.users.findFirst({where:{email_address:userData.emailAddress}}) != null){
        res.status(400).json({"err":"email is already in use"})
        }

    else if (await prisma.users.findFirst({where:{username:userData.username}}) != null){
        res.status(400).json({'err':'username is already taken'})
    }

    // create new user

    else{
        const userId = uuidv4()
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

        res.status(200).json({"status":"user created", "user":createdUser})
    }
})



export default userRouter
