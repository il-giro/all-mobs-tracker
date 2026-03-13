import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { Analytics } from "@vercel/analytics/react"
import MobTracker from './pages/MobTracker'
import About from './pages/About'
import FAQ from './pages/FAQ'
import WhoAmI from './pages/WhoAmI'
import CategoryPage from './pages/categories/CategoryPage';
import ShearablePage from './pages/categories/ShearablePage';
import './index.css'

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MobTracker />} />
        <Route path="/about" element={<About />} />
        <Route path="/faq" element={<FAQ />} />
        <Route path="/whoami" element={<WhoAmI />} />
        <Route path="/categories/shearable" element={<ShearablePage />} />
        <Route path="/categories/:id" element={<CategoryPage />} />
      </Routes>
      <Analytics />
    </BrowserRouter>
  )
}

export default App