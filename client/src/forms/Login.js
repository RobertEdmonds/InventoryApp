import React, { useState, useContext } from "react";
import { useNavigate } from "react-router-dom";
import { EmployeeContext } from "../context/Employee.js";


function Login(){
    const { setEmployee } = useContext(EmployeeContext);
    const [username, setUsername] = useState("")
    const [password, setPassword] = useState('')
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState([])
    const history = useNavigate()
    
    function handleSubmit(e) {
        e.preventDefault();
        setLoading(false);
        const dataForm = {
          username,
          password,
        };
        fetch("/login", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(dataForm),
        }).then((r) => {
          setLoading(false);
          if (r.ok) {
            r.json().then((user) => {
              setEmployee(user)
              history.push("/");
            });
            setUsername("");
            setPassword("");
          } else {
            r.json().then((err) => setError(err.errors));
          }
        });
      }
    return(
        <>
            <ul className="errorStyle">
            {error.map((err) => {
            return <li key={err}>{err}</li>;
            })}
            </ul>
            <form onSubmit={handleSubmit}>
                <div className="mb-3">
                    <label htmlFor="formGroupExampleInput" className="form-label">Example label</label>
                    <input 
                        type="text" 
                        className="form-control" 
                        id="formGroupExampleInput" 
                        placeholder="Example input placeholder" 
                        value={username}
                        onChange={e => setUsername(e.target.value.trim())} />
                </div>
                <div className="mb-3">
                    <label htmlFor="formGroupExampleInput2" className="form-label">Another label</label>
                    <input 
                        type="text" 
                        className="form-control" 
                        id="formGroupExampleInput2" 
                        placeholder="Another input placeholder"
                        value={password}
                        onChange={e => setPassword(e.target.value)}/>
                </div>
            </form>
            <button onClick={() => setLoading(!loading)}></button>
        </>
    )
}

export default Login;