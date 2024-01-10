import express from 'express'
import reportRouter from './routes/report.route.js'
import morgan from 'morgan'

const app=express()

app.use(morgan('dev'))
app.use(express.json())
app.use(express.urlencoded({extended:false}))

app.use('/api/report',reportRouter)

export default app