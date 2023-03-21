import '../styles/App.css';
import { useContext, useEffect } from "react";
import { EmployeeContext } from "../context/Employee.js";
import { Routes, Route } from 'react-router-dom'
import NavBar from './NavBar';
import Homepage from './Homepage';
import Login from '../forms/Login';

function App() {
  const {setEmployee, employee} = useContext(EmployeeContext)
  console.log(employee)
  useEffect(() => {
    fetch("/me").then((resp) => {
      if (resp.ok) {
        resp.json().then((user) => setEmployee(user));
      }
    });
  }, [setEmployee]);

  return (
    <div className="App">
      <h1>Hello</h1>
      <NavBar />
      <Routes>
        <Route path="/" exact element={<Homepage />}/>
        {!!employee && (
        <Route path="/home" element={<Homepage/>}/>
        )}
        {!employee && (
        <Route path="/login" element={<Login />}/>
        )}
      </Routes>
      
    </div>
  );
}

export default App;
