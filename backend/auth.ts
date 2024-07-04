import * as passport from 'passport'
//import {Strategy as LocalStrategy} from 'passport-local'
const LocalStrategy = require('passport-local').Strategy
import { PrismaClient } from "@prisma/client";
import * as bcrypt from 'bcrypt'
const prisma = new PrismaClient()


// configure the local passport Strategy
passport.use(new LocalStrategy(
    {
        usernameField:'username',
        passwordField:'password'
    },
    async function verify(username:string,password:string,cb:Function){
    try{
    // find user by username
    const user = await prisma.users.findFirst({where:{username:username}})
    // auth username
    if(!user){
        console.log('no user found');
        return cb(null,false,{message:'no user found'})

    }
    //auth passport
    const validate = bcrypt.compareSync(password,user.password)
        if(!validate){
            console.log('password wrong',validate)
            return cb(null,false,{message:'password is wrong'})
        }
    
    return cb(null,user)
    }
    catch(err){console.log(err);return cb(err)}
}))


//serialize user into session
passport.serializeUser((user:any,cb)=>{
    process.nextTick(()=>{
        return cb(null,{
            id:user.user_id,
            username:user.username,
            email:user.email,
            actived:user.actived
        })
    })
})


//deserialize user out of session(or something, idk)
passport.deserializeUser(function(user, cb) {
  process.nextTick(function() {
    return cb(null, user);
  });
});


