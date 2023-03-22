import { useContext, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { EmployeeContext } from "../context/Employee.js";

function Homepage(){
    const { setEmployee, employee } = useContext(EmployeeContext)
    const navigate = useNavigate()

    useEffect(() => {
        if(!employee){
            navigate("/login")
        }
    },[navigate, employee])
    
    function handleLogout() {
        fetch("/logout", { method: "DELETE" }).then((r) => {
          if (r.ok) {
            setEmployee(null);
            navigate("/login")
          }
        });
    }
      
    return(
        <div>
            <h1>Hello World</h1>
            <button onClick={handleLogout}>logout</button>
        </div>
    )
}

export default Homepage;