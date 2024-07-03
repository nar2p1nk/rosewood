import * as passport from 'passport'
//import {Strategy as LocalStrategy} from 'passport-local'
const LocalStrategy = require('passport-local').Strategy
import { PrismaClient } from "@prisma/client";
import * as bcrypt from 'bcrypt'
const prisma = new PrismaClient()

passport.use(new LocalStrategy(
    {
        usernameField:'username',
        passwordField:'password'
    },
    async (username:string,password:string,cb:Function)=>{
    try{
    // find user by username
    const user = await prisma.users.findFirst({where:{username:username}})
    console.log(username,user,user)
    // auth username
    if(!user){
        console.log('no user found');
        return cb(null,false,{message:'messiah has ruturend'})

    }
    //auth passport
    console.log('owage',password)
    const validate = bcrypt.compareSync(password,user.password)
        if(!validate){
            console.log('password wrong',validate)
            return cb(null,false,{message:'password is wrong'})
        }
    
    return cb(null,user)
    }
    catch(err){console.log(err);return cb(err)}
}))
