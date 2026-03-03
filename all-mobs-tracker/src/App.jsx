import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { Analytics } from "@vercel/analytics/react"
import MobTracker from './components/MobTracker'
import About from './pages/About'
import './index.css'

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MobTracker />} />
        <Route path="/about" element={<About />} />
      </Routes>
      <Analytics />
    </BrowserRouter>
  )
}

export default App