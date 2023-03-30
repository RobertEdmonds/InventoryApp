import { useEffect, useState } from "react";
import ShowProduct from "./ShowProduct";

function Product(){
    const [product, setProduct] = useState([])
    const [productId, setProductId] = useState(0)

    useEffect(() => {
        fetch("/products").then(r => {
            if(r.ok){
                r.json().then(tiles => setProduct(tiles))
            }
        })
    },[])

    function handleSingleProduct(id){
        setProductId(id)
    }

    return(
        <div className="container text-center">
            <div className="row">
                {product.map(tile => {
                    return(
                        <div className="col" key={tile.id}>
                            <div className="card" style={{width: "18rem"}}>
                                <img src={tile.pictures[0].picture_url} className="card-img-top" alt="tile"/>
                                <div className="card-body">
                                    <h5 className="card-title">{tile.name}</h5>
                                    <h6 className="card-title">${tile.cost}</h6>
                                    <p className="card-text">{tile.description}</p>
                                    <p className="card-text">{tile.inventory}</p>
                                    <button className="btn btn-primary" data-bs-toggle="modal" data-bs-target='#tileModal' onClick={() => handleSingleProduct(tile.id)}>Go somewhere</button>
                                </div>
                            </div>
                        </div>
                    )
                })}
                <ShowProduct product={product} productId={productId}/>
            </div>
        </div>
    )
}

export default Product;