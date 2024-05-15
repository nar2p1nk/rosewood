import * as express from 'express'

const userRouter = express.Router()

userRouter.get('/all', (req,res)=>{
    res.status(200).json({"all users":"none yet"})
})

export default userRouter
