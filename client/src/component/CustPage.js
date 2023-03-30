import { useEffect, useState } from "react"

function CustPage(){
    const [ custList, setCustList ] = useState([])
    
    useEffect(() => {
        fetch('/users')
        .then(resp => {
            if(resp.ok){
                resp.json().then(persons => setCustList(persons))
            }
        })
    },[])
    console.log(custList)
    return(
        <div>
            <h1>Customer</h1>
        </div>
    )
}

export default CustPage 