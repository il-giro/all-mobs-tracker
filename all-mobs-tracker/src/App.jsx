import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { Analytics } from "@vercel/analytics/react"
import MobTracker from './pages/MobTracker'
import About from './pages/About'
import FAQ from './pages/FAQ'
import WhoAmI from './pages/WhoAmI'

import CategoryPage from './pages/categories/CategoryPage';

import MobPage from './pages/mobs/MobPage';

import './index.css'

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MobTracker />} />
        <Route path="/about" element={<About />} />
        <Route path="/faq" element={<FAQ />} />
        <Route path="/whoami" element={<WhoAmI />} />

        <Route path="/categories/:id" element={<CategoryPage />} />

        <Route path="/mobs/:slug" element={<MobPage />} />
      </Routes>
      <Analytics />
    </BrowserRouter>
  )
}

export default App