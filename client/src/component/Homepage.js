import { useContext } from "react";
import { EmployeeContext } from "../context/Employee.js";

function Homepage(){
    const {employee, setEmployee} = useContext(EmployeeContext)
    function handleLogout() {
        fetch("/logout", { method: "DELETE" }).then((r) => {
          if (r.ok) {
            setEmployee(null);
          }
        });
      }

    console.log(employee)
    return(
        <div>
            <h1>Hello World</h1>
            <button onClick={handleLogout}>logout</button>
        </div>
    )
}

export default Homepage;