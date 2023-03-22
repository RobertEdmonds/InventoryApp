import { useContext, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { EmployeeContext } from "../context/Employee.js";

function Homepage(){
    const { setEmployee, employee } = useContext(EmployeeContext)
    const navigate = useNavigate()

    function handleLogout() {
        fetch("/logout", { method: "DELETE" }).then((r) => {
          if (r.ok) {
            setEmployee(null);
            navigate("/login")
          }
        });
      }
    
    useEffect(() => {
        if(!employee){
            navigate("/login")
        }
    },[navigate, employee])

    return(
        <div>
            <h1>Hello World</h1>
            <button onClick={handleLogout}>logout</button>
        </div>
    )
}

export default Homepage;