import * as request from 'supertest'
import app from '../main'



describe('test the root path', ()=>{
    test("root path should exist if server is running", () =>{
        return request(app)
        .get('/')
        .expect(200)
        /*.then(response =>{
            expect(response.statusCode).toBe(200)
        })*/
    })
})
