import { Analytics } from "@vercel/analytics/react";
import MobTracker from './components/MobTracker'
import './index.css'

function App() {
  return (
    <>
      <MobTracker />
      <Analytics />
    </>
  )
}

export default App;