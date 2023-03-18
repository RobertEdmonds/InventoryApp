import '../styles/App.css';
import { Routes, Route } from 'react-router-dom'
import NavBar from './NavBar';
import Homepage from './Homepage';
import Login from '../forms/Login';

function App() {
  return (
    <div className="App">
      <h1>Hello</h1>
      <Login />
      <NavBar />
      <Routes>
        <Route path="/" element={<Homepage/>}/>
      </Routes>
    </div>
  );
}

export default App;
