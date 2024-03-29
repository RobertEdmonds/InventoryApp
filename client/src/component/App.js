import '../styles/App.css';
import { useContext, useEffect } from "react";
import { EmployeeContext } from "../context/Employee.js";
import { Routes, Route, useNavigate } from 'react-router-dom'
import NavBar from './NavBar';
import Homepage from './Homepage';
import Login from '../forms/Login';
import Product from './Product';
import CustPage from './CustPage';
// import ShowProduct from './ShowProduct';

function App() {
  const {setEmployee, employee} = useContext(EmployeeContext)
  const navigate = useNavigate()
  
  useEffect(() => {
    fetch("/me").then((resp) => {
      if (resp.ok) {
        resp.json().then((user) => setEmployee(user));
      }
    });
  }, [setEmployee, navigate]);

  return (
    <div className="App">
      <h1>Hello</h1>
      <NavBar />
      <Routes>
        <Route path="/" element={<Homepage/>}/>
        <Route path='/tile' element={<Product />}/>
        <Route path='/customer' element={<CustPage />}/>
        {!employee && (
        <Route path="/login" element={<Login />}/>
        )}
      </Routes>
      
    </div>
  );
}

export default App;
