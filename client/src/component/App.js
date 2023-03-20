import React from 'react';
import '../styles/App.css';

import { Routes, Route } from 'react-router-dom'
import NavBar from './NavBar';
import Homepage from './Homepage';
import Login from '../forms/Login';

function App() {

  return (
    <div className="App">
      <h1>Hello</h1>
      <NavBar />
      <Routes>
        <Route path="/" exact element={<Homepage/>}/>
        <Route path="/login" element={<Login />}/>
      </Routes>
      
    </div>
  );
}

export default App;
