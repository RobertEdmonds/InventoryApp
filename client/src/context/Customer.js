import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

const CustomerContext = React.createContext();

function CustomerProvider({ children }) {
  const [customer, setCustomer] = useState(null);
  const navigate = useNavigate()

  function handleLogout() {
    fetch("/logout", { method: "DELETE" }).then((r) => {
      if (r.ok) {
        setCustomer(null);
        navigate("/");
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