import React, { useState, useContext } from "react";
import { useHistory } from "react-router-dom";
import { EmployeeContext } from "../context/Employee.js";

const CustomerContext = React.createContext();

function CustomerProvider({ children }) {
  const [customer, setCustomer] = useState(null);
  const { setEmployee } = useContext(EmployeeContext);
  const history = useHistory();

  function handleLogout() {
    fetch("/logout", { method: "DELETE" }).then((r) => {
      if (r.ok) {
        setEmployee(null);
        setCustomer(null);
        history.push("/");
      }
    });
  }

  return (
    <CustomerContext.Provider value={{ setCustomer, customer, handleLogout }}>
      {children}
    </CustomerContext.Provider>
  );
}

export { CustomerContext, CustomerProvider };